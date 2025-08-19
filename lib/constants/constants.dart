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

  static const LinearGradient signInGradient = LinearGradient(
    colors: [
      Color(0xFF8C59FF), // top
      Color(0xFF492699), // bottom
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
