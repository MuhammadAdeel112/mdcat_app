import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mdcat/constants/constants.dart';
import 'package:mdcat/view/new_passwordscreen.dart';
import 'package:mdcat/widgets/gradient_button.dart';
import 'package:mdcat/widgets/topgardientwithback.dart';

class OTPVerificationScreen extends StatelessWidget {
  final List<TextEditingController> _controllers = List.generate(
    5,
    (_) => TextEditingController(),
  );

  final List<ValueNotifier<bool>> _filledList = List.generate(
    5,
    (_) => ValueNotifier<bool>(false),
  );

  // ✅ Countdown notifier
  final ValueNotifier<int> _secondsRemaining = ValueNotifier<int>(15);

  OTPVerificationScreen({super.key}) {
    // Start the countdown timer
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining.value == 0) {
        timer.cancel();
      } else {
        _secondsRemaining.value -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
                      "Enter Confirmation Code",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Please Enter that six (6) digit code to example@gmail.com, and continue that was sent to your email address",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 25),

                    // ✅ OTP input boxes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(5, (index) {
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
                                  _filledList[index].value = value
                                      .isNotEmpty; // ✅ update only that box
                                  if (value.isNotEmpty && index < 4) {
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
                                    TextSpan(
                                      text: "You can Request a new OTP after ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(
                                          0xCC000000,
                                        ), // 80% opacity black
                                      ),
                                    ),
                                    TextSpan(
                                      text: "$seconds",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF793FFF), // purple
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Seconds",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(
                                          0xCC000000,
                                        ), // 80% opacity black
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewPasswordScreen(),
                        ),
                      );
                    },
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
                                  // Main dialog container
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
                                  // Top-left decorative circle (larger)
                                  Positioned(
                                    top: -40, // moved a bit more outward
                                    left: -40,
                                    child: Container(
                                      width: 80, // increased size
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: const Color(
                                          0x14793FFF,
                                        ), // 8% opacity
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  // Bottom-right decorative circle (larger)
                                  Positioned(
                                    bottom: -40,
                                    right: -40,
                                    child: Container(
                                      width: 80, // increased size
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: const Color(
                                          0x14793FFF,
                                        ), // 8% opacity
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );

                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.of(context).pop();
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
