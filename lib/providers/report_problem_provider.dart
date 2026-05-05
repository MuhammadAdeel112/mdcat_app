import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReportProblemProvider with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;

  Future<bool> submitProblem() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final description = descriptionController.text.trim();

    if (description.isEmpty) {
      errorMessage = "Please describe the problem";
      notifyListeners();
      return false;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final url = Uri.parse(
        "https://api.mdcatpro.com/api/student/report-issue",
      );

      final body = {
        "name": name.isEmpty ? "Anonymous" : name,
        "email": email.isEmpty ? "Not Provided" : email,
        "description": description,
      };

      print("🔹 Sending Report: $body");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      print("🔹 Status: ${response.statusCode}");
      print("🔹 Body: ${response.body}");

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        print("✅ Success Response: $data");
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        errorMessage = "Server error: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage = "Failed to send report: $e";
    }

    isLoading = false;
    notifyListeners();
    return false;
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    descriptionController.dispose();
  }
}
