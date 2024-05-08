import 'package:flutter/material.dart';
import 'package:quiz_game/screen/home/view/home_screen.dart';
import 'package:quiz_game/screen/quiz/view/quiz_screen.dart';
import 'package:quiz_game/screen/result/view/result_screen.dart';
import 'package:quiz_game/screen/splash/view/splash_screen.dart';

Map<String, WidgetBuilder> screen_routes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
  'quiz': (context) => const QuizScreen(),
  'result': (context) => const ResultScreen(),
};
