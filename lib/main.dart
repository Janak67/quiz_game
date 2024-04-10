import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_game/utils/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: screen_routes,
    ),
  );
}
