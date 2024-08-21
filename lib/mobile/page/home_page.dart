import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zens_assignment/mobile/const/asset_path.dart';
import 'package:zens_assignment/mobile/const/spacing.dart';
import 'package:zens_assignment/mobile/const/strings.dart';
import 'package:zens_assignment/mobile/db/prefs.dart';
import 'package:zens_assignment/mobile/extension/extension.dart';
import 'package:zens_assignment/mobile/model/joke_model.dart';
import 'package:zens_assignment/mobile/widget/joke_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late PageController _pageViewController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  // Fetch content from the json file
  Future<List<JokeModel>> _fetchData() async {
    final String response = await rootBundle.loadString(AssetPath.jsonData);
    final data = await json.decode(response);
    final jokes =
        List.from(data["jokes"]).map((e) => JokeModel.fromJson(e)).toList();
    final votedJokes = await Prefs.getListVoted();
    jokes.removeWhere((element) => votedJokes.contains(element.id));
    return jokes;
  }

  Future<void> _saveVote(String jokeId, bool isNoMore) async {
    await Prefs.setJokeVoted(jokeId);
    if(!isNoMore) {
      _pageViewController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: Spacing.m),
          child: Image.asset(AssetPath.appLogo),
        ),
        actions: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                Strings.handicraftBy,
                style: context.textT.labelSmall?.setColor(
                  context.colorS.outline,
                ),
              ),
              Text(
                Strings.authorName,
                style: context.textT.labelSmall,
                textAlign: TextAlign.right,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: Spacing.m,
              left: Spacing.xs,
            ),
            child: CircleAvatar(
              radius: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(AssetPath.trailingIc),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const _HeaderSliver(),
          FutureBuilder<List<JokeModel>>(
            future: _fetchData(),
            builder: (context, AsyncSnapshot<List<JokeModel>> snapshot) {
              Widget children = const SizedBox.shrink();
              if (snapshot.hasData) {
                final jokes = snapshot.data ?? [];
                if (jokes.isNotEmpty) {
                  children = PageView(
                    controller: _pageViewController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: jokes
                        .map(
                          (e) => JokeWidget(
                            joke: e,
                            onVoted: (id) => _saveVote(id, id == jokes.last.id),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  children = Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.l),
                    child: Center(
                      child: Text(
                        Strings.empty,
                        style: context.textT.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              }
              return SliverFillRemaining(
                fillOverscroll: false,
                child: children,
              );
            },
          )
        ],
      ),
      bottomNavigationBar: const _MyBottomView(),
    );
  }
}


class _HeaderSliver extends StatelessWidget {
  const _HeaderSliver({super.key});

  @override
  Widget build(BuildContext context) {
    const height = 130.0;
    return SliverAppBar(
      backgroundColor: context.colorS.primary,
      expandedHeight: height,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.m),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.title,
                style: context.textT.titleMedium
                    ?.setColor(context.colorS.onPrimary),
              ),
              Spacing.m.toSpaceY(),
              Text(
                Strings.subTitle,
                style: context.textT.labelMedium
                    ?.setColor(context.colorS.onPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _MyBottomView extends StatelessWidget {
  const _MyBottomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: context.colorS.outline,
            width: 0.1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.m,
        vertical: Spacing.xs,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Strings.footer,
            style: context.textT.labelMedium?.setColor(context.colorS.outline),
          ),
          Spacing.xs.toSpaceY(),
          Text(
            Strings.copyRight,
            style: context.textT.bodyMedium,
          ),
        ],
      ),
    );
  }
}
