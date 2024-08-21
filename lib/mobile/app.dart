import 'package:flutter/material.dart';
import 'package:zens_assignment/mobile/const/strings.dart';
import 'package:zens_assignment/mobile/page/home_page.dart';
import 'package:zens_assignment/mobile/theme/app_theme.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appTitle,
      theme: AppTheme.light,
      home: const HomePage(),
    );
  }
}
