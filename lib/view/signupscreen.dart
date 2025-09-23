import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mdcat/constants/constants.dart';
import 'package:mdcat/providers/gender_provider.dart';
import 'package:mdcat/view/loginscreen.dart';
import 'package:mdcat/widgets/custom_textfield.dart';
import 'package:mdcat/widgets/drop_down_textfiled.dart';
import 'package:mdcat/widgets/gradient_button.dart';
import 'package:mdcat/widgets/topgardientwithback.dart';
import 'package:provider/provider.dart';
import 'package:mdcat/providers/signup_provider.dart';
import 'package:image_picker/image_picker.dart';
// import 'dart:io';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupProvider(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final provider = Provider.of<SignupProvider>(context);

              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        TopGradientWithBack(
                          onBack: () => Navigator.pop(context),
                        ),

                        _tabSwitcher(
                          leftText: "Sign Up",
                          rightText: "Sign In",
                          isLeftActive: true,
                          onRightTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                            );
                          },
                        ),

                        _spacer(),
                        _label("Name"),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.horizontal,
                          ),
                          child: CustomTextField(
                            hint: "Enter your name",
                            icon: Icons.person_outline,
                            iconColor: Colors.black,
                            hintColor: const Color(0xCC333333),
                            textEditingController: provider.nameController,
                          ),
                        ),

                        _spacer(),
                        _label("Father Name"),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.horizontal,
                          ),
                          child: CustomTextField(
                            hint: "Enter father name",
                            icon: Icons.person_outline,
                            iconColor: Colors.black,
                            hintColor: const Color(0xCC333333),
                            textEditingController:
                                provider.fatherNameController,
                          ),
                        ),

                        _spacer(),
                        _label("Phone Number"),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.horizontal,
                          ),
                          child: CustomTextField(
                            hint: "03XXXXXXXXX",
                            icon: Icons.phone,
                            iconColor: Colors.black,
                            hintColor: const Color(0xCC333333),
                            textEditingController: provider.phoneNoController,
                          ),
                        ),

                        _spacer(),
                        _label("Email"),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.horizontal,
                          ),
                          child: CustomTextField(
                            hint: "example@gmail.com",
                            icon: Icons.email_outlined,
                            borderColor: const Color(0xFF793FFF),
                            iconColor: const Color(0xFF793FFF),
                            hintColor: const Color(0xFF793FFF),
                            textEditingController: provider.emailController,
                          ),
                        ),

                        _spacer(),
                        _label("Password"),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.horizontal,
                          ),
                          child: CustomTextField(
                            hint: "********",
                            icon: Icons.lock_outline,
                            obscure: true,
                            borderColor: const Color(0x99793FFF),
                            iconColor: const Color(0xCC0F1C2C),
                            hintColor: const Color(0xCC0F1C2C),
                            textEditingController: provider.passwordController,
                          ),
                        ),

                        _spacer(),
                        _label("Gender"),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.horizontal,
                          ),
                          child: Consumer<GenderProvider>(
                            builder: (context, genderProvider, _) {
                              return CustomDropdown(
                                hint: "Select Gender",
                                icon: Icons.person,
                                items: const ["Male", "Female"],
                                iconColor: Colors.black,
                                hintColor: const Color(0x333333CC),
                                value: genderProvider
                                    .selectedGender, // 👈 preselect from onboarding
                                onChanged: (value) {
                                  if (value != null) {
                                    genderProvider.setGender(value);
                                  }
                                },
                              );
                            },
                          ),
                        ),

                        _spacer(),
                        _label("Test Type"),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.horizontal,
                          ),
                          child: CustomDropdown(
                            hint: "Select Test Type",
                            icon: Icons.school,
                            items: const ["MDCAT", "NUMS", "ECAT"],
                            iconColor: Colors.black,
                            hintColor: const Color(0x333333CC),
                            onChanged: (value) => provider.setTestType(value),
                          ),
                        ),

                        _spacer(),
                        _label("Province"),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.horizontal,
                          ),
                          child: CustomDropdown(
                            hint: "Select Province",
                            icon: Icons.location_on,
                            items: const [
                              "Punjab",
                              "Sindh",
                              "KPK",
                              "Balochistan",
                              "Gilgit Baltistan",
                              "AJK",
                            ],
                            iconColor: Colors.black,
                            hintColor: const Color(0x333333CC),
                            onChanged: (value) => provider.setProvince(value),
                          ),
                        ),

                        _spacer(),
                        _label("Profile Picture"),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.horizontal,
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();
                              final XFile? pickedFile = await picker.pickImage(
                                source: ImageSource.gallery,
                              );

                              if (pickedFile != null) {
                                provider.setProfilePic(pickedFile.path);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Profile picture selected"),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("No image selected"),
                                  ),
                                );
                              }
                            },

                            child: Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF793FFF),
                                ),
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xFFF8F6FF),
                              ),
                              child: provider.profilePicPath == null
                                  ? const Center(
                                      child: Text(
                                        "Tap to upload profile picture",
                                        style: TextStyle(
                                          color: Color(0xCC333333),
                                        ),
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.file(
                                        File(
                                          provider.profilePicPath!,
                                        ), // ✅ show preview
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 120,
                                      ),
                                    ),
                            ),
                          ),
                        ),

                        _spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.horizontal,
                          ),
                          child: GradientButton(
                            text: provider.isLoading
                                ? "Please wait..."
                                : "Sign Up",

                            onPressed: () async {
                              if (!provider.isLoading) {
                                await provider.register(context); // 👈 call API

                                // If signup is successful, navigate to login
                                if (context.mounted) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const LoginScreen(),
                                    ),
                                  );
                                }
                              }
                            },
                          ),

                          // child: GradientButton(
                          //   text: provider.isLoading
                          //       ? "Please wait..."
                          //       : "Sign Up",
                          //   onPressed: () {
                          //     if (!provider.isLoading) {
                          //       // provider.register(context);
                          //       Navigator.pushReplacement(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (_) => const LoginScreen(),
                          //         ),
                          //       );
                          //     }
                          //   },
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _tabSwitcher({
    required String leftText,
    required String rightText,
    required bool isLeftActive,
    required VoidCallback onRightTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppPadding.horizontal,
        right: AppPadding.horizontal,
        top: 12,
      ),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF8352F1)),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: isLeftActive ? AppColors.signInGradient : null,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Center(
                  child: Text(
                    leftText,
                    style: TextStyle(
                      color: isLeftActive ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: onRightTap,
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: !isLeftActive ? AppColors.signInGradient : null,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      rightText,
                      style: TextStyle(
                        color: !isLeftActive ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _spacer() => const SizedBox(height: AppPadding.fieldSpacing);

  // Widget _socialRow() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       _socialButton("Facebook", "assets/images/facebook.jpg", width: 167),
  //       const SizedBox(width: 15),
  //       _socialButton("Google", "assets/images/google.png", width: 167),
  //     ],
  //   );
  // }

  // Widget _socialButton(String text, String assetPath, {required double width}) {
  //   return Container(
  //     width: width,
  //     height: 48,
  //     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 41),
  //     decoration: BoxDecoration(
  //       color: const Color(0x1A793FFF),
  //       borderRadius: BorderRadius.circular(40),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Image.asset(assetPath, width: 20, height: 20, fit: BoxFit.contain),
  //         Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
  //       ],
  //     ),
  //   );
  // }
}
