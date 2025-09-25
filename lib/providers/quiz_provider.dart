// ignore_for_file: unused_field

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mdcat/models/question_model.dart';
import 'package:mdcat/services/token_storage.dart';

class QuizProvider extends ChangeNotifier {
  bool _quizFinished = false;
  bool isLoading = false;
  String? errorMessage;
  bool isPaused = false;
  Duration remainingTime = Duration(minutes: 90); // 90 minutes
  Timer? _timer;
  // bool isTimerRunning = false;
  bool get isTimerRunning => _timer?.isActive ?? false;

  // bool get isQuizFinished => _quizFinished;

  String get getTimerText {
    final hours = remainingTime.inHours;
    final minutes = remainingTime.inMinutes.remainder(60);
    final seconds = remainingTime.inSeconds.remainder(60);

    if (hours > 0) {
      return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    } else {
      return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    }
  }
  // track if timer is currently running

  // Quiz state
  List<Question> questions = [];
  int currentIndex = 0;
  int revisitIndex = 0;
  bool inRevisitMode = false;

  // Track skipped questions

  // Track user answers: questionIndex → userSelectedOption
  Map<int, String> selectedOptions = {};

  // Track correct answers: questionIndex → correctOption
  Map<int, String> correctAnswers = {};

  List<int> skippedIndexes = [];
  // Track selected options: key = questionIndex, value = optionLabel
  // Map<int, String> selectedOptions = {};

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
    // ✅ Block moving forward if not answered and not skipped
    if (!isAnswered(currentIndex) && !skippedIndexes.contains(currentIndex)) {
      debugPrint("⚠️ Must answer or skip before moving on.");
      return;
    }

    // If answered a skipped question, remove it
    if (skippedIndexes.contains(currentIndex) &&
        selectedOptions.containsKey(currentIndex)) {
      skippedIndexes.remove(currentIndex);
    }

    if (!inRevisitMode) {
      // First pass
      if (currentIndex < questions.length - 1) {
        currentIndex++;
      } else {
        // First pass complete → check skipped
        if (skippedIndexes.isNotEmpty) {
          inRevisitMode = true;
          revisitIndex = 0;
          currentIndex = skippedIndexes[revisitIndex];
        } else {
          _quizFinished = true;
        }
      }
    } else {
      // Revisit skipped questions
      if (revisitIndex < skippedIndexes.length - 1) {
        revisitIndex++;
        currentIndex = skippedIndexes[revisitIndex];
      } else {
        // Done with all skipped
        skippedIndexes.removeWhere(
          (index) => selectedOptions.containsKey(index),
        );
        if (skippedIndexes.isEmpty) {
          _quizFinished = true;
        }
      }
    }

