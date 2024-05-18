import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_game/screen/home/controller/home_controller.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.deepOrange],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Congrats!',
                  style: TextStyle(
                      fontSize: 58,
                      fontFamily: 'theren',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Spacer(),
                const Text(
                  'YOUR SCORE',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      fontFamily: 'theren'),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${controller.totalResult.value}/${controller.quizList.length}',
                      style: const TextStyle(
                          fontSize: 48,
                          fontFamily: 'theren',
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '🪙 +90 points',
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'theren',
                          color: Colors.white),
                    )
                  ],
                ),
                Image.asset('assets/img/win.png', height: 200),
                const Spacer(),
                SizedBox(
                  width: 180,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.totalResult.value = 0;
                      controller.index.value = 0;
                      controller.second.value = 20;
                      controller.quizList.value = [];
                      Get.offAllNamed('home');
                    },
                    child: const Text(
                      'Play again',
                      style: TextStyle(fontSize: 26, fontFamily: 'theren'),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
