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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.cancel_outlined, size: 35),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              '$seconds',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 24),
                            ),
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(
                                value: seconds / 30,
                                valueColor:
                                    const AlwaysStoppedAnimation(Colors.black),
                              ),
                            ),
                          ],
                        ),
                        Image.asset('assets/img/idea.webp', width: 200),
                        const SizedBox(height: 25),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Question :-',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                        ),
                        Obx(
                          () => Text(
                            '${controller.homeModel!.value!.resultsModel![controller.index.value].question}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              options(
                                  'A. ${controller.homeModel!.value!.resultsModel![controller.index.value].incorrect_answers![0]}'),
                              options(
                                  'B. ${controller.homeModel!.value!.resultsModel![controller.index.value].incorrect_answers![1]}'),
                              options(
                                  'C. ${controller.homeModel!.value!.resultsModel![controller.index.value].incorrect_answers![2]}'),
                              options(
                                  'D. ${controller.homeModel!.value!.resultsModel![controller.index.value].correct_answer}'),
                            ],
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

  InkWell options(String text) {
    return InkWell(
      onTap: () {
        controller.index.value++;
        controller.nextQuestions();
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 18),
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
