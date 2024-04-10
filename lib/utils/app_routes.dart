import 'package:flutter/material.dart';
import 'package:quiz_game/screen/home/view/home_screen.dart';
import 'package:quiz_game/screen/quiz/view/quiz_screen.dart';

Map<String, WidgetBuilder> screen_routes = {
  '/': (context) => const HomeScreen(),
  'quiz': (context) => const QuizScreen(),
};
