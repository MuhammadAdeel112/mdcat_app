// //normal flow +revisit flow

// import 'package:flutter/material.dart';

// class QuizProvider extends ChangeNotifier {
//   int currentIndex = 0;
//   int revisitIndex = 0; // 👈 for skipped questions
//   bool inRevisitMode = false;

//   // sample questions
//   final List<Question> questions = [
//     Question(
//       text:
//           "In front of you, a large combine harvester wants to turn right. What is right?",
//       options: [
//         "In front of you , a large combine.",
//         "In front of you , a large combine.",
//         "In front of you , a large combine.",
//         "In front of you , a large combine.",
//       ],
//     ),
//     Question(
//       text: "What does a red traffic light mean?",
//       options: ["Stop", "Go", "Speed up", "Turn right"],
//     ),
//     Question(
//       text: "Which sign indicates a school zone?",
//       options: [
//         "Stop sign",
//         "Pedestrian sign",
//         "Children crossing sign",
//         "Hospital sign",
//       ],
//     ),
//   ];

//   /// selected options per question
//   final Map<int, Set<int>> selectedOptions = {};

//   /// Track skipped question indexes
//   final List<int> skippedIndexes = [];

//   void toggleOption(int qIndex, int optionIndex) {
//     final currentSet = selectedOptions[qIndex] ?? <int>{};
//     if (currentSet.contains(optionIndex)) {
//       currentSet.remove(optionIndex);
//     } else {
//       currentSet.add(optionIndex);
//     }
//     selectedOptions[qIndex] = currentSet;
//     notifyListeners();
//   }

//   bool isSelected(int qIndex, int optionIndex) {
//     return selectedOptions[qIndex]?.contains(optionIndex) ?? false;
//   }

//   void nextQuestion() {
//     if (!inRevisitMode) {
//       if (currentIndex < questions.length - 1) {
//         currentIndex++;
//       } else if (skippedIndexes.isNotEmpty) {
//         // Switch to revisit skipped
//         inRevisitMode = true;
//         revisitIndex = 0;
//       }
//     } else {
//       if (revisitIndex < skippedIndexes.length - 1) {
//         revisitIndex++;
//       } else {
//         // quiz finished
//       }
//     }
//     notifyListeners();
//   }

//   void skipQuestion() {
//     if (!inRevisitMode) {
//       skippedIndexes.add(currentIndex);
//       nextQuestion();
//     } else {
//       nextQuestion(); // in revisit mode, skip acts like next
//     }
//   }

//   Question get currentQuestion {
//     if (!inRevisitMode) {
//       return questions[currentIndex];
//     } else {
//       return questions[skippedIndexes[revisitIndex]];
//     }
//   }

//   /// for bottom counter text
//   String get counterText {
//     if (!inRevisitMode) {
//       return "# ${currentIndex + 1} / ${questions.length}";
//     } else {
//       return "# ${revisitIndex + 1} / ${skippedIndexes.length}";
//     }
//   }

//   double progress() {
//     if (!inRevisitMode) {
//       return (currentIndex + 1) / questions.length;
//     } else {
//       return (revisitIndex + 1) / skippedIndexes.length;
//     }
//   }
// }

// class Question {
//   final String text;
//   final List<String> options;
//   Question({required this.text, required this.options});
// }
import 'package:flutter/material.dart';
import 'package:mdcat/models/answer_option_model.dart';
import 'package:mdcat/models/question_model.dart';

class QuizProvider extends ChangeNotifier {
  int currentIndex = 0;
  int revisitIndex = 0; // for skipped questions
  bool inRevisitMode = false;

