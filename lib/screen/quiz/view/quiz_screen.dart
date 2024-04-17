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
  int seconds = 20;
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
          seconds = 20;
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
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.deepOrange],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Center(
            child: SingleChildScrollView(
              child: Obx(
                () {
                  if (controller.homeModel!.value == null ||
                      controller.index.value >=
                          controller.homeModel!.value!.resultsModel!.length) {
                    return const CircularProgressIndicator();
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon:
                                    const Icon(Icons.cancel_outlined, size: 35),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    '$seconds',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      value: seconds / 20,
                                      valueColor: const AlwaysStoppedAnimation(
                                          Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Image.asset('assets/img/idea.webp', width: 200),
                          const SizedBox(height: 25),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Question :-',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            ),
                          ),
                          Text(
                            '${controller.index.value}.  ${controller.homeModel!.value!.resultsModel![controller.index.value].question}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                          Column(
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
                              ElevatedButton(
                                onPressed: () {
                                  controller.nextQuestions();
                                  seconds = 20;
                                  startTimer();
                                },
                                child: const Text('Next Question'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
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
        controller.nextQuestions();
        seconds = 20;
        startTimer();
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
}
