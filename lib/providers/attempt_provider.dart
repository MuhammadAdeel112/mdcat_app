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

      // ✅ Get raw token from storage
      final rawToken = await TokenStorage.getToken();
      debugPrint("🔑 Raw token from storage: '$rawToken'");

      if (rawToken == null || rawToken.trim().isEmpty) {
        errorMessage = "No token found. Please login again.";
        isLoading = false;
        notifyListeners();
        return false;
      }

      // ✅ Clean token: remove any accidental "Bearer " prefix already stored
      final cleanToken = rawToken.trim().replaceFirst(RegExp(r'^Bearer\s+', caseSensitive: false), '');
      debugPrint("🔑 Clean token being used: '$cleanToken'");

      final body = {"testId": testId};
      final headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $cleanToken",
      };

      debugPrint("🔹 AttemptTest url: $url");
      debugPrint("🔹 AttemptTest headers: $headers");
      debugPrint("🔹 AttemptTest requestbody: ${jsonEncode(body)}");

      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      debugPrint("🔹 AttemptTest Status: ${response.statusCode}");
      debugPrint("🔹 AttemptTest Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);

        attemptId = data["attemptId"];
        remainingCoins = data["remainingCoins"];

        debugPrint("✅ AttemptTest Success! attemptId: $attemptId");

        isLoading = false;
        notifyListeners();
        return true;
      } else {
        final data = jsonDecode(response.body);
        errorMessage = data["message"] ?? "Server error: ${response.statusCode}";
        debugPrint("❌ AttemptTest Failed: $errorMessage");
      }
    } catch (e) {
      errorMessage = "Failed to attempt test: $e";
      debugPrint("❌ AttemptTest Exception: $e");
    }

    isLoading = false;
    notifyListeners();
    return false;
  }
}
