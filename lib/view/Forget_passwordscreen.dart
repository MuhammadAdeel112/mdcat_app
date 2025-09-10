import 'package:flutter/material.dart';
import 'package:mdcat/providers/forget_password_provider.dart';
import 'package:provider/provider.dart';
import 'package:mdcat/constants/constants.dart';
import 'package:mdcat/view/otp_screen.dart';
import 'package:mdcat/widgets/gradient_button.dart';
import 'package:mdcat/widgets/topgardientwithback.dart';
// import 'package:mdcat/providers/forgot_password_provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ForgotPasswordProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, // prevents button moving
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    TopGradientWithBack(
                      onBack: () {
                        // optional: custom back action
                        Navigator.pop(context);
                      },
                    ),

                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.horizontal,
                      ),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.horizontal,
                      ),
                      child: Text(
                        "Please enter the email address or phone number\nassociated with your account",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.horizontal,
                      ),
                      child: Text(
                        "Email Address",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.horizontal,
                        vertical: 8,
                      ),
                      child: TextField(
                        controller: provider.emailController,
                        onChanged: provider.setEmail,
                        decoration: InputDecoration(
                          hintText: "Mdcatacademy@gmail.com",
                          hintStyle: const TextStyle(color: Color(0xFF333333)),
                          errorText: provider.errorText,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 20,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x99793FFF),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x99793FFF),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Fixed button at bottom
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.horizontal,
                vertical: 25,
              ),
              child: GradientButton(
                text: "Send Code",
                onPressed: () {
                  if (provider.validateEmail()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPVerificationScreen(
                          // email: provider.emailController.text,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
