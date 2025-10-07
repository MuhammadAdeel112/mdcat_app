import 'package:mdcat/models/answer_option_model.dart';

class Question {
  final String id;
  final String text;
  final List<AnswerOption> options;
  final String? testId;

  Question({
    required this.id,
    required this.text,
    required this.options,
    this.testId,
  });

  factory Question.fromApi(Map<String, dynamic> json, String? testId) {
    final options = (json["options"] as List<dynamic>? ?? [])
        .asMap()
        .entries
        .map((entry) {
          final i = entry.key;
          final correctIndex = ((json["correctOption"] ?? 1) - 1);
          return AnswerOption(
            label: String.fromCharCode(65 + i) + ".",
            text: entry.value ?? "",
            isCorrect: i == correctIndex,
          );
        })
        .toList();

    return Question(
      id: json["_id"] ?? "",
      text: json["question"] ?? "",
      options: options,
      testId: testId,
    );
  }
}
