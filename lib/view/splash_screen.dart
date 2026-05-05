import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mdcat/view/on_boardingwrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:mdcat/view/onboarding_wrapper.dart';
import 'package:mdcat/view/loginscreen.dart';
import 'package:mdcat/view/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    final prefs = await SharedPreferences.getInstance();
    final hasCompletedOnboarding =
        prefs.getBool('hasCompletedOnboarding') ?? false;
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    Timer(const Duration(seconds: 3), () {
      if (!hasCompletedOnboarding) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const OnboardingWrapper()),
        );
      } else if (isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/mdcat real logo.jpg',
              width: 180,
              height: 180,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: Color(0xFF8C59FF)),
          ],
        ),
      ),
    );
  }
}
