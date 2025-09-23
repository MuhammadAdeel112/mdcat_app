import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mdcat/models/question_model.dart';
import 'package:mdcat/services/token_storage.dart';

class QuizProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  bool isPaused = false;

  // Quiz state
  List<Question> questions = [];
  int currentIndex = 0;
  int revisitIndex = 0;
  bool inRevisitMode = false;

  // Track skipped questions
  List<int> skippedIndexes = [];
  // Track selected options: key = questionIndex, value = optionLabel
  Map<int, String> selectedOptions = {};

  /// 🔹 Step 2: Fetch Questions after attempt
  Future<bool> fetchQuestions(
    String level,
    String subject,
    String studentClass,
  ) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final token = await TokenStorage.getToken();
      if (token == null || token.isEmpty) {
        errorMessage = "No token found. Please login again.";
        isLoading = false;
        notifyListeners();
        return false;
      }

      final response = await http.post(
        Uri.parse("http://47.130.103.135/api/student/filter-tests"),
        headers: {"Authorization": token, "Content-Type": "application/json"},
        body: jsonEncode({
          "level": level,
          "subject": subject,
          "class": studentClass,
        }),
      );

      debugPrint("🔹 fetchQuestions Status: ${response.statusCode}");
      debugPrint("🔹 fetchQuestions Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // ✅ Parse questions from API response
        if (data['tests'] != null &&
            data['tests'] is List &&
            data['tests'].isNotEmpty) {
          final test = data['tests'][0]; // take first test
          if (test['questions'] != null && test['questions'] is List) {
            questions = (test['questions'] as List)
                .map((q) => Question.fromApi(q, test['_id']))
                .toList();
            isLoading = false;
            notifyListeners();
            return questions.isNotEmpty;
          } else {
            errorMessage = "No questions found in this test.";
          }
        } else {
          errorMessage = "No tests found for given filter.";
        }
      } else {
        errorMessage = "Server error: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage = "Failed to fetch questions: $e";
    }

    isLoading = false;
    notifyListeners();
    return false;
  }

  /// Move to next question
  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      currentIndex++;
      notifyListeners();
    }
  }

  /// Skip current question
  void skipQuestion() {
    if (!skippedIndexes.contains(currentIndex)) {
      skippedIndexes.add(currentIndex);
    }

    if (currentIndex < questions.length - 1) {
      currentIndex++;
    } else {
      inRevisitMode = true;
      revisitIndex = 0;
    }

    notifyListeners();
  }

  /// Pause quiz
  void pauseQuiz() {
    isPaused = true;
    notifyListeners();
  }

  /// Resume quiz
  void resumeQuiz() {
    isPaused = false;
    notifyListeners();
  }

  /// Toggle option selection for a question
  void toggleOption(int questionIndex, int optionIndex) {
    final question = questions[questionIndex];
    for (var i = 0; i < question.options.length; i++) {
      question.options[i].isSelected = (i == optionIndex);
    }
    selectedOptions[questionIndex] =
        question.options[optionIndex].label; // Track selected label
    notifyListeners();
  }

  /// Check if option is selected
  bool isSelected(int questionIndex, int optionIndex) {
    final question = questions[questionIndex];
    return question.options[optionIndex].isSelected;
  }
}
