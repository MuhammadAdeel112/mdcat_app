// import 'package:mdcat/models/answer_option_model.dart';

// // import 'answer_option.dart';

// class Question {
//   final int id;
//   final String text;
//   final List<AnswerOption> options;

//   Question({
//     required this.id,
//     required this.text,
//     required this.options,
//   });
// }

// import 'package:mdcat/models/answer_option_model.dart';

// // import 'answer_option.dart';

// class Question {
//   final int id;
//   final String text;
//   final List<AnswerOption> options;

//   Question({
//     required this.id,
//     required this.text,
//     required this.options,
//   });
// }

// import 'package:mdcat/models/answer_option_model.dart';

// // import 'answer_option.dart';

// class Question {
//   final int id;
//   final String text;
//   final List<AnswerOption> options;

//   Question({required this.id, required this.text, required this.options});
// }

// import 'package:mdcat/models/answer_option_model.dart';

// class Question {
//   final int id;
//   final String text;
//   final List<AnswerOption> options;

//   Question({required this.id, required this.text, required this.options});
// }
// import 'package:mdcat/models/answer_option_model.dart';

// class Question {
//   final int id;
//   final String text;
//   final List<AnswerOption> options;

//   Question({required this.id, required this.text, required this.options});

//   factory Question.fromJson(Map<String, dynamic> json) {
//     return Question(
//       id: json['id'] is int
//           ? json['id']
//           : int.tryParse(json['id'].toString()) ?? 0,
//       text: json['text'] ?? '',
//       options:
//           (json['options'] as List<dynamic>?)
//               ?.map((opt) => AnswerOption.fromJson(opt))
//               .toList() ??
//           [],
//     );
//   }
// }
// import 'package:mdcat/models/answer_option_model.dart';

// class Question {
//   final String id;
//   final String text;
//   final List<AnswerOption> options;
//   final int correctOption;
//   final String correctAnsDescription;

//   Question({
//     required this.id,
//     required this.text,
//     required this.options,
//     required this.correctOption,
//     required this.correctAnsDescription,
//   });

//   factory Question.fromJson(Map<String, dynamic> json) {
//     return Question(
//       id: json["_id"] ?? "",
//       text: json["question"] ?? "",
//       options: (json["options"] as List<dynamic>? ?? [])
//           .asMap()
//           .entries
//           .map((e) => AnswerOption(
//                 label: String.fromCharCode(65 + e.key), // A, B, C, D
//                 text: e.value ?? "",
//                 isCorrect: (e.key + 1) == (json["correctOption"] ?? 1),
//               ))
//           .toList(),
//       correctOption: json["correctOption"] ?? 1,
//       correctAnsDescription: json["correctAnsDescription"] ?? "",
//     );
//   }
// }
// import 'answer_option_model.dart';

// class Question {
//   final String id; // _id from API
//   final String text; // question text
//   final List<AnswerOption> options;
//   final int correctOption; // index of correct option
//   final String correctAnsDescription;

//   Question({
//     required this.id,
//     required this.text,
//     required this.options,
//     required this.correctOption,
//     required this.correctAnsDescription,
//   });

//   // Factory to parse API response
//   factory Question.fromJson(Map<String, dynamic> json) {
//     final optionsList = (json['options'] as List<dynamic>? ?? []);
//     List<AnswerOption> answerOptions = [];

//     for (int i = 0; i < optionsList.length; i++) {
//       answerOptions.add(
//         AnswerOption(
//           label: String.fromCharCode(65 + i), // A, B, C, D
//           text: optionsList[i] ?? '',
//           isCorrect:
//               i ==
//               ((json['correctOption'] ?? 1) - 1), // correctOption is 1-based
//         ),
//       );
//     }

//     return Question(
//       id: json['_id'] ?? '',
//       text: json['question'] ?? '',
//       options: answerOptions,
//       correctOption: ((json['correctOption'] ?? 1) - 1),
//       correctAnsDescription: json['correctAnsDescription'] ?? '',
//     );
//   }
// }
import 'answer_option_model.dart';

class Question {
  final int id;
  final String text;
  final List<AnswerOption> options;

  Question({required this.id, required this.text, required this.options});

  // Factory method to create from API JSON
  factory Question.fromApi(Map<String, dynamic> json) {
    final options =
        (json["options"] as List<dynamic>?)?.asMap().entries.map((entry) {
          final i = entry.key;
          final optionText = entry.value ?? "";
          final correctIndex = ((json["correctOption"] ?? 1) - 1);
          return AnswerOption(
            label: String.fromCharCode(65 + i) + ".", // A., B., C., D.
            text: optionText,
            isCorrect: i == correctIndex,
          );
        }).toList() ??
        [];

    return Question(
      id: json["_id"].hashCode, // unique ID
      text: json["question"] ?? "",
      options: options,
    );
  }
}
