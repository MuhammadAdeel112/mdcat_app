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
  // String selectedCourse = "MDCAT";
  // String selectedCity = "Abbottabad";
  String selectedCourse = "MDCAT";
  String selectedProvince = "KPK"; // default or from API later

  String?
  selectedCity; // ← no default value, will be set after fetching profile

  // Profile Image
  String profileImage = "assets/images/userprofile.png";

  // Loading & Error
  bool isLoading = false;
  String? errorMessage;

  // Base URL
  final String baseUrl = "https://api.mdcatpro.com";

  /// 🔹 Fetch user profile of currently logged-in user
  Future<void> fetchUserProfile() async {
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

      final response = await http.get(
        Uri.parse("$baseUrl/api/student/myProfile"),
        headers: {"Authorization": token, "Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        nameController.text = data['name'] ?? "";
        fatherNameController.text = data['fatherName'] ?? "";
        emailController.text = data['email'] ?? "";
        phoneController.text = data['phoneNo'] ?? "";
        // selectedCourse = data['testType'] ?? "MDCAT";
        selectedCourse = (data['testType'] ?? "MDCAT").toUpperCase();

        selectedProvince = data['province'] ?? "KPK";

        // ✅ FIX: Full image URL handling
        final profilePath = data['profilePic'];
        if (profilePath != null && profilePath.isNotEmpty) {
          if (profilePath.startsWith('http')) {
            profileImage = profilePath;
          } else {
            profileImage =
                "$baseUrl/uploads/$profilePath"; // or your actual image folder path
          }
          print("🖼️ Full image URL: $profileImage");
        }
      } else {
        errorMessage = "Failed to fetch profile: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage = "Exception fetching profile: $e";
    }

    isLoading = false;
    notifyListeners();
  }

  // Future<void> fetchUserProfile() async {
  //   isLoading = true;
  //   errorMessage = null;
  //   notifyListeners();

  //   try {
  //     final token = await TokenStorage.getToken(); // Dynamic token per user
  //     if (token == null || token.isEmpty) {
  //       errorMessage = "No token found. Please login again.";
  //       isLoading = false;
  //       notifyListeners();
  //       return;
  //     }

  //     final response = await http.get(
  //       Uri.parse("$baseUrl/api/student/myProfile"),
  //       headers: {"Authorization": token, "Content-Type": "application/json"},
  //     );

  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);

  //       // Map API response to provider fields
  //       nameController.text = data['name'] ?? "";
  //       fatherNameController.text = data['fatherName'] ?? "";
  //       emailController.text = data['email'] ?? "";
  //       phoneController.text = data['phoneNo'] ?? "";
  //       selectedCourse = data['testType'] ?? "MDCAT";
  //       selectedProvince = data['province'] ?? "KPK";

  //       // selectedCity = data['province'] ?? "Abbottabad";
  //       // selectedCity =
  //       //     data['province'] ?? "KPK"; // fallback, but dynamic from API

  //       profileImage = data['profilePic'] ?? profileImage;
  //     } else {
  //       errorMessage = "Failed to fetch profile: ${response.statusCode}";
  //     }
  //   } catch (e) {
  //     errorMessage = "Exception fetching profile: $e";
  //   }

  //   isLoading = false;
  //   notifyListeners();
  // }

  /// 🔹 Update dropdowns
  void updateCourse(String course) {
    selectedCourse = course;
    notifyListeners();
  }

  void updateProvince(String province) {
    selectedProvince = province;
    notifyListeners();
  }

  // void updateCity(String city) {
  //   selectedCity = city;
  //   notifyListeners();
  // }

  /// 🔹 Update profile image
  void updateProfileImage(String newPath) {
    profileImage = newPath;
    notifyListeners();
  }

  /// 🔹 Save changes for currently logged-in user
  // Future<void> saveChanges() async {
  Future<void> saveChanges(BuildContext context) async {
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

      var request = http.MultipartRequest(
        "PUT",
        Uri.parse("$baseUrl/api/student/updateProfile"),
      );

      // ✅ Add headers
      request.headers.addAll({
        "Authorization": token,
        "Content-Type": "multipart/form-data",
      });

      // ✅ Add text fields
      request.fields["name"] = nameController.text;
      request.fields["fatherName"] = fatherNameController.text;
      request.fields["phoneNo"] = phoneController.text;
      request.fields["email"] = emailController.text;
      request.fields["password"] = passwordController.text.isNotEmpty
          ? passwordController.text
          : "123"; // fallback if empty
      request.fields["testType"] = selectedCourse;
      //  request.fields["province"] = selectedCity;
      request.fields["province"] = selectedProvince;

      // ✅ Profile pic (if you want to send a file, uncomment this)
      // if (profileImage != "assets/images/userprofile.png" &&
      //     !profileImage.startsWith("http")) {
      //   request.files.add(await http.MultipartFile.fromPath(
      //     "profilePic",
      //     profileImage,
      //   ));
      // }

      // If profileImage is just a URL (not a file), send as text
      if (profileImage.startsWith("http")) {
        request.fields["profilePic"] = profileImage;
      }

      // ✅ Send request
      var response = await request.send();
      var responseData = await http.Response.fromStream(response);
      if (response.statusCode == 200) {
        debugPrint("✅ Profile updated successfully!");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Profile updated successfully")),
        );
      } else {
        errorMessage = "Failed to update profile: ${response.statusCode}";
        debugPrint("❌ ${responseData.body}");
      }
    } catch (e) {
      errorMessage = "Exception saving profile: $e";
      debugPrint("❌ Exception: $e");
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