  // pause state
  bool _paused = false;
  bool get paused => _paused;
  final List<Question> questions = [
    Question(
      id: 1,
      text:
          "In front of you, a large combine harvester wants to turn right. What is right?",
      options: [
        AnswerOption(
          label: "A",
          text: "In front of you, a large combine.",
          isCorrect: true,
        ),
        AnswerOption(
          label: "B",
          text: "In front of you, a large combine.",
          isCorrect: false,
        ),
        AnswerOption(
          label: "C",
          text: "In front of you, a large combine.",
          isCorrect: false,
        ),
        AnswerOption(
          label: "D",
          text: "In front of you, a large combine.",
          isCorrect: false,
        ),
      ],
    ),
    Question(
      id: 2,
      text: "What does a red traffic light mean?",
      options: [
        AnswerOption(label: "A", text: "Stop", isCorrect: true),
        AnswerOption(label: "B", text: "Go", isCorrect: false),
        AnswerOption(label: "C", text: "Speed up", isCorrect: false),
        AnswerOption(label: "D", text: "Turn right", isCorrect: false),
      ],
    ),
    Question(
      id: 3,
      text: "Which sign indicates a school zone?",
      options: [
        AnswerOption(label: "A", text: "Stop sign", isCorrect: false),
        AnswerOption(label: "B", text: "Pedestrian sign", isCorrect: false),
        AnswerOption(
          label: "C",
          text: "Children crossing sign",
          isCorrect: true,
        ),
        AnswerOption(label: "D", text: "Hospital sign", isCorrect: false),
      ],
    ),
  ];

  // final List<Question> questions = [
  //   Question(
  //     text:
  //         "In front of you, a large combine harvester wants to turn right. What is right?",
  //     options: [
  //       "In front of you , a large combine.",
  //       "In front of you , a large combine.",
  //       "In front of you , a large combine.",
  //       "In front of you , a large combine.",
  //     ],
  //   ),
  //   Question(
  //     text: "What does a red traffic light mean?",
  //     options: ["Stop", "Go", "Speed up", "Turn right"],
  //   ),
  //   Question(
  //     text: "Which sign indicates a school zone?",
  //     options: [
  //       "Stop sign",
  //       "Pedestrian sign",
  //       "Children crossing sign",
  //       "Hospital sign",
  //     ],
  //   ),
  // ];

  final Map<int, Set<int>> selectedOptions = {};
  final List<int> skippedIndexes = [];

  void toggleOption(int qIndex, int optionIndex) {
    final currentSet = selectedOptions[qIndex] ?? <int>{};
    if (currentSet.contains(optionIndex)) {
      currentSet.remove(optionIndex);
    } else {
      currentSet.add(optionIndex);
    }
    selectedOptions[qIndex] = currentSet;
    notifyListeners();
  }

  bool isSelected(int qIndex, int optionIndex) {
    return selectedOptions[qIndex]?.contains(optionIndex) ?? false;
  }

  void nextQuestion() {
    if (!inRevisitMode) {
      if (currentIndex < questions.length - 1) {
        currentIndex++;
      } else if (skippedIndexes.isNotEmpty) {
        inRevisitMode = true;
        revisitIndex = 0;
      }
    } else {
      if (revisitIndex < skippedIndexes.length - 1) {
        revisitIndex++;
      } else {
        // quiz finished
      }
    }
    notifyListeners();
  }

  void skipQuestion() {
    if (!inRevisitMode) {
      skippedIndexes.add(currentIndex);
      nextQuestion();
    } else {
      nextQuestion(); // in revisit mode, skip acts like next
    }
  }

  Question get currentQuestion {
    if (!inRevisitMode) {
      return questions[currentIndex];
    } else {
      return questions[skippedIndexes[revisitIndex]];
    }
  }

  String get counterText {
    if (!inRevisitMode) {
      return "# ${currentIndex + 1} / ${questions.length}";
    } else {
      return "# ${revisitIndex + 1} / ${skippedIndexes.length}";
    }
  }

  double progress() {
    if (!inRevisitMode) {
      return (currentIndex + 1) / questions.length;
    } else {
      return (revisitIndex + 1) / skippedIndexes.length;
    }
  }

  /// --- Pause / Resume Methods ---
  void pauseQuiz() {
    _paused = true;
    notifyListeners();
  }

  void resumeQuiz() {
    _paused = false;
    notifyListeners();
  }
}
