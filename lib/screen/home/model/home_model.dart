class HomeModel {
  int? response_code;
  List<ResultsModel>? resultsModel;

  HomeModel({this.response_code, this.resultsModel});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
      response_code: m1['response_code'],
      resultsModel: m1['results'],
    );
  }
}

class ResultsModel {
  String? type, difficulty, category, question, correct_answer;
  List<String>? incorrect_answers;

  ResultsModel(
      {this.type,
      this.difficulty,
      this.category,
      this.question,
      this.correct_answer,
      this.incorrect_answers});

  factory ResultsModel.mapToModel(Map m1) {
    return ResultsModel(
        type: m1['type'],
        difficulty: m1['difficulty'],
        category: m1['category'],
        question: m1['question'],
        correct_answer: m1['correct_answer'],
        incorrect_answers: m1['incorrect_answers']);
  }
}
