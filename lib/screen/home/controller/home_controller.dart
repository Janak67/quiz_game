import 'dart:async';

import 'package:get/get.dart';
import 'package:quiz_game/screen/home/model/home_model.dart';
import 'package:quiz_game/utils/api_helper.dart';

class HomeController extends GetxController {
  Rxn<HomeModel> homeModel = Rxn();
  RxList<QuizModel> quizList = <QuizModel>[].obs;
  RxInt index = 0.obs;
  RxInt totalResult = 0.obs;
  RxInt second = 20.obs;

  Future<void> quizApi() async {
    HomeModel? h1 = await ApiHelper.apiHelper.quizApiCall();
    homeModel.value = h1;
    randomData();
    update();
  }

  void randomData() {
    if (homeModel.value != null) {
      List<QuizModel> result = [];
      for (ResultsModel r1 in homeModel.value!.resultsModel!) {
        List allOption = r1.incorrect_answers!;
        allOption.add(r1.correct_answer);
        allOption.shuffle();
        QuizModel q1 = QuizModel(
          question: r1.question,
          correct_answer: r1.correct_answer,
          option: allOption,
        );
        result.add(q1);
      }
      quizList.value = result;
    }
  }

  void getResult(String answer) {
    if (answer == quizList[index.value].correct_answer) {
      totalResult.value++;
    }
  }

  void setTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (second > 0 && index.value != quizList.length) {
        second.value--;
      } else {
        if (index.value != quizList.length - 1) {
          index.value++;
        } else {
          timer.cancel();
          Get.toNamed('result');
        }
        second.value = 20;
      }
    });
  }
}
