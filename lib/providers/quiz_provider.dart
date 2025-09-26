// ignore_for_file: unused_field

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mdcat/models/question_model.dart';
import 'package:mdcat/services/token_storage.dart';
import 'package:mdcat/view/passing_result_screen.dart';

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
    // Block moving forward if not answered and not skipped
    if (!isAnswered(currentIndex) && !skippedIndexes.contains(currentIndex)) {
      debugPrint("⚠️ Must answer or skip before moving on.");
      return;
    }

    if (!inRevisitMode) {
      // First pass
      if (currentIndex < questions.length - 1) {
        currentIndex++;
      } else {
        // First pass complete → check skipped
        if (skippedIndexes.isNotEmpty) {
          inRevisitMode = true;
          final firstPos = _firstUnansweredSkippedPosition();
          if (firstPos != null) {
            revisitIndex = firstPos;
            currentIndex = skippedIndexes[revisitIndex];
          } else {
            // All skipped already answered: cleanup & finish
            skippedIndexes.removeWhere(
              (idx) => selectedOptions.containsKey(idx),
            );
            inRevisitMode = false;
            _quizFinished = skippedIndexes.isEmpty;
          }
        } else {
          _quizFinished = true;
        }
      }
    } else {
      // Revisit mode: find next unanswered skipped after current revisitIndex
      final nextPos = _nextUnansweredSkippedPosition(revisitIndex);
      if (nextPos != null) {
        revisitIndex = nextPos;
        currentIndex = skippedIndexes[revisitIndex];
      } else {
        // No more unanswered skipped → cleanup & finalize revisit
        skippedIndexes.removeWhere((idx) => selectedOptions.containsKey(idx));
        inRevisitMode = false;
        if (skippedIndexes.isEmpty) _quizFinished = true;
      }
    }

    notifyListeners();
  }

  // void nextQuestion() {
  //   // ✅ Block moving forward if not answered and not skipped
  //   if (!isAnswered(currentIndex) && !skippedIndexes.contains(currentIndex)) {
  //     debugPrint("⚠️ Must answer or skip before moving on.");
  //     return;
  //   }

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
  //         // jump to first unanswered skipped question
  //         revisitIndex = skippedIndexes.indexWhere(
  //           (i) => !selectedOptions.containsKey(i),
  //         );
  //         if (revisitIndex == -1) {
  //           // all skipped are already answered
  //           skippedIndexes.removeWhere((i) => selectedOptions.containsKey(i));
  //           _quizFinished = skippedIndexes.isEmpty;
  //           inRevisitMode = false;
  //         } else {
  //           currentIndex = skippedIndexes[revisitIndex];
  //         }
  //       } else {
  //         _quizFinished = true;
  //       }

  //       // if (skippedIndexes.isNotEmpty) {
  //       //   inRevisitMode = true;
  //       //   revisitIndex = 0;
  //       //   currentIndex = skippedIndexes[revisitIndex];
  //       // } else {
  //       //   _quizFinished = true;
  //       // }
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

  /// Skip current question
  void skipQuestion() {
    if (!skippedIndexes.contains(currentIndex)) {
      skippedIndexes.add(currentIndex);
    }
    nextQuestion();
  }

  // void skipQuestion() {
  //   if (!skippedIndexes.contains(currentIndex)) {
  //     skippedIndexes.add(currentIndex);
  //   }
  //   nextQuestion();
  // }

  //check if current question is answered
  bool isAnswered(int questionIndex) {
    return selectedOptions.containsKey(questionIndex);
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

    // Store the option the user selected
    selectedOptions[questionIndex] = question.options[optionIndex].label;

    // IMPORTANT: DO NOT remove the question from skippedIndexes here.
    // Removing here causes revisitIndex/list mutation bugs.
    // skippedIndexes.remove(questionIndex);  <-- remove any such line

    // Store the correct option
    final correctOption = question.options.firstWhere(
      (o) => o.isCorrect,
      orElse: () => question.options[0],
    );
    correctAnswers[questionIndex] = correctOption.label;

    // OPTIONAL: auto-advance during revisit (see note below)
    if (inRevisitMode) {
      final nextPos = _nextUnansweredSkippedPosition(revisitIndex);
      if (nextPos != null) {
        revisitIndex = nextPos;
        currentIndex = skippedIndexes[revisitIndex];
      } else {
        // no more unanswered skipped -> cleanup & finish revisit
        skippedIndexes.removeWhere((idx) => selectedOptions.containsKey(idx));
        inRevisitMode = false;
        if (skippedIndexes.isEmpty) _quizFinished = true;
      }
    }

    notifyListeners();
  }

  // void toggleOption(int questionIndex, int optionIndex) {
  //   final question = questions[questionIndex];

  //   for (var i = 0; i < question.options.length; i++) {
  //     question.options[i].isSelected = (i == optionIndex);
  //   }

  //   // Store the option the user selected
  //   selectedOptions[questionIndex] = question.options[optionIndex].label;

  //   // Remove from skipped if it exists
  //   // if (skippedIndexes.contains(questionIndex)) {
  //   //   skippedIndexes.remove(questionIndex);
  //   // }

  //   // Store the correct option
  //   final correctOption = question.options.firstWhere(
  //     (o) => o.isCorrect,
  //     orElse: () => question.options[0],
  //   );
  //   correctAnswers[questionIndex] = correctOption.label;

  //   notifyListeners();
  // }

  //when in revisit mode
  void nextSkippedQuestion() {
    if (!inRevisitMode) return;

    final nextPos = _nextUnansweredSkippedPosition(revisitIndex);
    if (nextPos != null) {
      revisitIndex = nextPos;
      currentIndex = skippedIndexes[revisitIndex];
    } else {
      // done with all skipped unanswered -> cleanup and finish
      skippedIndexes.removeWhere((index) => selectedOptions.containsKey(index));
      inRevisitMode = false;
      if (skippedIndexes.isEmpty) _quizFinished = true;
    }

    notifyListeners();
  }

  // void nextSkippedQuestion() {
  //   if (revisitIndex < skippedIndexes.length - 1) {
  //     revisitIndex++;
  //     currentIndex = skippedIndexes[revisitIndex];
  //   } else {
  //     // All skipped attempted → show submit button
  //     skippedIndexes.removeWhere((i) => selectedOptions.containsKey(i));
  //     inRevisitMode = false;
  //     if (skippedIndexes.isEmpty) {
  //       _quizFinished = true;
  //     }
  //     notifyListeners();

  //     // inRevisitMode = false;
  //     // notifyListeners();
  //   }
  // }

  //submit button
  bool get isQuizFinished {
    return _quizFinished && skippedIndexes.isEmpty;
  }

  // Return the position (index inside skippedIndexes) of the first skipped entry that is still unanswered.
  int? _firstUnansweredSkippedPosition() {
    for (var i = 0; i < skippedIndexes.length; i++) {
      final qIndex = skippedIndexes[i];
      if (!selectedOptions.containsKey(qIndex)) return i;
    }
    return null;
  }

  // Return the position of the next unanswered skipped entry after `fromPos`.
  int? _nextUnansweredSkippedPosition(int fromPos) {
    if (skippedIndexes.isEmpty) return null;
    for (var i = fromPos + 1; i < skippedIndexes.length; i++) {
      final qIndex = skippedIndexes[i];
      if (!selectedOptions.containsKey(qIndex)) return i;
    }
    return null;
  }

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

  // Future<void> submitQuiz(String attemptId) async {
  Future<void> submitQuiz(BuildContext context, String attemptId) async {
    try {
      final token = await TokenStorage.getToken();
      if (token == null || token.isEmpty) {
        debugPrint("❌ No token found. Please login again.");
        return;
      }
      // If there are still unanswered skipped questions → jump to revisit instead of submitting
      final remainingUnanswered = skippedIndexes
          .where((i) => !selectedOptions.containsKey(i))
          .toList();
      if (remainingUnanswered.isNotEmpty) {
        inRevisitMode = true;
        revisitIndex = skippedIndexes.indexOf(remainingUnanswered.first);
        currentIndex = remainingUnanswered.first;
        notifyListeners();
        debugPrint("⚠️ Cannot submit: unanswered skipped questions remain.");
        return;
      }

      // Build answers list from selectedOptions
      final answers = selectedOptions.entries.map((entry) {
        final qIndex = entry.key;
        final selectedLabel = entry.value; // e.g. "A."
        final question = questions[qIndex];

        // Find option index (API expects 1-based index)
        final selectedOptionIndex = question.options.indexWhere(
          (opt) => opt.label == selectedLabel,
        );

        return {
          "questionId": question.id,
          "selectedOption": selectedOptionIndex + 1,
        };
      }).toList();

      debugPrint("📤 Sending answers: $answers");

      final response = await http.post(
        Uri.parse("http://47.130.103.135/api/student/attempt/submit"),
        headers: {"Authorization": token, "Content-Type": "application/json"},
        body: jsonEncode({"attemptId": attemptId, "answers": answers}),
      );

      debugPrint("🔹 Submit Status: ${response.statusCode}");
      debugPrint("🔹 Submit Body: ${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        debugPrint("✅ Success: ${data['message']}");
        debugPrint("Score: ${data['score']} / ${data['totalQuestions']}");
        debugPrint("Correct: ${data['correct']} | Wrong: ${data['wrong']}");

        // ✅ Clean up skipped before finishing
        skippedIndexes.removeWhere((i) => selectedOptions.containsKey(i));
        _quizFinished = true;
        notifyListeners();

        // 🔹 Navigate to result screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const ResultScreen()),
        );

        // if (response.statusCode == 200) {
        //   final data = jsonDecode(response.body);
        //   debugPrint("✅ Success: ${data['message']}");
        //   debugPrint("Score: ${data['score']} / ${data['totalQuestions']}");
        //   debugPrint("Correct: ${data['correct']} | Wrong: ${data['wrong']}");

        //   // Mark quiz finished
        //   skippedIndexes.removeWhere((i) => selectedOptions.containsKey(i));
        //   _quizFinished = true;
        //   notifyListeners();
        //   // _quizFinished = true;
        //   // notifyListeners();
      } else if (response.statusCode == 400) {
        final data = jsonDecode(response.body);
        debugPrint("⚠️ Error: ${data['message']}");
      } else {
        debugPrint("❌ Server error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("❌ Submit failed: $e");
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
