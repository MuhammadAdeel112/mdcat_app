import 'package:flutter/material.dart';
import 'package:mdcat/widgets/gradient_button.dart';
import 'package:mdcat/widgets/topgardientwithback.dart';
import 'package:provider/provider.dart';
import 'package:mdcat/constants/constants.dart';
import 'package:mdcat/view/Forget_passwordscreen.dart';
import 'package:mdcat/view/signupscreen.dart';
import 'package:mdcat/widgets/custom_textfield.dart';
// import 'package:mdcat/widgets/gradient_button.dart';
// import 'package:mdcat/widgets/topgardientwithback.dart';

import '../providers/login_provider.dart'; // 👈 new provider import

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(), // 👈 attach provider
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final provider = Provider.of<LoginProvider>(
                context,
              ); // 👈 provider instance
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        TopGradientWithBack(
                          onBack: () {
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
                              MaterialPageRoute(builder: (_) => SignupScreen()),
                            );
                          },
                        ),

                        _spacer(),
                        const SizedBox(height: 30),
                        _label("Email"),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.horizontal,
                          ),
                          child: CustomTextField(
                            hint: "Mdcataacademy@gmail.com",
                            icon: Icons.email_outlined,
                            borderColor: Color(0xFF793FFF),
                            iconColor: Color(0xFF793FFF),
                            hintColor: Color(0xFF793FFF),
                            textEditingController: provider
                                .emailController, // 👈 connected controller
                          ),
                        ),

                        _spacer(),

                        _label("Password"),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextField(
                            hint: "********",
                            icon: Icons.lock_outline,
                            obscure: true,
                            borderColor: Color(0xFF793FFF),
                            iconColor: Color(0xFF0F1C2C),
                            hintColor: Color(0xFF0F1C2C),
                            textEditingController: provider
                                .passwordController, // 👈 connected controller
                          ),
                        ),

                        RememberForgot(),
                        const Spacer(),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.horizontal,
                          ),
                          child: GradientButton(
                            text: "Sign In",
                            onPressed: () {
                              provider.login(context); // 👈 login method
                            },
                          ),
                        ),
                        const SizedBox(height: 25),

                        const Spacer(),
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
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  Widget _spacer() => const SizedBox(height: AppPadding.fieldSpacing);
}

//with provider
class RememberForgot extends StatelessWidget {
  const RememberForgot({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context); // 👈 get provider
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
          Checkbox(
            value: provider.rememberMe,
            onChanged: (v) {
              provider.toggleRememberMe();
            },
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all(purple),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          GestureDetector(
            onTap: () {
              provider.toggleRememberMe();
            },
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
