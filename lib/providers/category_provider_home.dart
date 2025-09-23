import 'dart:ui';

import 'package:flutter/foundation.dart';

class Category {
  final String image;
  final String title;
  final String subtitle;
  final Color color;
  final bool isEnabled;

  Category({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.color,
    this.isEnabled = true,
  });
}

class CategoryProvider extends ChangeNotifier {
  final List<Category> _categories = [
    Category(
      image: "assets/images/physics.png",
      title: "Physics",
      subtitle: "15 Levels",
      color: const Color(0xFFFAFCFF),
    ),
    Category(
      image: "assets/images/biology.png",
      title: "Biology",
      subtitle: "15 Levels",
      color: const Color(0xFFFCFFFA),
    ),
    Category(
      image: "assets/images/math.png",
      title: "Math",
      subtitle: "20 Levels",
      color: const Color(0xFFFFFCFA),
    ),
    Category(
      image: "assets/images/chemistry.png",
      title: "Chemistry",
      subtitle: "15 Levels",
      color: const Color(0xFFFAFFFD),
    ),
    Category(
      image: "assets/images/english.png",
      title: "English",
      subtitle: "20 Levels",
      color: const Color(0xFFFAFCFF),
    ),
    Category(
      image: "assets/images/mockup.png",
      title: "Mockup Test",
      subtitle: "Full syllabus",
      color: const Color(0xFFFFF8F0),
    ),
  ];

  List<Category> get categories => _categories;
}
