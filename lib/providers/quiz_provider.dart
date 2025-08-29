import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  int currentIndex = 0;

  // sample questions
  final List<Question> questions = [
    Question(
      text:
          "In front of you , a large combine hav wants to turn right.What is right?",
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
    if (currentIndex < questions.length - 1) {
      currentIndex++;
      notifyListeners();
    }
  }

  void skipQuestion() {
    nextQuestion();
  }

  double progress() {
    return (currentIndex + 1) / questions.length;
  }
}

class Question {
  final String text;
  final List<String> options;
  Question({required this.text, required this.options});
}
