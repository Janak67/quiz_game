import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_game/screen/home/model/home_model.dart';

class ApiHelper {
  Future<void> quizApiCall() async {
    String apiLink =
        "https://opentdb.com/api.php?amount=10&category=24&type=multiple";
    var response = await http.get(Uri.parse(apiLink));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      HomeModel.mapToModel(json);
    }
  }
}
