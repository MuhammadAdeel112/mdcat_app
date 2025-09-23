// // import 'package:flutter/material.dart';
// // import 'package:mdcat/models/answer_option_model.dart';
// // import 'package:mdcat/models/question_model.dart';

// // class TestResultViewModel extends ChangeNotifier {
// //   final List<Question> _questions = [
// //     Question(
// //       id: "1",
// //       text:
// //           "In front of you, a large combine harvester wants to turn right. What is right?",
// //       options: [
// //         AnswerOption(
// //           label: "A.",
// //           text: "You must stay behind it.",
// //           isCorrect: true,
// //         ),
// //         AnswerOption(
// //           label: "B.",
// //           text: "You may overtake immediately.",
// //           isCorrect: false,
// //         ),
// //         AnswerOption(
// //           label: "C.",
// //           text: "You may ignore its signal.",
// //           isCorrect: false,
// //         ),
// //         AnswerOption(
// //           label: "D.",
// //           text: "You may ignore its signal.",
// //           isCorrect: false,
// //         ),
// //       ],
// //       correctOption: 0, // index of correct option (0-based)
// //       correctAnsDescription: "You must stay behind it.",
// //     ),
// //     Question(
// //       id: "2",
// //       text: "You are approaching a zebra crossing. What must you do?",
// //       options: [
// //         AnswerOption(
// //           label: "A.",
// //           text: "Stop for pedestrians.",
// //           isCorrect: true,
// //         ),
// //         AnswerOption(
// //           label: "B.",
// //           text: "Speed up to cross quickly.",
// //           isCorrect: false,
// //         ),
// //         AnswerOption(
// //           label: "C.",
// //           text: "Speed up to cross quickly.",
// //           isCorrect: false,
// //         ),
// //         AnswerOption(
// //           label: "D.",
// //           text: "Speed up to cross quickly.",
// //           isCorrect: false,
// //         ),
// //       ],
// //       correctOption: 0,
// //       correctAnsDescription: "Stop for pedestrians.",
// //     ),
// //   ];

// //   // final List<Question> _questions = [
// //   //   Question(
// //   //     id: 1,
// //   //     text:
// //   //         "In front of you, a large combine harvester wants to turn right. What is right?",
// //   //     options: [
// //   //       AnswerOption(
// //   //         label: "A.",
// //   //         text: "You must stay behind it.",
// //   //         isCorrect: true,
// //   //       ),
// //   //       AnswerOption(
// //   //         label: "B.",
// //   //         text: "You may overtake immediately.",
// //   //         isCorrect: false,
// //   //       ),
// //   //       AnswerOption(
// //   //         label: "C.",
// //   //         text: "You may ignore its signal.",
// //   //         isCorrect: false,
// //   //       ),
// //   //       AnswerOption(
// //   //         label: "D.",
// //   //         text: "You may ignore its signal.",
// //   //         isCorrect: false,
// //   //       ),
// //   //     ],
// //   //   ),
// //   //   Question(
// //   //     id: 2,
// //   //     text: "You are approaching a zebra crossing. What must you do?",
// //   //     options: [
// //   //       AnswerOption(
// //   //         label: "A.",
// //   //         text: "Stop for pedestrians.",
// //   //         isCorrect: true,
// //   //       ),
// //   //       AnswerOption(
// //   //         label: "B.",
// //   //         text: "Speed up to cross quickly.",
// //   //         isCorrect: false,
// //   //       ),
// //   //       AnswerOption(
// //   //         label: "C",
// //   //         text: "Speed up to cross quickly.",
// //   //         isCorrect: false,
// //   //       ),
// //   //       AnswerOption(
// //   //         label: "D",
// //   //         text: "Speed up to cross quickly.",
// //   //         isCorrect: false,
// //   //       ),
// //   //     ],
// //   //   ),
// //   // ];

// //   List<Question> get questions => _questions;

// //   void selectAnswer(int questionId, int optionIndex) {
// //     final question = _questions.firstWhere((q) => q.id == questionId);
// //     for (var i = 0; i < question.options.length; i++) {
// //       question.options[i].isSelected = (i == optionIndex);
// //     }
// //     notifyListeners();
// //   }

// //   int get correctCount {
// //     int total = 0;
// //     for (var q in _questions) {
// //       final selected = q.options.where((o) => o.isSelected);
// //       if (selected.isNotEmpty && selected.first.isCorrect) total++;
// //     }
// //     return total;
// //   }

// //   int get totalQuestions => _questions.length;
// // }
// import 'package:flutter/material.dart';
// import 'package:mdcat/models/answer_option_model.dart';
// import 'package:mdcat/models/question_model.dart';

