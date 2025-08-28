// import 'package:flutter/material.dart';

// class SignupProvider extends ChangeNotifier {
//   // Controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   // Role from dropdown
//   String? selectedRole;
//   void setRole(String? value) {
//     selectedRole = value;
//     notifyListeners();
//   }

//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   String? _validate() {
//     final name = nameController.text.trim();
//     final email = emailController.text.trim();
//     final pass = passwordController.text.trim();

//     if (name.isEmpty) return "Please enter name";
//     if (email.isEmpty) return "Please enter email";
//     if (!email.contains("@") || !email.contains(".")) return "Invalid email";
//     if (selectedRole == null) return "Please select a role";
//     if (pass.length < 6) return "Password must be at least 6 characters";
//     return null;
//   }

//   Future<void> register(BuildContext context) async {
//     final error = _validate();
//     if (error != null) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text(error)));
//       return;
//     }

//     _isLoading = true;
//     notifyListeners();

//     // Simulate API delay — replace with real API tomorrow
//     await Future.delayed(const Duration(seconds: 2));

//     _isLoading = false;
//     notifyListeners();

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Signed up: ${emailController.text.trim()}")),
//     );

//     // TODO: Navigate as per your flow (e.g., to OTP or Home)
//     // Navigator.pop(context);
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Dropdown values
  String? selectedTestType;
  String? selectedProvince;

  // Profile Pic (we'll store just path/url for now)
  String? profilePicPath;

  void setTestType(String? value) {
    selectedTestType = value;
    notifyListeners();
  }

  void setProvince(String? value) {
    selectedProvince = value;
    notifyListeners();
  }

  void setProfilePic(String? path) {
    profilePicPath = path;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _validate() {
    final name = nameController.text.trim();
    final fatherName = fatherNameController.text.trim();
    final phone = phoneNoController.text.trim();
    final email = emailController.text.trim();
    final pass = passwordController.text.trim();

    if (name.isEmpty) return "Please enter name";
    if (fatherName.isEmpty) return "Please enter father name";
    if (phone.isEmpty) return "Please enter phone number";
    if (email.isEmpty) return "Please enter email";
    if (!email.contains("@") || !email.contains(".")) return "Invalid email";
    if (pass.length < 6) return "Password must be at least 6 characters";
    if (selectedTestType == null) return "Please select test type";
    if (selectedProvince == null) return "Please select province";
    if (profilePicPath == null) return "Please upload profile picture";
    return null;
  }

  Future<void> register(BuildContext context) async {
    final error = _validate();
    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      return;
    }

    _isLoading = true;
    notifyListeners();

    // Simulate API delay — replace with real API
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Signed up: ${emailController.text.trim()}")),
    );

    // TODO: Navigate as per your flow (e.g., to OTP or Home)
    // Navigator.pop(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    fatherNameController.dispose();
    phoneNoController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
