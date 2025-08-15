import 'package:flutter/material.dart';
import 'package:mdcat/constants/constants.dart';
import 'package:mdcat/view/loginscreen.dart';
import 'package:mdcat/widgets/custom_textfield.dart';
import 'package:mdcat/widgets/drop_down_textfiled.dart';
import 'package:mdcat/widgets/gradient_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                      _topGradientWithBack(context),

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

                      _label("User Name"),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.horizontal,
                        ),
                        child: CustomTextField(
                          hint: "Enter name",
                          icon: Icons.person_outline,
                          iconColor: Colors.black, // icon black
                          hintColor: Color(
                            0xCC333333,
                          ), // #333333CC with 80% opacity
                        ),
                      ),

                      _spacer(),
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

                      _label("Select Role"),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.horizontal,
                        ),
                        child: CustomDropdown(
                          hint: "Select Option",
                          icon: Icons.person_outline, // Can be any icon
                          items: ["Student", "Teacher", "Admin"],
                          iconColor: Colors.black, // black icon
                          hintColor: const Color(0x333333CC), // 80% opacity
                        ),
                      ),

                      _spacer(),
                      _label("Password"),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.horizontal,
                        ),
                        child: CustomTextField(
                          hint: "********",
                          icon: Icons.lock_outline,
                          obscure: true,
                          borderColor: Color(0x99793FFF), // purple 60%
                          iconColor: Color(0xCC0F1C2C), // dark 80%
                          hintColor: Color(0xCC0F1C2C), // dark 80%
                        ),
                      ),

                      _spacer(),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.horizontal,
                        ),
                        child: GradientButton(
                          text: "Sign Up",
                          onPressed: () {},
                        ),
                      ),

                      const SizedBox(height: 25),
                      const Text(
                        "Or Sign up with",
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

  Widget _topGradientWithBack(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFEDE2FF), Colors.white],
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16), // move circle to right
          child: Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xFFE7DBFA),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Transform.translate(
                offset: const Offset(2, 0), // nudges arrow right
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
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
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _spacer() => const SizedBox(height: AppPadding.fieldSpacing);

  Widget _socialRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialButton("Apple", Icons.apple, width: 158),
        const SizedBox(width: 15),
        _socialButton("Google", Icons.g_mobiledata, width: 167),
      ],
    );
  }

  Widget _socialButton(String text, IconData icon, {required double width}) {
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
          Icon(icon, size: 20),
          Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
