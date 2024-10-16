import 'package:flutter/material.dart';
import 'package:todo/presentation/view/layout/home_layout.dart';
import 'package:todo/presentation/view/onboarding/onboarding_screen.dart';
import 'package:todo/shared/styles/theme.dart';

class ToDoApp extends StatelessWidget {
  final bool onBoarding;
  const ToDoApp({
    super.key,
    required this.onBoarding,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: themeData,
      home: onBoarding ? const HomeLayout() : const OnBoardingScreen(),
    );
  }
}
