import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_game/screen/home/controller/home_controller.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  HomeController controller = Get.put(HomeController());
  int seconds = 30;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    '$seconds',
                    style: const TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      value: seconds / 30,
                      valueColor: const AlwaysStoppedAnimation(Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                '${controller.homeModel!.resultsModel![0].question}',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'A. ${controller.homeModel!.resultsModel![0].incorrect_answers![0]}'),
                  Text(
                      'B. ${controller.homeModel!.resultsModel![0].incorrect_answers![1]}'),
                  Text(
                      'C. ${controller.homeModel!.resultsModel![0].incorrect_answers![2]}'),
                  Text(
                      'D. ${controller.homeModel!.resultsModel![0].correct_answer}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
