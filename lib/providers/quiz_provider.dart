// import 'package:flutter/material.dart';

// class QuizProvider extends ChangeNotifier {
//   int currentIndex = 0;

//   // sample questions
//   final List<Question> questions = [
//     Question(
//       text:
//           "In front of you , a large combine hav wants to turn right.What is right?",
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
//     if (currentIndex < questions.length - 1) {
//       currentIndex++;
//       notifyListeners();
//     }
//   }

//   void skipQuestion() {
//     nextQuestion();
//   }

//   double progress() {
//     return (currentIndex + 1) / questions.length;
//   }
// }

// class Question {
//   final String text;
//   final List<String> options;
//   Question({required this.text, required this.options});
// }

//this is the code for when user only have the option to skip mcq
// import 'package:flutter/material.dart';

// class QuizProvider extends ChangeNotifier {
//   int currentIndex = 0;

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

//   /// skipped questions (if you want to handle them later)
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
//     if (currentIndex < questions.length - 1) {
//       currentIndex++;
//       notifyListeners();
//     }
//   }

//   void skipQuestion() {
//     // record skipped question (optional)
//     skippedIndexes.add(currentIndex);

//     // move to next
//     nextQuestion();
//   }

//   double progress() {
//     return (currentIndex + 1) / questions.length;
//   }
// }

// class Question {
//   final String text;
//   final List<String> options;
//   Question({required this.text, required this.options});
// }

//this is the code when the user revisist the skipped questions as well as skip functionality

// import 'package:flutter/material.dart';

// class QuizProvider extends ChangeNotifier {
//   int currentIndex = 0;
//   bool revisitingSkipped = false; // 👈 are we in skipped-mode?

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

//   /// skipped questions
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
//     if (!revisitingSkipped) {
//       // Normal flow
//       if (currentIndex < questions.length - 1) {
//         currentIndex++;
//       } else {
//         // Finished normal questions → check skipped
//         if (skippedIndexes.isNotEmpty) {
//           _startRevisitSkipped();
//         }
//       }
//     } else {
//       // Revisiting skipped ones
//       if (currentIndex < skippedIndexes.length - 1) {
//         currentIndex++;
//       } else {
//         // Finished skipped also → quiz completely done
//         _endQuiz();
//       }
//     }
//     notifyListeners();
//   }

//   void skipQuestion() {
//     if (!revisitingSkipped) {
//       skippedIndexes.add(currentIndex);
//       nextQuestion();
//     } else {
//       // If user skips even during revisit, just go next
//       nextQuestion();
//     }
//   }

//   double progress() {
//     if (!revisitingSkipped) {
//       return (currentIndex + 1) / questions.length;
//     } else {
//       return (currentIndex + 1) / skippedIndexes.length;
//     }
//   }

//   Question get currentQuestion {
//     if (!revisitingSkipped) {
//       return questions[currentIndex];
//     } else {
//       return questions[skippedIndexes[currentIndex]];
//     }
//   }

//   /// private: start skipped round
//   void _startRevisitSkipped() {
//     revisitingSkipped = true;
//     currentIndex = 0;
//   }

//   /// private: all done
//   void _endQuiz() {
//     // Reset for now or show dialog later
//     revisitingSkipped = false;
//     currentIndex = 0;
//     skippedIndexes.clear();
//     // You can trigger a "Test Completed" dialog from UI side
//   }
// }

// class Question {
//   final String text;
//   final List<String> options;
//   Question({required this.text, required this.options});
// }
//normal flow +revisit flow

import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  int currentIndex = 0;
  int revisitIndex = 0; // 👈 for skipped questions
  bool inRevisitMode = false;

  // sample questions
  final List<Question> questions = [
    Question(
      text:
          "In front of you, a large combine harvester wants to turn right. What is right?",
      options: [
        "In front of you , a large combine.",
        "In front of you , a large combine.",
        "In front of you , a large combine.",
        "In front of you , a large combine.",
      ],
    ),
    Question(
      text: "What does a red traffic light mean?",
      options: ["Stop", "Go", "Speed up", "Turn right"],
    ),
    Question(
      text: "Which sign indicates a school zone?",
      options: [
        "Stop sign",
        "Pedestrian sign",
        "Children crossing sign",
        "Hospital sign",
      ],
    ),
  ];

  /// selected options per question
  final Map<int, Set<int>> selectedOptions = {};

  /// Track skipped question indexes
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
        // Switch to revisit skipped
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

  /// for bottom counter text
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
}

class Question {
  final String text;
  final List<String> options;
  Question({required this.text, required this.options});
}
