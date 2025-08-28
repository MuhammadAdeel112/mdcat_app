import 'package:flutter/material.dart';

class NewPasswordProvider with ChangeNotifier {
  // Controllers
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // State
  bool isLoading = false;

  // Validation Errors
  String? errorMessage;

  // Dispose controllers when provider is removed
  void disposeControllers() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  // Validate input fields
  bool validatePasswords() {
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      errorMessage = "Both fields are required";
      notifyListeners();
      return false;
    }

    if (newPassword.length < 6) {
      errorMessage = "Password must be at least 6 characters";
      notifyListeners();
      return false;
    }

    if (newPassword != confirmPassword) {
      errorMessage = "Passwords do not match";
      notifyListeners();
      return false;
    }

    errorMessage = null;
    return true;
  }

  // Simulate API call (you’ll replace later with real service)
  Future<bool> updatePassword() async {
    if (!validatePasswords()) return false;

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2)); // simulate API delay

    isLoading = false;
    notifyListeners();

    return true; // Assume success for now
  }
}
