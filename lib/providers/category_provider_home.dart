// import 'dart:ui';

// import 'package:flutter/foundation.dart';

// class Category {
//   final String image;
//   final String title;
//   final String subtitle;
//   final Color color;
//   final bool isEnabled;

//   Category({
//     required this.image,
//     required this.title,
//     required this.subtitle,
//     required this.color,
//     this.isEnabled = true,
//   });
// }

// class CategoryProvider extends ChangeNotifier {
//   final List<Category> _categories = [
//     Category(
//       image: "assets/images/physics.png",
//       title: "Physics",
//       subtitle: "15 Levels",
//       color: const Color(0xFFFAFCFF),
//     ),
//     Category(
//       image: "assets/images/biology.png",
//       title: "Biology",
//       subtitle: "15 Levels",
//       color: const Color(0xFFFCFFFA),
//     ),
//     Category(
//       image: "assets/images/math.png",
//       title: "Math",
//       subtitle: "20 Levels",
//       color: const Color(0xFFFFFCFA),
//     ),
//     Category(
//       image: "assets/images/chemistry.png",
//       title: "Chemistry",
//       subtitle: "15 Levels",
//       color: const Color(0xFFFAFFFD),
//     ),
//     Category(
//       image: "assets/images/english.png",
//       title: "English",
//       subtitle: "20 Levels",
//       color: const Color(0xFFFAFCFF),
//     ),
//     Category(
//       image: "assets/images/mockup.png",
//       title: "Mockup Test",
//       subtitle: "Full syllabus",
//       color: const Color(0xFFFFF8F0),
//     ),
//   ];

//   List<Category> get categories => _categories;
// }
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Category {
  final String id;
  final String image;
  final String title;
  final String subtitle;
  final Color color;
  final bool isEnabled;

  Category({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.color,
    this.isEnabled = true,
  });
}

class CategoryProvider extends ChangeNotifier {
  List<Category> _categories = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchSubjects() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://api.mdcatpro.com/api/subjects'));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true && data['subjects'] != null) {
          final List subjectsData = data['subjects'];
          _categories = subjectsData.map((json) {
            String name = json['name'] ?? '';
            return Category(
              id: json['_id'],
              title: name,
              subtitle: "${json['chapterCount']} Chapters",
              image: _getImageForSubject(name),
              color: _getColorForSubject(name),
            );
          }).toList();
        } else {
          _errorMessage = "Failed to load subjects";
        }
      } else {
        _errorMessage = "Server error: ${response.statusCode}";
      }
    } catch (e) {
      _errorMessage = "Error fetching subjects";
    }

    _isLoading = false;
    notifyListeners();
  }

  Color _getColorForSubject(String name) {
    switch (name.toLowerCase()) {
      case 'physics': return const Color(0xFFFAFCFF);
      case 'biology': return const Color(0xFFFCFFFA);
      case 'mathematics':
      case 'math': return const Color(0xFFFFFCFA);
      case 'chemistry': return const Color(0xFFFAFFFD);
      case 'english': return const Color(0xFFFAFCFF);
      default: return const Color(0xFFFFF8F0);
    }
  }

  String _getImageForSubject(String name) {
    switch (name.toLowerCase()) {
      case 'physics': return "assets/images/physics.png";
      case 'biology': return "assets/images/biology.png";
      case 'mathematics':
      case 'math': return "assets/images/math.png";
      case 'chemistry': return "assets/images/chemistry.png";
      case 'english': return "assets/images/english.png";
      default: return "assets/images/mockup.png";
    }
  }
}
