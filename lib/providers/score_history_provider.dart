// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/score_history_model.dart';

// class ScoreHistoryProvider extends ChangeNotifier {
//   bool isLoading = false;
//   List<ScoreHistory> scoreList = [];

//   Future<void> fetchScoreHistory() async {
//     isLoading = true;
//     notifyListeners();

//     try {
//       final response = await http.get(
//         Uri.parse('https://yourapi.com/api/score-history'),
//       );

//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         scoreList = data.map((e) => ScoreHistory.fromJson(e)).toList();
//       } else {
//         scoreList = [];
//       }
//     } catch (e) {
//       debugPrint('Error fetching score history: $e');
//       scoreList = [];
//     }

//     isLoading = false;
//     notifyListeners();
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mdcat/services/token_storage.dart';

class ScoreAttempt {
  final String testId;
  final String title;
  final String subject;
  final int credits;
  final int score;
  final String status;
  final DateTime attemptedAt;

  ScoreAttempt({
    required this.testId,
    required this.title,
    required this.subject,
    required this.credits,
    required this.score,
    required this.status,
    required this.attemptedAt,
  });

  factory ScoreAttempt.fromJson(Map<String, dynamic> json) {
    return ScoreAttempt(
      testId: json['testId'] ?? '',
      title: json['title'] ?? '',
      subject: json['subject'] ?? '',
      credits: json['credits'] ?? 0,
      score: json['score'] ?? 0,
      status: json['status'] ?? '',
      attemptedAt: DateTime.parse(json['attemptedAt']),
    );
  }
}

class ScoreHistoryProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  List<ScoreAttempt> attempts = [];

  /// 🔹 Fetch Score History API
  Future<void> fetchScoreHistory() async {
    isLoading = true;
    errorMessage = null;
    attempts = [];
    notifyListeners();

    try {
      final token = await TokenStorage.getToken();
      if (token == null || token.isEmpty) {
        errorMessage = "No token found. Please login again.";
        isLoading = false;
        notifyListeners();
        return;
      }

      final url = Uri.parse(
        "https://api.mdcatpro.com/api/student/test-attempts/history",
      );

      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "Authorization": "Bearer $token"},
      );

      print("🔹 FetchScoreHistory URL: $url");
      print("🔹 FetchScoreHistory Status: ${response.statusCode}");
      print("🔹 FetchScoreHistory Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['attempts'] != null && data['attempts'] is List) {
          attempts = (data['attempts'] as List)
              .map((e) => ScoreAttempt.fromJson(e))
              .toList();
        } else {
          attempts = [];
        }
      } else {
        errorMessage = "Server error: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage = "Failed to fetch score history: $e";
    }

    isLoading = false;
    notifyListeners();
  }
}
