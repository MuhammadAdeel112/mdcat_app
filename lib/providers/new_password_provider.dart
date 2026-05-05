// // // import 'package:flutter/material.dart';

// // // class NewPasswordProvider with ChangeNotifier {
// // //   // Controllers
// // //   final TextEditingController newPasswordController = TextEditingController();
// // //   final TextEditingController confirmPasswordController =
// // //       TextEditingController();

// // //   // State
// // //   bool isLoading = false;

// // //   // Validation Errors
// // //   String? errorMessage;

// // //   // Dispose controllers when provider is removed
// // //   void disposeControllers() {
// // //     newPasswordController.dispose();
// // //     confirmPasswordController.dispose();
// // //   }

// // //   // Validate input fields
// // //   bool validatePasswords() {
// // //     final newPassword = newPasswordController.text.trim();
// // //     final confirmPassword = confirmPasswordController.text.trim();

// // //     if (newPassword.isEmpty || confirmPassword.isEmpty) {
// // //       errorMessage = "Both fields are required";
// // //       notifyListeners();
// // //       return false;
// // //     }

// // //     if (newPassword.length < 6) {
// // //       errorMessage = "Password must be at least 6 characters";
// // //       notifyListeners();
// // //       return false;
// // //     }

// // //     if (newPassword != confirmPassword) {
// // //       errorMessage = "Passwords do not match";
// // //       notifyListeners();
// // //       return false;
// // //     }

// // //     errorMessage = null;
// // //     return true;
// // //   }

// // //   // Simulate API call (you’ll replace later with real service)
// // //   Future<bool> updatePassword() async {
// // //     if (!validatePasswords()) return false;

// // //     isLoading = true;
// // //     notifyListeners();

// // //     await Future.delayed(const Duration(seconds: 2)); // simulate API delay

// // //     isLoading = false;
// // //     notifyListeners();

// // //     return true; // Assume success for now
// // //   }
// // // }
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // class NewPasswordProvider with ChangeNotifier {
// //   // Controllers
// //   final TextEditingController newPasswordController = TextEditingController();
// //   final TextEditingController confirmPasswordController = TextEditingController();

// //   // State
// //   bool isLoading = false;
// //   String? errorMessage;

// //   // Dispose controllers
// //   void disposeControllers() {
// //     newPasswordController.dispose();
// //     confirmPasswordController.dispose();
// //   }

// //   // Validate inputs
// //   bool validatePasswords() {
// //     final newPassword = newPasswordController.text.trim();
// //     final confirmPassword = confirmPasswordController.text.trim();

// //     if (newPassword.isEmpty || confirmPassword.isEmpty) {
// //       errorMessage = "Both fields are required";
// //       notifyListeners();
// //       return false;
// //     }

// //     if (newPassword.length < 6) {
// //       errorMessage = "Password must be at least 6 characters";
// //       notifyListeners();
// //       return false;
// //     }

// //     if (newPassword != confirmPassword) {
// //       errorMessage = "Passwords do not match";
// //       notifyListeners();
// //       return false;
// //     }

// //     errorMessage = null;
// //     return true;
// //   }

// //   // 🔹 Real API Call
// //   Future<bool> updatePassword({
// //     required String email,
// //     required String code,
// //   }) async {
// //     if (!validatePasswords()) return false;

// //     isLoading = true;
// //     errorMessage = null;
// //     notifyListeners();

// //     final url = Uri.parse("https://api.mdcatpro.com/api/student/reset-password");

// //     try {
// //       final response = await http.post(
// //         url,
// //         headers: {
// //           "Content-Type": "application/json",
// //         },
// //         body: jsonEncode({
// //           "email": email,
// //           "code": code,
// //           "newPassword": newPasswordController.text.trim(),
// //         }),
// //       );

// //       print("🔹 Reset Password URL: $url");
// //       print("🔹 Request Body: ${jsonEncode({
// //         "email": email,
// //         "code": code,
// //         "newPassword": newPasswordController.text.trim(),
// //       })}");
// //       print("🔹 Status Code: ${response.statusCode}");
// //       print("🔹 Response: ${response.body}");

// //       if (response.statusCode == 200) {
// //         isLoading = false;
// //         notifyListeners();
// //         return true;
// //       } else {
// //         final data = jsonDecode(response.body);
// //         errorMessage = data["message"] ?? "Failed to update password";
// //       }
// //     } catch (e) {
// //       errorMessage = "An error occurred: $e";
// //     }

