import 'dart:async';
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
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          controller.index.value++;
          timer.cancel();
          seconds = 30;
          startTimer();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.deepOrange],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Obx(
            () => controller.homeModel!.value == null
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              '$seconds',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 25),
                            ),
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: CircularProgressIndicator(
                                value: seconds / 30,
                                valueColor:
                                    const AlwaysStoppedAnimation(Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Obx(
                          () => Text(
                            '${controller.homeModel!.value!.resultsModel![controller.index.value].question}',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          alignment: Alignment.center,
                          width: MediaQuery.sizeOf(context).width - 100,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.index.value++;
                                    controller.nextQuestions();
                                  },
                                  child: Text(
                                      'A. ${controller.homeModel!.value!.resultsModel![controller.index.value].incorrect_answers![0]}'),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.index.value++;
                                    controller.nextQuestions();
                                  },
                                  child: Text(
                                      'B. ${controller.homeModel!.value!.resultsModel![controller.index.value].incorrect_answers![1]}'),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.index.value++;
                                    controller.nextQuestions();
                                  },
                                  child: Text(
                                      'C. ${controller.homeModel!.value!.resultsModel![controller.index.value].incorrect_answers![2]}'),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.index.value++;
                                    controller.nextQuestions();
                                  },
                                  child: Text(
                                      'D. ${controller.homeModel!.value!.resultsModel![controller.index.value].correct_answer}'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }
}
