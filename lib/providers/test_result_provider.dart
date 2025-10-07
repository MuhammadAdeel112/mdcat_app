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
