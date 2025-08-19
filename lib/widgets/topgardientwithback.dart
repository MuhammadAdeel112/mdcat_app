import 'package:flutter/material.dart';

class TopGradientWithBack extends StatelessWidget {
  final VoidCallback? onBack;

  const TopGradientWithBack({this.onBack, super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: onBack ?? () => Navigator.pop(context),
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Color(0xFFE7DBFA),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back_ios, size: 18),
            ),
          ),
        ),
      ),
    );
  }
}
