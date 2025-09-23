import 'package:flutter/material.dart';
// import 'package:mdcat/services/auth_service.dart';
import 'package:mdcat/services/auth_services.dart';
import 'package:mdcat/services/token_storage.dart';
import 'package:mdcat/view/homescreen.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;
  bool isLoading = false; // ✅ loading state

  void toggleRememberMe() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      final authService = AuthService();
      final data = await authService.login(email, password);

      // Success
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(data['message'])));

      // TODO: Save token if needed (SharedPreferences)
      final token = data['token'] as String?;
      if (token != null && token.isNotEmpty) {
        await TokenStorage.saveToken(token); // save only the raw token
        print("Saved Token: $token"); // now it won't have "Bearer "
      }

      // final token = data['token'] as String?;
      // if (token != null && token.isNotEmpty) {
      //   final bearerToken = "Bearer $token"; // 👈 prepend Bearer
      //   await TokenStorage.saveToken(bearerToken);
      //   print("Saved Token: $bearerToken");
      // }

      // final token = data['token'] as String?;
      // if (token != null && token.isNotEmpty) {
      //   await TokenStorage.saveToken(token); // save token here
      //   print("Saved Token: $token");
      // }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } catch (e) {
      // Failure
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
