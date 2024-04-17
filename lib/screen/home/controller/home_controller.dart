import 'package:get/get.dart';
import 'package:quiz_game/screen/home/model/home_model.dart';
import 'package:quiz_game/utils/api_helper.dart';

class HomeController extends GetxController {
  Rxn<HomeModel>? homeModel = Rxn();
  RxInt index = 0.obs;

  Future<void> quizApi() async {
    HomeModel? h1 = await ApiHelper.apiHelper.quizApiCall();
    homeModel?.value = h1;
    update();
  }

  Future<void> nextQuestions() async {
    if (homeModel!.value != null &&
        index.value != homeModel!.value!.resultsModel!.length - 1) {
      index.value++;
    }
  }
}
/*
  String calculateResult() {
    int correctAnswers = 0;
    for (var result in homeModel!.value!.resultsModel!) {
      if (result.incorrect_answers == result.correct_answer) {
        correctAnswers++;
      }
    }
    return '$correctAnswers/${homeModel!.value!.resultsModel!.length}';
  }
*/
