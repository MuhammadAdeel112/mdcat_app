class ResultModel {
  final int totalQuestions;
  final int correctAnswers;

  ResultModel({required this.totalQuestions, required this.correctAnswers});

  double get percentage => (correctAnswers / totalQuestions) * 100;
}
