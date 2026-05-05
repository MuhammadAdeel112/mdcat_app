// import 'question_model.dart';
//
// class Test {
//   final String id; // API _id
//   final String title;
//   final String level;
//   final String subject;
//   final String className;
//   final int credits;
//   final List<Question> questions;
//
//   Test({
//     required this.id,
//     required this.title,
//     required this.level,
//     required this.subject,
//     required this.className,
//     required this.credits,
//     required this.questions,
//   });
//   factory Test.fromApi(Map<String, dynamic> json) {
//     return Test(
//       id: json["_id"] ?? "",
//       title: json["title"] ?? "",
//       level: json["level"] ?? "",
//       subject: json["subject"] ?? "",
//       className: json["class"] ?? "",
//       credits: json["credits"] ?? 0,
//       questions: (json["questions"] as List<dynamic>? ?? [])
//           .map((q) => Question.fromApi(q, json["_id"]))
//           .toList(),
//     );
//   }
// }
// lib/models/test_result_model.dart
// class TestResult {
//   final String testId;
//   final String title;
//   final String subject;
//   final int totalQuestions;
//   final List<TestAttempt> attempts;
//   final Map<String, dynamic> summary;
//
//   TestResult({
//     required this.testId,
//     required this.title,
//     required this.subject,
//     required this.totalQuestions,
//     required this.attempts,
//     required this.summary,
//   });
//
//   factory TestResult.fromJson(Map<String, dynamic> json) {
//     return TestResult(
//       testId: json['test']['id'] ?? '',
//       title: json['test']['title'] ?? '',
//       subject: json['test']['subject'] ?? '',
//       totalQuestions: json['test']['totalQuestions'] ?? 0,
//       attempts: (json['attempts'] as List? ?? [])
//           .map((e) => TestAttempt.fromJson(e))
//           .toList(),
//       summary: json['summary'] ?? {},
//     );
//   }
// }
//
// class TestAttempt {
//   final int attemptNumber;
//   final String attemptId;
//   final int score;
//   final String status;
//   final List<AnswerDetail> answers;
//   final DateTime startedAt;
//
//   TestAttempt({
//     required this.attemptNumber,
//     required this.attemptId,
//     required this.score,
//     required this.status,
//     required this.answers,
//     required this.startedAt,
//   });
//
//   factory TestAttempt.fromJson(Map<String, dynamic> json) {
//     return TestAttempt(
//       attemptNumber: json['attemptNumber'] ?? 0,
//       attemptId: json['attemptId'] ?? '',
//       score: json['score'] ?? 0,
//       status: json['status'] ?? '',
//       answers: (json['answers'] as List? ?? [])
//           .map((e) => AnswerDetail.fromJson(e))
//           .toList(),
//       startedAt: DateTime.parse(json['startedAt']),
//     );
//   }
// }
//
// class AnswerDetail {
//   final String questionId;
//   final String questionText;
//   final List<String> options;
//   final int selectedOption;   // 1-based (1,2,3,4)
//   final int correctOption;
//   final bool isCorrect;
//
//   AnswerDetail({
//     required this.questionId,
//     required this.questionText,
//     required this.options,
//     required this.selectedOption,
//     required this.correctOption,
//     required this.isCorrect,
//   });
//
//   factory AnswerDetail.fromJson(Map<String, dynamic> json) {
//     return AnswerDetail(
//       questionId: json['questionId'] ?? '',
//       questionText: json['questionText'] ?? '',
//       options: List<String>.from(json['options'] ?? []),
//       selectedOption: json['selectedOption'] ?? 0,
//       correctOption: json['correctOption'] ?? 0,
//       isCorrect: json['isCorrect'] ?? false,
//     );
//   }
// }
// lib/models/test_result_model.dart
class TestResult {
  final String testId;
  final String title;
  final String subject;
  final int totalQuestions;
  final List<TestAttempt> attempts;
  final Map<String, dynamic> summary;

  TestResult({
    required this.testId,
    required this.title,
    required this.subject,
    required this.totalQuestions,
    required this.attempts,
    required this.summary,
  });

  factory TestResult.fromJson(Map<String, dynamic> json) {
    return TestResult(
      testId: json['test']['id'] ?? '',
      title: json['test']['title'] ?? '',
      subject: json['test']['subject'] ?? '',
      totalQuestions: json['test']['totalQuestions'] ?? 0,
      attempts: (json['attempts'] as List? ?? [])
          .map((e) => TestAttempt.fromJson(e))
          .toList(),
      summary: json['summary'] ?? {},
    );
  }
}

class TestAttempt {
  final int attemptNumber;
  final String attemptId;
  final int score;
  final String status;
  final List<AnswerDetail> answers;
  final DateTime startedAt;

  TestAttempt({
    required this.attemptNumber,
    required this.attemptId,
    required this.score,
    required this.status,
    required this.answers,
    required this.startedAt,
  });

  factory TestAttempt.fromJson(Map<String, dynamic> json) {
    return TestAttempt(
      attemptNumber: json['attemptNumber'] ?? 0,
      attemptId: json['attemptId'] ?? '',
      score: json['score'] ?? 0,
      status: json['status'] ?? '',
      answers: (json['answers'] as List? ?? [])
          .map((e) => AnswerDetail.fromJson(e))
          .toList(),
      startedAt: DateTime.parse(json['startedAt']),
    );
  }
}

class AnswerDetail {
  final String questionId;
  final String questionText;
  final List<String> options;
  final int selectedOption;
  final int correctOption;
  final bool isCorrect;

  AnswerDetail({
    required this.questionId,
    required this.questionText,
    required this.options,
    required this.selectedOption,
    required this.correctOption,
    required this.isCorrect,
  });

  factory AnswerDetail.fromJson(Map<String, dynamic> json) {
    return AnswerDetail(
      questionId: json['questionId'] ?? '',
      questionText: json['questionText'] ?? '',
      options: List<String>.from(json['options'] ?? []),
      selectedOption: json['selectedOption'] ?? 0,
      correctOption: json['correctOption'] ?? 0,
      isCorrect: json['isCorrect'] ?? false,
    );
  }
}