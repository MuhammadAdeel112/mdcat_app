import 'package:flutter/material.dart';

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
  void logout(BuildContext context) {
    // Handle logout logic here
    // For example: clear user data and navigate
    userName = "";
    userEmail = "";
    profileImage = "";
    notifyListeners();

    // Navigate to login or splash screen
    Navigator.pushReplacementNamed(context, "/login");
  }

  // Any other profile-related logic
}
