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
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Text(
                '${controller.totalResult.value} / ${controller.quizList.length}',
                style: const TextStyle(fontSize: 25),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.totalResult.value = 0;
                  controller.index.value = 0;
                  controller.second.value = 20;
                  controller.quizList.value = [];
                  Get.offAllNamed('home');
                },
                child: const Text('Replay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}