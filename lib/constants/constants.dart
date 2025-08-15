import 'package:flutter/material.dart';

class AppPadding {
  static const double horizontal = 20.0;
  static const double fieldSpacing = 25.0;
}

class AppColors {
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      Color(0xFF8C59FF), // top
      Color(0xFF492699), // bottom
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  // For primary buttons
  // static const LinearGradient buttonGradient = LinearGradient(
  //   colors: [Color(0xFF8352F1), Color(0xFF6A3BEF)], // Example from image picker
  //   begin: Alignment.topLeft,
  //   end: Alignment.bottomRight,
  // );

  static const LinearGradient signInGradient = LinearGradient(
    colors: [
      Color(0xFF8C59FF), // top
      Color(0xFF492699), // bottom
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
