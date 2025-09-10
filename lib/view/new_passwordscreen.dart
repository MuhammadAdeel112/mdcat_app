import 'package:flutter/material.dart';
import 'package:mdcat/constants/constants.dart';
import 'package:mdcat/view/loginscreen.dart';
// import 'package:mdcat/view/loginscreen.dart';
import 'package:mdcat/widgets/custom_textfield.dart';
import 'package:mdcat/widgets/gradient_button.dart';
import 'package:mdcat/widgets/topgardientwithback.dart';
import 'package:provider/provider.dart';
import 'package:mdcat/providers/new_password_provider.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewPasswordProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, // button stays fixed
      body: SafeArea(
        child: Column(
          children: [
            TopGradientWithBack(
              onBack: () {
                // optional: custom back action
                Navigator.pop(context);
              },
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.horizontal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    const Text(
                      "New Password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 8),

                    const Text(
                      "Please Enter New Password. To update your password",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 25),

                    // New Password
                    const Text(
                      "New Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      textEditingController: provider.newPasswordController,
                      hint: "Enter name",
                      icon: Icons.lock_outline,
                      borderColor: const Color(0x99793FFF),
                      iconColor: const Color(0xFF000000),
                      hintColor: const Color(0xCC333333),
                    ),

                    const SizedBox(height: 20),

                    // Confirm Password
                    const Text(
                      "Confirm your Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      textEditingController: provider.confirmPasswordController,
                      hint: "********",
                      icon: Icons.lock_outline,
                      obscure: true,
                      borderColor: const Color(0x99793FFF),
                      iconColor: const Color(0xFF000000),
                      hintColor: const Color(0xFF793FFF),
                    ),

                    if (provider.errorMessage != null) ...[
                      const SizedBox(height: 10),
                      Text(
                        provider.errorMessage!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppPadding.horizontal,
                0,
                AppPadding.horizontal,
                50, // adjust bottom spacing here
              ),
              child: GradientButton(
                text: provider.isLoading ? "Processing..." : "Continue",
                onPressed: () async {
                  final success = await provider.updatePassword();
                  if (!success) return;

                  // Capture the current screen context
                  final screenContext = context;

                  showDialog(
                    context: screenContext,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: const EdgeInsets.all(20),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Main dialog container
                          Container(
                            width: 350,
                            height: 220, // increased height for image
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Asset Image
                                Image.asset(
                                  "assets/images/tick.png",
                                  width: 80,
                                  height: 80,
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  "Your Password is Updated Successfully",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF793FFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Top-left decorative circle
                          Positioned(
                            top: -40,
                            left: -40,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                color: Color(0x14793FFF),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          // Bottom-right decorative circle
                          Positioned(
                            bottom: -40,
                            right: -40,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                color: Color(0x14793FFF),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                  // Automatically dismiss after 2 seconds and navigate to login
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.of(screenContext).pop();
                    Navigator.of(screenContext).pushReplacement(
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
