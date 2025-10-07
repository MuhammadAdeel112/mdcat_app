import 'package:flutter/material.dart';
import 'package:mdcat/view/gender_selectionscreen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:mdcat/widgets/topgardientwithback.dart';

// Wrapper Screen
class OnboardingWrapper extends StatefulWidget {
  const OnboardingWrapper({super.key});

  @override
  State<OnboardingWrapper> createState() => _OnboardingWrapperState();
}

class _OnboardingWrapperState extends State<OnboardingWrapper> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              BodyContentScreen1(),
              BodyContentScreen2(controller: _controller), // pass controller
              BodyContentScreen3(controller: _controller),
            ],
          ),

          if (currentPage != 0)
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                    dotHeight: 9,
                    dotWidth: 9,
                    activeDotColor: Color(0xFF8C59FF),
                    dotColor: Color(0xFFDFD2FF),
                  ),
                ),
              ),
            ),

          // Next Button
          Positioned(
            bottom: 30,
            left: 24,
            right: 24,
            child: GestureDetector(
              onTap: () {
                if (currentPage < 2) {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                } else {
                  // Final screen action
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenderSelectionScreen(),
                    ),
                  );
                }
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF793FFF),
                      Color(0xFF35E1D0),
                      Color(0xFF492699),
                    ],
                    stops: [0.0731, 1.0128, 1.0463],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Body for Screen 1
class BodyContentScreen1 extends StatelessWidget {
  const BodyContentScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Background Circles
        Positioned(
          left: -50,
          top: 100,
          child: _buildCircle(100, Colors.blue.shade200),
        ),
        Positioned(
          right: -60,
          top: 40,
          child: _buildCircle(140, Colors.deepOrange.shade200),
        ),
        Positioned(
          left: 100,
          top: 280,
          child: _buildCircle(80, Color(0xFF35E1D0)), // big blue near girl
        ),
        Positioned(
          right: 40,
          bottom: 375,
          child: _buildCircle(20, Colors.blue.shade300),
        ),
        Positioned(
          left: 40,
          top: 220,
          child: _buildCircle(20, Colors.red.shade200),
        ),

        /// Main Content
        SafeArea(
          child: Column(
            children: [
              const Spacer(),

              /// Girl with Laptop
              Center(
                child: Image.asset(
                  "assets/images/onboarding1.png",
                  height: 346,
                ),
              ),

              const SizedBox(height: 40),

              /// Title
              const Text(
                "MDCAT",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6C4DFF),
                ),
              ),

              const SizedBox(height: 12),

              /// Subtitle
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Dream. Prepare. Achieve.\nEvery great doctor once dreamed just like you. Start your journey with passion, purpose, and preparation.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}

/// Body for Screen 2
class BodyContentScreen2 extends StatelessWidget {
  final PageController controller;
  const BodyContentScreen2({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ✅ Top Gradient With Back
        // TopGradientWithBack(),
        Transform.translate(
          offset: const Offset(0, 0),
          child: TopGradientWithBack(
            onBack: () {
              // Navigate to previous page instead of popping
              controller.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
        Transform.translate(
          offset: const Offset(-10, -40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: const Text(
              "Smart Learning for Sharp Minds.\nEmpower your preparation with tools that simplify concepts, strengthen practice, and boost confidence.",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xCC333333),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        Transform.translate(
          offset: const Offset(-10, -45),
          child: Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Container(
              width: 282,
              height: 368,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/onboarding 2.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

        Transform.translate(
          offset: const Offset(0, -80),
          child: SizedBox(
            height: 200,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 20,
                  child: buildSmallImage("assets/images/onboarding 2.1.png"),
                ),
                Positioned(
                  top: 0,
                  left: 137,
                  child: buildSmallImage("assets/images/onboarding 2.2.png"),
                ),
                Positioned(
                  top: 0,
                  left: 254,
                  child: buildSmallImage("assets/images/omboarding 2.3.png"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Body for Screen 3
class BodyContentScreen3 extends StatelessWidget {
  final PageController controller;
  const BodyContentScreen3({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ✅ Top gradient with back + text

        // TopGradientWithBack(),
        Transform.translate(
          offset: const Offset(0, 0),
          child: TopGradientWithBack(
            onBack: () {
              controller.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
        Transform.translate(
          offset: const Offset(-10, -40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: const Text(
              "Turn Aspiration into Admission.\nWith focus, discipline, and the right guidance, your white coat dream is closer than you think.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xCC333333),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        // Main Image
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                offset: const Offset(0, -110),
                child: Image.asset(
                  "assets/images/onboarding3.png",
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Reusable Widgets
Widget _buildCircle(double size, Color color) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: color.withOpacity(0.8),
      shape: BoxShape.circle,
    ),
  );
}

Widget buildSmallImage(String path) {
  return Container(
    width: 100,
    height: 166,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,

          blurRadius: 5,
          spreadRadius: 1,
          offset: Offset(2, 2),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.asset(path, fit: BoxFit.cover),
    ),
  );
}
