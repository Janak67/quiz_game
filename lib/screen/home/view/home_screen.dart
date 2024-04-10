import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: InkWell(
            onTap: () {
              Get.toNamed('quiz');
            },
            child: const Text(
              'Start',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