    notifyListeners();
  }

  // void nextQuestion() {
  //   // If answered a skipped question, remove it
  //   if (skippedIndexes.contains(currentIndex) &&
  //       selectedOptions.containsKey(currentIndex)) {
  //     skippedIndexes.remove(currentIndex);
  //   }

  //   if (!inRevisitMode) {
  //     // First pass
  //     if (currentIndex < questions.length - 1) {
  //       currentIndex++;
  //     } else {
  //       // First pass complete → check skipped
  //       if (skippedIndexes.isNotEmpty) {
  //         inRevisitMode = true;
  //         revisitIndex = 0;
  //         currentIndex = skippedIndexes[revisitIndex];
  //       } else {
  //         _quizFinished = true;
  //       }
  //     }
  //   } else {
  //     // Revisit skipped questions
  //     if (revisitIndex < skippedIndexes.length - 1) {
  //       revisitIndex++;
  //       currentIndex = skippedIndexes[revisitIndex];
  //     } else {
  //       // Done with all skipped
  //       skippedIndexes.removeWhere(
  //         (index) => selectedOptions.containsKey(index),
  //       );
  //       if (skippedIndexes.isEmpty) {
  //         _quizFinished = true;
  //       }
  //     }
  //   }

  //   notifyListeners();
  // }

  // void nextQuestion() {
  //   // If answered a skipped question, remove it from skippedIndexes
  //   if (skippedIndexes.contains(currentIndex) &&
  //       selectedOptions.containsKey(currentIndex)) {
  //     skippedIndexes.remove(currentIndex);
  //   }

  //   if (!inRevisitMode) {
  //     // First pass
  //     if (currentIndex < questions.length - 1) {
  //       currentIndex++;
  //     } else if (skippedIndexes.isNotEmpty) {
  //       inRevisitMode = true;
  //       currentIndex = skippedIndexes.first;
  //     } else {
  //       _quizFinished = true;
  //     }
  //   } else {
  //     // Revisit skipped questions
  //     if (skippedIndexes.isNotEmpty) {
  //       currentIndex = skippedIndexes.first;
  //     } else {
  //       _quizFinished = true;
  //     }
  //   }

  //   notifyListeners();
  // }

  /// Skip current question
  void skipQuestion() {
    if (!skippedIndexes.contains(currentIndex)) {
      skippedIndexes.add(currentIndex);
    }
    nextQuestion();
  }

  //check if current question is answered
  bool isAnswered(int questionIndex) {
    return selectedOptions.containsKey(questionIndex);
  }

  // void skipQuestion() {
  //   if (!skippedIndexes.contains(currentIndex)) {
  //     skippedIndexes.add(currentIndex);
  //   }
  //   nextQuestion();
  // }

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

    // Store the option the user selected
    selectedOptions[questionIndex] = question.options[optionIndex].label;

    // Remove from skipped if it exists
    if (skippedIndexes.contains(questionIndex)) {
      skippedIndexes.remove(questionIndex);
    }

    // Store the correct option
    final correctOption = question.options.firstWhere(
      (o) => o.isCorrect,
      orElse: () => question.options[0],
    );
    correctAnswers[questionIndex] = correctOption.label;

    notifyListeners();
  }

  //when in revisit mode
  void nextSkippedQuestion() {
    if (revisitIndex < skippedIndexes.length - 1) {
      revisitIndex++;
      currentIndex = skippedIndexes[revisitIndex];
    } else {
      // All skipped attempted → show submit button
      inRevisitMode = false;
      notifyListeners();
    }
  }

  //submit button
  bool get isQuizFinished {
    return _quizFinished && skippedIndexes.isEmpty;
  }

  // bool get isQuizFinished =>
  //     skippedIndexes.isEmpty && currentIndex == questions.length - 1;

  /// Check if option is selected
  bool isSelected(int questionIndex, int optionIndex) {
    final question = questions[questionIndex];
    return question.options[optionIndex].isSelected;
  }

  void startTimer() {
    if (_timer?.isActive ?? false) return; // already running

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.inSeconds > 0) {
        remainingTime = remainingTime - Duration(seconds: 1);
        notifyListeners();
      } else {
        _timer?.cancel();
        onTimeUp();
      }
    });
  }

  void pauseTimer() {
    _timer?.cancel();
  }

  void resumeTimer() {
    startTimer();
  }

  void onTimeUp() {
    // Called when time finishes
    // You can handle auto-submit or navigate
    debugPrint("Time is up!");
  }

  String get timerText {
    final hours = remainingTime.inHours;
    final minutes = remainingTime.inMinutes.remainder(60);
    final seconds = remainingTime.inSeconds.remainder(60);

    if (hours > 0) {
      return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    } else {
      return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    }
  }

  double get progress {
    if (questions.isEmpty) return 0.0;
    return (currentIndex + 1) / questions.length;
  }
  //submit quiz

  // In QuizProvider
  void submitQuiz() {
    // Print all selected answers for now
    debugPrint("Submitting Quiz...");
    selectedOptions.forEach((questionIndex, answer) {
      debugPrint("Question ${questionIndex + 1}: Selected Answer -> $answer");
    });

    // Optional: mark quiz as finished
    _quizFinished = true;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
