// import 'package:flutter/material.dart';
// import 'package:mdcat/models/answer_option_model.dart';
// import 'package:mdcat/providers/quiz_provider.dart';
// import '../models/question.dart';
// import '../models/answer_option.dart';

// class TestResultViewModel extends ChangeNotifier {
//   final List<Question> _questions = [
//     Question(
//       id: 1,
//       text:
//           "In front of you, a large combine harvester wants to turn right. What is right?",
//       options: [
//         AnswerOption(text: "A. In front of you, a large combine.", isCorrect: true),
//         AnswerOption(text: "B. In front of you, a large combine.", isCorrect: false),
//         AnswerOption(text: "C. In front of you, a large combine.", isCorrect: false),
//       ],
//     ),
//     Question(
//       id: 2,
//       text:
//           "In front of you, a large combine harvester wants to turn right. What is right?",
//       options: [
//         AnswerOption(text: "A. In front of you, a large combine.", isCorrect: true),
//         AnswerOption(text: "B. In front of you, a large combine.", isCorrect: false),
//       ],
//     ),
//   ];

//   List<Question> get questions => _questions;

//   void selectAnswer(int questionId, int optionIndex) {
//     final question = _questions.firstWhere((q) => q.id == questionId);
//     for (var option in question.options) {
//       option.isSelected = false;
//     }
//     question.options[optionIndex].isSelected = true;
//     notifyListeners();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:mdcat/models/answer_option_model.dart';
// import 'package:mdcat/models/question_model.dart';
// // import '../models/question.dart';
// // import '../models/answer_option.dart';

// class TestResultViewModel extends ChangeNotifier {
//   final List<Question> _questions = [
//     Question(
//       id: 1,
//       text:
//           "In front of you, a large combine harvester wants to turn right. What is right?",
//       options: [
//         AnswerOption(
//           text: "A. In front of you, a large combine.",
//           isCorrect: true,
//         ),
//         AnswerOption(
//           text: "B. In front of you, a large combine.",
//           isCorrect: false,
//         ),
//         AnswerOption(
//           text: "C. In front of you, a large combine.",
//           isCorrect: false,
//         ),
//       ],
//     ),
//     Question(
//       id: 2,
//       text:
//           "In front of you, a large combine harvester wants to turn right. What is right?",
//       options: [
//         AnswerOption(
//           text: "A. In front of you, a large combine.",
//           isCorrect: true,
//         ),
//         AnswerOption(
//           text: "B. In front of you, a large combine.",
//           isCorrect: false,
//         ),
//       ],
//     ),
//   ];

//   List<Question> get questions => _questions;

//   void selectAnswer(int questionId, int optionIndex) {
//     final question = _questions.firstWhere((q) => q.id == questionId);
//     for (var option in question.options) {
//       option.isSelected = false;
//     }
//     question.options[optionIndex].isSelected = true;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:mdcat/models/answer_option_model.dart';
import 'package:mdcat/models/question_model.dart';

class TestResultViewModel extends ChangeNotifier {
  final List<Question> _questions = [
    Question(
      id: 1,
      text:
          "In front of you, a large combine harvester wants to turn right. What is right?",
      options: [
        AnswerOption(
          label: "A.",
          text: "You must stay behind it.",
          isCorrect: true,
        ),
        AnswerOption(
          label: "B.",
          text: "You may overtake immediately.",
          isCorrect: false,
        ),
        AnswerOption(
          label: "C.",
          text: "You may ignore its signal.",
          isCorrect: false,
        ),
        AnswerOption(
          label: "D.",
          text: "You may ignore its signal.",
          isCorrect: false,
        ),
      ],
    ),
    Question(
      id: 2,
      text: "You are approaching a zebra crossing. What must you do?",
      options: [
        AnswerOption(
          label: "A.",
          text: "Stop for pedestrians.",
          isCorrect: true,
        ),
        AnswerOption(
          label: "B.",
          text: "Speed up to cross quickly.",
          isCorrect: false,
        ),
        AnswerOption(
          label: "C",
          text: "Speed up to cross quickly.",
          isCorrect: false,
        ),
        AnswerOption(
          label: "D",
          text: "Speed up to cross quickly.",
          isCorrect: false,
        ),
      ],
    ),
  ];

  List<Question> get questions => _questions;

  void selectAnswer(int questionId, int optionIndex) {
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
