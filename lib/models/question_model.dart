// import 'answer_option_model.dart';

// class Question {
//   final int id;
//   final String text;
//   final List<AnswerOption> options;

//   Question({required this.id, required this.text, required this.options});

//   // Factory method to create from API JSON
//   factory Question.fromApi(Map<String, dynamic> json) {
//     final options =
//         (json["options"] as List<dynamic>?)?.asMap().entries.map((entry) {
//           final i = entry.key;
//           final optionText = entry.value ?? "";
//           final correctIndex = ((json["correctOption"] ?? 1) - 1);
//           return AnswerOption(
//             label: String.fromCharCode(65 + i) + ".", // A., B., C., D.
//             text: optionText,
//             isCorrect: i == correctIndex,
//           );
//         }).toList() ??
//         [];

//     return Question(
//       id: json["_id"].hashCode, // unique ID
//       text: json["question"] ?? "",
//       options: options,
//     );
//   }
// }
// import 'answer_option_model.dart';

// class Question {
//   final int id;
//   final String text;
//   final List<AnswerOption> options;
//   final String testId; // ✅ added testId

//   Question({
//     required this.id,
//     required this.text,
//     required this.options,
//     required this.testId, // ✅ required
//   });

//   // Factory method to create from API JSON
//   factory Question.fromApi(Map<String, dynamic> json, String testId) {
//     final options =
//         (json["options"] as List<dynamic>?)?.asMap().entries.map((entry) {
//           final i = entry.key;
//           final optionText = entry.value ?? "";
//           final correctIndex = ((json["correctOption"] ?? 1) - 1);
//           return AnswerOption(
//             label: String.fromCharCode(65 + i) + ".", // A., B., C., D.
//             text: optionText,
//             isCorrect: i == correctIndex,
//           );
//         }).toList() ??
//         [];

//     return Question(
//       id: json["_id"].hashCode, // unique ID
//       text: json["question"] ?? "",
//       options: options,
//       testId: testId, // ✅ assign testId from the parent test
//     );
//   }
// }

// import 'answer_option_model.dart';

// class Question {
//   final String id; // Use String because API _id is a string
//   final String text;
//   final List<AnswerOption> options;

//   Question({
//     required this.id,
//     required this.text,
//     required this.options,
//   });

//   factory Question.fromApi(Map<String, dynamic> json, test) {
//     final options =
//         (json["options"] as List<dynamic>?)?.asMap().entries.map((entry) {
//       final i = entry.key;
//       final optionText = entry.value ?? "";
//       final correctIndex = ((json["correctOption"] ?? 1) - 1);
//       return AnswerOption(
//         label: String.fromCharCode(65 + i) + ".", // A., B., C., D.
//         text: optionText,
//         isCorrect: i == correctIndex,
//       );
//     }).toList() ?? [];

//     return Question(
//       id: json["_id"] ?? "", // ✅ use API _id
//       text: json["question"] ?? "",
//       options: options,
//     );
//   }
// }
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
