import 'package:flutter/material.dart';
// import 'package:mdcat/models/student_model.dart';
import 'package:mdcat/providers/gender_provider.dart';
import 'package:mdcat/repo/signup_repo.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // Profile Pic
  String? profilePicPath;

  // Loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Repo instance
  final SignupRepo _repo = SignupRepo();

  // Setters
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

  // Validation
  String? _validate(String gender) {
    if (nameController.text.trim().isEmpty) return "Please enter name";
    if (fatherNameController.text.trim().isEmpty)
      return "Please enter father name";
    if (phoneNoController.text.trim().isEmpty)
      return "Please enter phone number";
    if (emailController.text.trim().isEmpty) return "Please enter email";
    if (!emailController.text.contains("@") ||
        !emailController.text.contains("."))
      return "Invalid email";
    if (passwordController.text.trim().length < 6)
      return "Password must be at least 6 characters";
    if (gender.isEmpty) return "Please select gender";
    if (selectedTestType == null) return "Please select test type";
    if (selectedProvince == null) return "Please select province";
    if (profilePicPath == null) return "Please upload profile picture";
    return null;
  }

  // Register API Call

  Future<void> register(BuildContext context) async {
    final genderProvider = Provider.of<GenderProvider>(context, listen: false);
    final gender = genderProvider.selectedGender;

    final error = _validate(gender);
    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      final student = await _repo.signup(
        name: nameController.text.trim(),
        fatherName: fatherNameController.text.trim(),
        phoneNo: phoneNoController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        testType: selectedTestType!,
        province: selectedProvince!,
        gender: gender,
        profilePicPath: profilePicPath,
      );

      // ✅ Save name in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_name', student.name);

      _isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("🎉 Welcome ${student.name}, signup successful!"),
        ),
      );

      // ✅ Navigate after success
      Navigator.pushReplacementNamed(context, "/home");
    } catch (e) {
      _isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
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
