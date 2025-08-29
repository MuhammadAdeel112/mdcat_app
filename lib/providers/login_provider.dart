// import 'package:flutter/material.dart';

// class LoginProvider extends ChangeNotifier {
//   // Controllers
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   // Remember Me state
//   bool rememberMe = false;

//   void toggleRememberMe() {
//     rememberMe = !rememberMe;
//     notifyListeners();
//   }

//   // Placeholder login function (API not ready yet)
//   Future<void> login() async {
//     final email = emailController.text.trim();
//     final password = passwordController.text.trim();

//     // Simple validation
//     if (email.isEmpty || password.isEmpty) {
//       // show error (you can use SnackBar in screen)
//       return;
//     }

//     // Simulate network delay
//     await Future.delayed(const Duration(seconds: 2));

//     // TODO: Replace with real API call
//     print('Login called: $email / $password');
//   }

//   // Dispose controllers when provider is disposed
//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
// }

// import 'package:flutter/material.dart';

// class LoginProvider extends ChangeNotifier {
//   // Controllers for TextFields
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   // Remember Me state
//   bool rememberMe = false;

//   // Toggle Remember Me
//   void toggleRememberMe() {
//     rememberMe = !rememberMe;
//     notifyListeners();
//   }

//   // Login function (API not ready yet)
//   Future<void> login(BuildContext context) async {
//     final email = emailController.text.trim();
//     final password = passwordController.text.trim();

//     // Simple validation
//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please enter email and password")),
//       );
//       return;
//     }

//     // Simulate network delay
//     await Future.delayed(const Duration(seconds: 2));

//     // Placeholder: Show success (replace with real API call later)
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Logged in as $email")),
//     );

//     // You can navigate to HomeScreen here if API succeeds
//     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
//   }

//   // Dispose controllers when provider is disposed
//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:mdcat/view/homescreen.dart';

// class LoginProvider extends ChangeNotifier {
//   // Controllers for TextFields
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   // Remember Me state
//   bool rememberMe = false;

//   // Toggle Remember Me
//   void toggleRememberMe() {
//     rememberMe = !rememberMe;
//     notifyListeners();
//   }

//   // Login function (API not ready yet)
//   Future<void> login(BuildContext context) async {
//     final email = emailController.text.trim();
//     final password = passwordController.text.trim();

//     // Simple validation
//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please enter email and password")),
//       );
//       return;
//     }

//     // Simulate network delay
//     await Future.delayed(const Duration(seconds: 2));

//     // Placeholder: Show success (replace with real API call later)
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text("Logged in as $email")));

//     // Optional: navigate to HomeScreen when API is ready
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => HomeScreen()),
//     );
//   }

//   // Dispose controllers when provider is disposed
//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
// }

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
        await TokenStorage.saveToken(token); // save token here
      }

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
