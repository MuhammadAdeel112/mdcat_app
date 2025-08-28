import 'package:flutter/material.dart';

class ForgotPasswordProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  String? errorText;

  void setEmail(String value) {
    errorText = null; // clear while typing
    notifyListeners();
  }

  bool validateEmail() {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      errorText = "Email is required";
      notifyListeners();
      return false;
    }

    // simple email regex
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(email)) {
      errorText = "Enter a valid email";
      notifyListeners();
      return false;
    }

    return true;
  }
}
