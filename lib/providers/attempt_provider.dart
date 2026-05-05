import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mdcat/services/token_storage.dart';

class AttemptProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  String? attemptId;
  int? remainingCoins;

  /// 🔹 Attempt Test API
  Future<bool> attemptTest(String testId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final url = Uri.parse(
        "https://api.mdcatpro.com/api/student/attempt/start",
      );

      final token = await TokenStorage.getToken();
      if (token == null || token.isEmpty) {
        errorMessage = "No token found. Please login again.";
        isLoading = false;
        notifyListeners();
        return false;
      }

      final body = {"testId": testId};

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": token, // ✅ token from storage
        },
        body: jsonEncode(body),
      );

      print("🔹 AttemptTest url: ${url}");
      print("🔹 AttemptTest requestbody: ${jsonEncode(body)}");
      print("🔹 AttemptTest Status: ${response.statusCode}");
      print("🔹 AttemptTest Body: ${response.body}");

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);

        attemptId = data["attemptId"];
        remainingCoins = data["remainingCoins"];

        isLoading = false;
        notifyListeners();
        return true;
      } else {
        errorMessage = "Server error: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage = "Failed to attempt test: $e";
    }

    isLoading = false;
    notifyListeners();
    return false;
  }
}
