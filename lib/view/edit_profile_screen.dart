// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mdcat/providers/edit_profile_provider.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch current user profile when screen opens
    final provider = context.read<EditProfileProvider>();
    provider.fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<EditProfileProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: provider.isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    children: [
                      // Back Button & Title
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, left: 10.0),
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0x0F793FFF),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Profile Picture
                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            provider.profileImage != null &&
                                provider.profileImage.isNotEmpty &&
                                provider.profileImage.startsWith('http')
                            ? NetworkImage(provider.profileImage)
                            : const AssetImage("assets/images/userprofile.png")
                                  as ImageProvider,
                      ),

                      // Stack(
                      //   alignment: Alignment.bottomRight,
                      //   children: [
                      //     CircleAvatar(
                      //       radius: 60,
                      //       backgroundImage:
                      //           provider.profileImage.startsWith('http')
                      //           ? NetworkImage(provider.profileImage)
                      //           : AssetImage(provider.profileImage)
                      //                 as ImageProvider,
                      //     ),
                      //     Positioned(
                      //       bottom: 0,
                      //       right: 0,
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           // Example: update profile image
                      //           provider.updateProfileImage(
                      //             "assets/images/newuserprofile.png",
                      //           );
                      //         },
                      //         child: CircleAvatar(
                      //           radius: 14,
                      //           backgroundColor: Colors.white,
                      //           child: ClipOval(
                      //             child: Image.asset(
                      //               'assets/images/camera.png',
                      //               width: 20,
                      //               height: 20,
                      //               fit: BoxFit.cover,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: 30),

                      // Fields
                      _buildTextField("Name", provider.nameController),
                      SizedBox(height: 15),
                      _buildTextField(
                        "Father Name",
                        provider.fatherNameController,
                      ),
                      SizedBox(height: 15),
                      _buildDropdownField(
                        "Course",
                        ["MDCAT", "ECAT", "SAT"],
                        provider.selectedCourse,
                        provider.updateCourse,
                      ),
                      SizedBox(height: 15),
                      _buildTextField("Email", provider.emailController),
                      SizedBox(height: 15),
                      _buildTextField(
                        "Password",
                        provider.passwordController,
                        isPassword: true,
                      ),
                      SizedBox(height: 15),
                      _buildDropdownField(
                        "Province",
                        [
                          "KPK",
                          "Punjab",
                          "Sindh",
                          "Balochistan",
                          "Gilgit Baltistan",
                          "AJK",
                        ], // Match your API values
                        provider.selectedCity,
                        provider.updateCity,
                      ),

                      SizedBox(height: 15),
                      _buildTextField("Phone no", provider.phoneController),
                      SizedBox(height: 30),

                      // Save Button
                      ElevatedButton(
                        onPressed: provider.saveChanges,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF8266F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 60,
                            vertical: 16,
                          ),
                        ),
                        child: Text(
                          "Save Changes",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      if (provider.errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            provider.errorMessage!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF333333),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0x40333333), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF333333), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(
    String label,
    List<String> items,
    String selectedValue,
    Function(String) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 6),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: selectedValue,
              icon: Icon(Icons.keyboard_arrow_down),
              onChanged: (String? newValue) {
                if (newValue != null) onChanged(newValue);
              },
              items: items
                  .map(
                    (value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
