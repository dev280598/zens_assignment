import 'package:flutter/material.dart';
import 'package:zens_assignment/mobile/const/spacing.dart';
import 'package:zens_assignment/mobile/const/strings.dart';
import 'package:zens_assignment/mobile/extension/extension.dart';
import 'package:zens_assignment/mobile/model/joke_model.dart';

class JokeWidget extends StatelessWidget {
  const JokeWidget({
    super.key,
    required this.joke,
    required this.onVoted,
  });

  final JokeModel joke;
  final Function(String id) onVoted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.l),
      child: Column(
        children: [
          Expanded(
            child: Text(
              joke.content,
              style: context.textT.bodyMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      onVoted.call(joke.id);
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: context.colorS.secondary,
                    ),
                    child: const Text(Strings.funnyBtn),
                  ),
                ),
                Spacing.l.toSpaceX(),
                Expanded(
                  child: FilledButton(
                    child: const Text(Strings.notFunnyBtn),
                    onPressed: () {
                      onVoted.call(joke.id);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