// //     isLoading = false;
// //     notifyListeners();
// //     return false;
// //   }
// // }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class NewPasswordProvider with ChangeNotifier {
//   // Controllers
//   final TextEditingController newPasswordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   // State
//   bool isLoading = false;
//   String? errorMessage;

//   // Dispose controllers
//   void disposeControllers() {
//     newPasswordController.dispose();
//     confirmPasswordController.dispose();
//   }

//   // Validate inputs
//   bool validatePasswords() {
//     final newPassword = newPasswordController.text.trim();
//     final confirmPassword = confirmPasswordController.text.trim();

//     if (newPassword.isEmpty || confirmPassword.isEmpty) {
//       errorMessage = "Both fields are required";
//       notifyListeners();
//       return false;
//     }

//     if (newPassword.length < 6) {
//       errorMessage = "Password must be at least 6 characters";
//       notifyListeners();
//       return false;
//     }

//     if (newPassword != confirmPassword) {
//       errorMessage = "Passwords do not match";
//       notifyListeners();
//       return false;
//     }

//     errorMessage = null;
//     return true;
//   }

//   // 🔹 Real API Call
//   Future<bool> updatePassword(String email, String code) async {
//     if (!validatePasswords()) return false;

//     isLoading = true;
//     notifyListeners();

//     try {
//       final url = Uri.parse(
//         'https://api.mdcatpro.com/api/student/reset-password',
//       );
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "email": email,
//           "code": code,
//           "newPassword": newPasswordController.text.trim(),
//         }),
//       );

//       if (response.statusCode == 200) {
//         isLoading = false;
//         notifyListeners();
//         return true;
//       } else {
//         final data = jsonDecode(response.body);
//         errorMessage = data["message"] ?? "Failed to update password";
//       }
//     } catch (e) {
//       errorMessage = "Error: $e";
//     }

//     isLoading = false;
//     notifyListeners();
//     return false;
//   }

//   // Future<bool> updatePassword({
//   //   required String email,
//   //   required String code,
//   // }) async {
//   //   if (!validatePasswords()) return false;

//   //   isLoading = true;
//   //   errorMessage = null;
//   //   notifyListeners();

//   //   final url = Uri.parse("https://api.mdcatpro.com/api/student/reset-password");

//   //   try {
//   //     final response = await http.post(
//   //       url,
//   //       headers: {
//   //         "Content-Type": "application/json",
//   //       },
//   //       body: jsonEncode({
//   //         "email": email,
//   //         "code": code,
//   //         "newPassword": newPasswordController.text.trim(),
//   //       }),
//   //     );

//   //     print("🔹 Reset Password URL: $url");
//   //     print("🔹 Request Body: ${jsonEncode({
//   //       "email": email,
//   //       "code": code,
//   //       "newPassword": newPasswordController.text.trim(),
//   //     })}");
//   //     print("🔹 Status Code: ${response.statusCode}");
//   //     print("🔹 Response: ${response.body}");

//   //     if (response.statusCode == 200) {
//   //       isLoading = false;
//   //       notifyListeners();
//   //       return true;
//   //     } else {
//   //       final data = jsonDecode(response.body);
//   //       errorMessage = data["message"] ?? "Failed to update password";
//   //     }
//   //   } catch (e) {
//   //     errorMessage = "An error occurred: $e";
//   //   }

//   //   isLoading = false;
//   //   notifyListeners();
//   //   return false;
//   // }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewPasswordProvider with ChangeNotifier {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isLoading = false;
  String? errorMessage;

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

  Future<bool> updatePassword(String email, String code) async {
    if (!validatePasswords()) return false;

    isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse(
        "https://api.mdcatpro.com/api/student/reset-password",
      );
      final body = {
        "email": email,
        "code": code,
        "newPassword": newPasswordController.text.trim(),
      };

      print("🔹 [ResetPassword] URL: $url");
      print("🔹 [ResetPassword] Request Body: ${jsonEncode(body)}");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      print("🔹 [ResetPassword] Status Code: ${response.statusCode}");
      print("🔹 [ResetPassword] Raw Response: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("✅ [ResetPassword] Success: ${data['message']}");
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        final data = jsonDecode(response.body);
        errorMessage = data["message"] ?? "Failed to update password";
        print("❌ [ResetPassword] Error: ${errorMessage}");
      }
    } catch (e) {
      errorMessage = "Error: $e";
      print("🔥 [ResetPassword] Exception: $e");
    }

    isLoading = false;
    notifyListeners();
    return false;
  }
}
