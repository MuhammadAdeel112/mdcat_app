import 'package:flutter/material.dart';
import 'package:mdcat/constants/constants.dart';
import 'package:mdcat/view/Forget_passwordscreen.dart';
import 'package:mdcat/view/signupscreen.dart';
import 'package:mdcat/widgets/custom_textfield.dart';
import 'package:mdcat/widgets/gradient_button.dart';
import 'package:mdcat/widgets/topgardientwithback.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      TopGradientWithBack(
                        onBack: () {
                          // optional: custom back action
                          Navigator.pop(context);
                        },
                      ),

                      _tabSwitcher(
                        leftText: "Sign In",
                        rightText: "Sign Up",
                        isLeftActive: true,
                        onRightTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignupScreen(),
                            ),
                          );
                        },
                      ),

                      _spacer(),
                      const SizedBox(height: 30),
                      _label("Email"),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.horizontal,
                        ),
                        child: CustomTextField(
                          hint: "Mdcataacademy@gmail.com",
                          icon: Icons.email_outlined,
                          borderColor: Color(0xFF793FFF),
                          iconColor: Color(0xFF793FFF),
                          hintColor: Color(0xFF793FFF),
                        ),
                      ),

                      _spacer(),

                      _label("Password"),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: CustomTextField(
                          hint: "********",
                          icon: Icons.lock_outline,
                          obscure: true,
                          borderColor: Color(0xFF793FFF), // Purple border
                          iconColor: Color(0xFF0F1C2C), // Purple icon
                          hintColor: Color(0xFF0F1C2C), // Dark grey hint
                        ),
                      ),

                      // const   _rememberForgot(),
                      RememberForgot(),
                      const Spacer(),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.horizontal,
                        ),
                        child: GradientButton(
                          text: "Sign In",
                          onPressed: () {},
                        ),
                      ),

                      const SizedBox(height: 25),
                      const Text(
                        "Or Sign in with",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 25),
                      _socialRow(),

                      const Spacer(),
                    ],
                  ),
                ),
              ),
            );
          },
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
        top: 12, // space from arrow
      ),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF8352F1)),
          borderRadius: BorderRadius.circular(13), // less circular
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
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold, // makes it bold
            fontSize: 16, // optional: makes it look nicer
          ),
        ),
      ),
    );
  }

  Widget _spacer() => const SizedBox(height: AppPadding.fieldSpacing);
  Widget _socialRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialButton("Facebook", "assets/images/facebook.jpg", width: 167),
        const SizedBox(width: 15),
        _socialButton("Google", "assets/images/google.png", width: 167),
      ],
    );
  }

  Widget _socialButton(String text, String assetPath, {required double width}) {
    return Container(
      width: width,
      height: 48,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 41),
      decoration: BoxDecoration(
        color: const Color(0x1A793FFF), // #793FFF with 10% opacity
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(assetPath, width: 20, height: 20, fit: BoxFit.contain),
          Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // Widget _socialRow() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       _socialButton("Apple", Icons.apple, width: 158),
  //       const SizedBox(width: 15),
  //       _socialButton("Google", Icons.g_mobiledata, width: 167),
  //     ],
  //   );
  // }

  // Widget _socialButton(String text, IconData icon, {required double width}) {
  //   return Container(
  //     width: width,
  //     height: 48,
  //     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 41),
  //     decoration: BoxDecoration(
  //       color: const Color(0x1A793FFF), // #793FFF with 10% opacity
  //       borderRadius: BorderRadius.circular(40),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Icon(icon, size: 20),
  //         Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
  //       ],
  //     ),
  //   );
  // }
}

class RememberForgot extends StatelessWidget {
  final ValueNotifier<bool> rememberMe = ValueNotifier<bool>(false);

  RememberForgot({super.key});

  void _toggle(bool? v) {
    rememberMe.value = v ?? !rememberMe.value;
  }

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF793FFF);

    return Padding(
      padding: const EdgeInsets.only(
        left: AppPadding.horizontal - 10,
        right: AppPadding.horizontal,
        top: 5,
        bottom: 5,
      ),
      child: Row(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: rememberMe,
            builder: (context, value, _) {
              return Checkbox(
                value: value,
                onChanged: _toggle,
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.all(purple),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            },
          ),
          GestureDetector(
            onTap: () => _toggle(!rememberMe.value),
            child: const Text(
              "Remember me",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
              );
            },
            child: const Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
