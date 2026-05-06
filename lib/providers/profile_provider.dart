import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mdcat/services/token_storage.dart';
import 'package:mdcat/view/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  // ✅ Profile data from API
  String userName = "";
  String userEmail = "";
  String fatherName = "";
  String phoneNo = "";
  String profileImage = ""; // Cloudinary URL
  String gender = "";
  String province = "";
  String testType = "";
  int coins = 0;

  bool isLoading = false;
  String? errorMessage;

  /// 🔹 Fetch Profile from API
  Future<void> fetchProfile() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final rawToken = await TokenStorage.getToken();
      debugPrint("🔑 Profile token: '$rawToken'");

      if (rawToken == null || rawToken.trim().isEmpty) {
        errorMessage = "Not logged in.";
        isLoading = false;
        notifyListeners();
        return;
      }

      // Clean token of any accidental Bearer prefix
      final cleanToken = rawToken.trim().replaceFirst(
        RegExp(r'^Bearer\s+', caseSensitive: false),
        '',
      );

      final response = await http.get(
        Uri.parse("https://api.mdcatpro.com/api/student/myProfile"),
        headers: {
          "Authorization": "Bearer $cleanToken",
          "Content-Type": "application/json",
        },
      );

      debugPrint("🔹 Profile Status: ${response.statusCode}");
      debugPrint("🔹 Profile Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        userName = data['name'] ?? "";
        userEmail = data['email'] ?? "";
        fatherName = data['fatherName'] ?? "";
        phoneNo = data['phoneNo'] ?? "";
        profileImage = data['profilePic'] ?? "";
        gender = data['gender'] ?? "";
        province = data['province'] ?? "";
        testType = data['testType'] ?? "";
        coins = data['coins'] ?? 0;

        debugPrint("✅ Profile loaded: $userName | Coins: $coins");
      } else {
        errorMessage = "Failed to load profile (${response.statusCode})";
        debugPrint("❌ Profile error: $errorMessage");
      }
    } catch (e) {
      errorMessage = "Error loading profile: $e";
      debugPrint("❌ Profile exception: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  // Logout action
  Future<void> logout(BuildContext context) async {
    // Clear local data
    userName = "";
    userEmail = "";
    fatherName = "";
    phoneNo = "";
    profileImage = "";
    gender = "";
    province = "";
    testType = "";
    coins = 0;
    notifyListeners();

    // Clear SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Clear token
    await TokenStorage.clearToken();

    // Navigate to SplashScreen
    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const SplashScreen()),
      (route) => false,
    );
  }
}