// class TestResultViewModel extends ChangeNotifier {
//   final List<Question> _questions = [
//     Question(
//       id: "1",
//       text:
//           "In front of you, a large combine harvester wants to turn right. What is right?",
//       options: [
//         AnswerOption(
//           label: "A.",
//           text: "You must stay behind it.",
//           isCorrect: true,
//         ),
//         AnswerOption(
//           label: "B.",
//           text: "You may overtake immediately.",
//           isCorrect: false,
//         ),
//         AnswerOption(
//           label: "C.",
//           text: "You may ignore its signal.",
//           isCorrect: false,
//         ),
//         AnswerOption(
//           label: "D.",
//           text: "You may ignore its signal.",
//           isCorrect: false,
//         ),
//       ],
//       correctOption: 0, // ✅ required
//       correctAnsDescription: "You must stay behind it.", // ✅ required
//     ),
//     Question(
//       id: "2",
//       text: "You are approaching a zebra crossing. What must you do?",
//       options: [
//         AnswerOption(
//           label: "A.",
//           text: "Stop for pedestrians.",
//           isCorrect: true,
//         ),
//         AnswerOption(
//           label: "B.",
//           text: "Speed up to cross quickly.",
//           isCorrect: false,
//         ),
//         AnswerOption(
//           label: "C.",
//           text: "Speed up to cross quickly.",
//           isCorrect: false,
//         ),
//         AnswerOption(
//           label: "D.",
//           text: "Speed up to cross quickly.",
//           isCorrect: false,
//         ),
//       ],
//       correctOption: 0,
//       correctAnsDescription: "Stop for pedestrians.",
//     ),
//   ];

//   List<Question> get questions => _questions;

//   void selectAnswer(String questionId, int optionIndex) {
//     final question = _questions.firstWhere((q) => q.id == questionId);
//     for (var i = 0; i < question.options.length; i++) {
//       question.options[i].isSelected = (i == optionIndex);
//     }
//     notifyListeners();
//   }

//   int get correctCount {
//     int total = 0;
//     for (var q in _questions) {
//       final selected = q.options.where((o) => o.isSelected);
//       if (selected.isNotEmpty && selected.first.isCorrect) total++;
//     }
//     return total;
//   }

//   int get totalQuestions => _questions.length;
// }
// import 'package:flutter/material.dart';
// import 'package:mdcat/models/answer_option_model.dart';
// import 'package:mdcat/models/question_model.dart';

// class TestResultViewModel extends ChangeNotifier {
//   final List<Question> _questions = [
//     Question(
//       id: 1,
//       text:
//           "In front of you, a large combine harvester wants to turn right. What is right?",
//           testId: "demo_test_1",
//       options: [
//         AnswerOption(
//           label: "A.",
//           text: "You must stay behind it.",
//           isCorrect: true,
//         ),
//         AnswerOption(
//           label: "B.",
//           text: "You may overtake immediately.",
//           isCorrect: false,
//         ),
//         AnswerOption(
//           label: "C.",
//           text: "You may ignore its signal.",
//           isCorrect: false,
//         ),
//         AnswerOption(
//           label: "D.",
//           text: "You may ignore its signal.",
//           isCorrect: false,
//         ),
//       ],
//     ),
//     Question(
//       id: 2,
//       text: "You are approaching a zebra crossing. What must you do?",
//       testId: "demo_test_1",
//       options: [
//         AnswerOption(
//           label: "A.",
//           text: "Stop for pedestrians.",
//           isCorrect: true,
//         ),
//         AnswerOption(
//           label: "B.",
//           text: "Speed up to cross quickly.",
//           isCorrect: false,
//         ),
//         AnswerOption(
//           label: "C.",
//           text: "Sound the horn to warn pedestrians.",
//           isCorrect: false,
//         ),
//         AnswerOption(
//           label: "D.",
//           text: "Ignore pedestrians and continue.",
//           isCorrect: false,
//         ),
//       ],
//     ),
//   ];

//   List<Question> get questions => _questions;

//   void selectAnswer(int questionId, int optionIndex) {
//     final question = _questions.firstWhere((q) => q.id == questionId);
//     for (var i = 0; i < question.options.length; i++) {
//       question.options[i].isSelected = (i == optionIndex);
//     }
//     notifyListeners();
//   }

//   int get correctCount {
//     int total = 0;
//     for (var q in _questions) {
//       final selected = q.options.where((o) => o.isSelected);
//       if (selected.isNotEmpty && selected.first.isCorrect) total++;
//     }
//     return total;
//   }

//   int get totalQuestions => _questions.length;
// }
import 'package:flutter/material.dart';
import 'package:mdcat/models/question_model.dart';

class TestResultViewModel extends ChangeNotifier {
  final List<Question> _questions = [];

  List<Question> get questions => _questions;

  // ✅ Add questions dynamically from API
  void setQuestions(List<Question> newQuestions) {
    _questions.clear();
    _questions.addAll(newQuestions);
    notifyListeners();
  }

  void selectAnswer(String questionId, int optionIndex) {
    final question = _questions.firstWhere((q) => q.id == questionId);
    for (var i = 0; i < question.options.length; i++) {
      question.options[i].isSelected = (i == optionIndex);
    }
    notifyListeners();
  }

  int get correctCount {
    int total = 0;
    for (var q in _questions) {
      final selected = q.options.where((o) => o.isSelected);
      if (selected.isNotEmpty && selected.first.isCorrect) total++;
    }
    return total;
  }

  int get totalQuestions => _questions.length;
}
