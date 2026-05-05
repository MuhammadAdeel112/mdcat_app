import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mdcat/constants/constants.dart';
// import 'package:mdcat/services/auth_service.dart';
import 'package:mdcat/services/auth_services.dart';
import 'package:mdcat/view/new_passwordscreen.dart';
import 'package:mdcat/widgets/gradient_button.dart';
import 'package:mdcat/widgets/topgardientwithback.dart';

class OTPVerificationScreen extends StatelessWidget {
  final String email;
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  final List<ValueNotifier<bool>> _filledList = List.generate(
    6,
    (_) => ValueNotifier<bool>(false),
  );

  final ValueNotifier<int> _secondsRemaining = ValueNotifier<int>(60);
  final AuthService _authService = AuthService();

  OTPVerificationScreen({super.key, required this.email}) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining.value == 0) {
        timer.cancel();
      } else {
        _secondsRemaining.value -= 1;
      }
    });
  }

  Future<void> _verifyCode(BuildContext context) async {
    final code = _controllers.map((e) => e.text).join();
    if (code.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a 6-digit code')),
      );
      return;
    }

    try {
      await _authService.verifyCode(email, code);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ OTP Verified Successfully')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => NewPasswordScreen(
            email: email, // from your forget password screen
            code: code, // from your verify code input
          ),
        ),
      );

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => NewPasswordScreen()),
      // );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
      );
    }
  }

  Future<void> _resendCode(BuildContext context) async {
    try {
      final response = await _authService.forgotPassword(email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response['message'] ?? 'Verification code resent successfully',
          ),
        ),
      );

      // Reset the countdown timer
      _secondsRemaining.value = 20;
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_secondsRemaining.value == 0) {
          timer.cancel();
        } else {
          _secondsRemaining.value -= 1;
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            TopGradientWithBack(onBack: () => Navigator.pop(context)),
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
                      "Enter Confirmation Code",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Please enter the six (6) digit code sent to $email, and continue.",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          width: 45,
                          height: 50,
                          child: ValueListenableBuilder<bool>(
                            valueListenable: _filledList[index],
                            builder: (context, isFilled, _) {
                              return TextField(
                                controller: _controllers[index],
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                onChanged: (value) {
                                  _filledList[index].value = value.isNotEmpty;
                                  if (value.isNotEmpty && index < 5) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  counterText: "",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: isFilled
                                          ? const Color(0xFF793FFF)
                                          : const Color(0xFFB3B3B3),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: isFilled
                                          ? const Color(0xFF793FFF)
                                          : const Color(0xFFB3B3B3),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: isFilled
                                          ? const Color(0xFF793FFF)
                                          : const Color(0xFFB3B3B3),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 15),
                    ValueListenableBuilder<int>(
                      valueListenable: _secondsRemaining,
                      builder: (context, seconds, _) {
                        return seconds > 0
                            ? RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "You can Request a new OTP after ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xCC000000),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "$seconds",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF793FFF),
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: " Seconds",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xCC000000),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.horizontal,
                vertical: 20,
              ),
              child: Column(
                children: [
                  GradientButton(
                    text: "Verify",
                    onPressed: () => _verifyCode(context),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn’t get a code? "),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              backgroundColor: Colors.transparent,
                              insetPadding: const EdgeInsets.all(20),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: 350,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    padding: const EdgeInsets.all(24),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Resend Your Verification Code",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF793FFF),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "Resend your verification code. Kindly check your email.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xB2000000),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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

                          // ✅ After 2 seconds, close dialog and call resend API
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.of(context).pop();
                            _resendCode(context);
                          });
                        },
                        child: const Text(
                          "Resend",
                          style: TextStyle(
                            color: Color(0xFF793FFF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
