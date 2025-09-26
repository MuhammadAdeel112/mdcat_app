import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mdcat/services/token_storage.dart';

class EditProfileProvider extends ChangeNotifier {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Dropdowns
  String selectedCourse = "MDCAT";
  String selectedCity = "Abbottabad";

  // Profile Image
  String profileImage = "assets/images/userprofile.png";

  // Loading & Error
  bool isLoading = false;
  String? errorMessage;

  // Base URL
  final String baseUrl = "http://47.130.103.135";

  /// 🔹 Fetch user profile of currently logged-in user
  Future<void> fetchUserProfile() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final token = await TokenStorage.getToken(); // Dynamic token per user
      if (token == null || token.isEmpty) {
        errorMessage = "No token found. Please login again.";
        isLoading = false;
        notifyListeners();
        return;
      }

      final response = await http.get(
        Uri.parse("$baseUrl/api/student/myProfile"),
        headers: {"Authorization": token, "Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Map API response to provider fields
        nameController.text = data['name'] ?? "";
        fatherNameController.text = data['fatherName'] ?? "";
        emailController.text = data['email'] ?? "";
        phoneController.text = data['phoneNo'] ?? "";
        selectedCourse = data['testType'] ?? "MDCAT";
        selectedCity = data['province'] ?? "Abbottabad";
        profileImage = data['profilePic'] ?? profileImage;
      } else {
        errorMessage = "Failed to fetch profile: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage = "Exception fetching profile: $e";
    }

    isLoading = false;
    notifyListeners();
  }

  /// 🔹 Update dropdowns
  void updateCourse(String course) {
    selectedCourse = course;
    notifyListeners();
  }

  void updateCity(String city) {
    selectedCity = city;
    notifyListeners();
  }

  /// 🔹 Update profile image
  void updateProfileImage(String newPath) {
    profileImage = newPath;
    notifyListeners();
  }

  /// 🔹 Save changes for currently logged-in user
  Future<void> saveChanges() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final token = await TokenStorage.getToken();
      if (token == null || token.isEmpty) {
        errorMessage = "No token found. Please login again.";
        isLoading = false;
        notifyListeners();
        return;
      }

      final response = await http.put(
        Uri.parse("$baseUrl/api/student/updateProfile"),
        headers: {"Authorization": token, "Content-Type": "application/json"},
        body: jsonEncode({
          "name": nameController.text,
          "fatherName": fatherNameController.text,
          "email": emailController.text,
          "phoneNo": phoneController.text,
          "testType": selectedCourse,
          "province": selectedCity,
          "profilePic": profileImage,
        }),
      );

      if (response.statusCode == 200) {
        debugPrint("✅ Profile updated successfully!");
      } else {
        errorMessage = "Failed to update profile: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage = "Exception saving profile: $e";
    }

    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    fatherNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
