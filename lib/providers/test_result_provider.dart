import 'package:flutter/material.dart';
import 'package:mdcat/models/question_model.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mdcat/models/Test_model.dart';
import 'package:mdcat/services/token_storage.dart';

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


class TestResultProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  TestResult? testResult;

  Future<void> fetchTestAttempts(String testId) async {
    isLoading = true;
    errorMessage = null;
    testResult = null;
    notifyListeners();

    try {
      final token = await TokenStorage.getToken();
      print("🔑 Token used: ${token?.substring(0, 30)}..."); // Debug

      if (token == null || token.isEmpty) {
        errorMessage = "No token found.";
        isLoading = false;
        notifyListeners();
        return;
      }

      final url = Uri.parse(
        "https://api.mdcatpro.com/api/student/test/$testId/attempts",
      );

      print("🌐 Calling API: $url");

      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      print("📡 Status Code: ${response.statusCode}");
      print("📦 Full Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        testResult = TestResult.fromJson(data);

        print("✅ Successfully parsed ${testResult!.attempts.length} attempts");
        print("📊 Best Score: ${testResult!.summary['bestScore']}");
      } else if (response.statusCode == 401) {
        errorMessage = "Token expired. Login again.";
      } else {
        errorMessage = "Server Error: ${response.statusCode}";
      }
    } catch (e) {
      print("❌ Exception in fetchTestAttempts: $e");
      errorMessage = "Failed to load: $e";
    }

    isLoading = false;
    notifyListeners();
  }
}


// class TestResultProvider extends ChangeNotifier {
//   bool isLoading = false;
//   String? errorMessage;
//   TestResult? testResult;
//
//   Future<void> fetchTestAttempts(String testId) async {
//     isLoading = true;
//     errorMessage = null;
//     testResult = null;
//     notifyListeners();
//
//     try {
//       final token = await TokenStorage.getToken();
//       if (token == null || token.isEmpty) {
//         errorMessage = "No token found. Please login again.";
//         isLoading = false;
//         notifyListeners();
//         return;
//       }
//
//       final url = Uri.parse(
//         "https://api.mdcatpro.com/api/student/test/$testId/attempts",
//       );
//
//       final response = await http.get(
//         url,
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $token"
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         testResult = TestResult.fromJson(data);
//       } else if (response.statusCode == 401) {
//         errorMessage = "Session expired. Please login again.";
//       } else {
//         errorMessage = "Failed to load result: ${response.statusCode}";
//       }
//     } catch (e) {
//       errorMessage = "Error: $e";
//     }
//
//     isLoading = false;
//     notifyListeners();
//   }
// }

