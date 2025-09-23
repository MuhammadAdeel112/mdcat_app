import 'question_model.dart';

class Test {
  final String id; // API _id
  final String title;
  final String level;
  final String subject;
  final String className;
  final int credits;
  final List<Question> questions;

  Test({
    required this.id,
    required this.title,
    required this.level,
    required this.subject,
    required this.className,
    required this.credits,
    required this.questions,
  });
  factory Test.fromApi(Map<String, dynamic> json) {
    return Test(
      id: json["_id"] ?? "",
      title: json["title"] ?? "",
      level: json["level"] ?? "",
      subject: json["subject"] ?? "",
      className: json["class"] ?? "",
      credits: json["credits"] ?? 0,
      questions: (json["questions"] as List<dynamic>? ?? [])
          .map((q) => Question.fromApi(q, json["_id"]))
          .toList(),
    );
  }
}
