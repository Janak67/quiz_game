import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:quiz_game/screen/home/controller/home_controller.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  HomeController controller = Get.put(HomeController());
  int seconds = 30;
  Timer? timer;

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
              Obx(
                () => Text(
                  '${controller.homeModel!.resultsModel![controller.index.value].question}',
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.index.value++;
                      },
                      child: Text(
                          'A. ${controller.homeModel!.resultsModel![controller.index.value].incorrect_answers![0]}'),
                    ),
                    InkWell(
                      onTap: () {
                        controller.index.value++;
                      },
                      child: Text(
                          'B. ${controller.homeModel!.resultsModel![controller.index.value].incorrect_answers![1]}'),
                    ),
                    InkWell(
                      onTap: () {
                        controller.index.value++;
                      },
                      child: Text(
                          'C. ${controller.homeModel!.resultsModel![controller.index.value].incorrect_answers![2]}'),
                    ),
                    InkWell(
                      onTap: () {
                        controller.index.value++;
                      },
                      child: Text(
                          'D. ${controller.homeModel!.resultsModel![controller.index.value].correct_answer}'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
