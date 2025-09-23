import 'package:flutter/material.dart';

class EditProfileProvider extends ChangeNotifier {
  // Controllers
  final TextEditingController nameController = TextEditingController(
    text: "Melissa Peters",
  );
  final TextEditingController fatherNameController = TextEditingController(
    text: "Melissa Peters",
  );
  final TextEditingController emailController = TextEditingController(
    text: "melpeters@gmail.com",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "********",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "+92354277527",
  );

  // Dropdowns
  String selectedCourse = "MDCAT";
  String selectedCity = "Abbottabad";

  // Profile Image
  String profileImage = "assets/images/userprofile.png";

  // Update dropdown
  void updateCourse(String course) {
    selectedCourse = course;
    notifyListeners();
  }

  void updateCity(String city) {
    selectedCity = city;
    notifyListeners();
  }

  // Update profile image
  void updateProfileImage(String newPath) {
    profileImage = newPath;
    notifyListeners();
  }

  // Save changes
  void saveChanges() {
    // Example: print values, here you can add API call
    print("Name: ${nameController.text}");
    print("Father Name: ${fatherNameController.text}");
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
    print("Phone: ${phoneController.text}");
    print("Course: $selectedCourse");
    print("City: $selectedCity");

    // You can also integrate API to save the data
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
