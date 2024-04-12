import 'package:get/get.dart';
import 'package:quiz_game/screen/home/model/home_model.dart';
import 'package:quiz_game/utils/api_helper.dart';

class HomeController extends GetxController {
  HomeModel? homeModel;
  RxInt index = 0.obs;

  Future<void> quizApi() async {
    HomeModel? h1 = await ApiHelper.apiHelper.quizApiCall();
    homeModel = h1;
    update();
  }
}
