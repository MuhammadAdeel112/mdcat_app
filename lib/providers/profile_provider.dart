import 'package:flutter/material.dart';
import 'package:mdcat/view/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  String userName = "John Doe";
  String userEmail = "johndoe@example.com";
  String profileImage = "assets/images/userprofile.png";

  // Example: update user name
  void updateUserName(String newName) {
    userName = newName;
    notifyListeners();
  }

  // Example: update profile image
  void updateProfileImage(String newImagePath) {
    profileImage = newImagePath;
    notifyListeners();
  }

  // Logout action
  // 🔹 Updated logout method
  Future<void> logout(BuildContext context) async {
    // 1️⃣ Clear user data
    userName = "";
    userEmail = "";
    profileImage = "";
    notifyListeners();

    // 2️⃣ Clear login info from SharedPreferences (optional, if you use isLoggedIn)
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn'); // remove saved login status
    await prefs.remove('user_name'); // remove saved username

    // 3️⃣ Navigate to SplashScreen and remove previous screens
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const SplashScreen()),
      (route) => false, // removes all previous routes
    );
  }
}
