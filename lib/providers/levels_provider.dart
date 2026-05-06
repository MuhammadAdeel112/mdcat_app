import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mdcat/models/level_model.dart';
import 'package:mdcat/services/token_storage.dart';

class LevelsViewModel extends ChangeNotifier {
  LevelModel? _selectedLevel;
  int _userCredits = 50; // default credits (you can change this)
  int get userCredits => _userCredits;

  LevelModel? get selectedLevel => _selectedLevel;

  List<LevelModel> _levels = [];
  bool isLoading = false;
  String? errorMessage;

  List<LevelModel> get levels {
    // Update unlock status dynamically
    for (var level in _levels) {
      level.isUnlocked = _userCredits >= level.price;
    }
    return _levels;
  }

  void selectLevel(LevelModel level) {
    _selectedLevel = level;
    notifyListeners();
  }

  void updateUserCredits(int credits) {
    _userCredits = credits;
    notifyListeners();
  }

  void addCredits(int amount) {
    _userCredits += amount;
    notifyListeners();
  }

  void deductCredits(int amount) {
    _userCredits -= amount;
    if (_userCredits < 0) _userCredits = 0;
    notifyListeners();
  }

  Future<void> fetchLevels(String subject, String className) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final token = await TokenStorage.getToken();
      
      // If the backend expects '1st Year' instead of '11', you can map it here:
      String mappedClass = className;
      if (className == "11") mappedClass = "1st Year";
      if (className == "12") mappedClass = "2nd Year";

      // Properly encoding subject and class to handle spaces (e.g., '1st Year')
      final encodedSubject = Uri.encodeComponent(subject);
      final encodedClass = Uri.encodeComponent(mappedClass);

      // Using the production base URL (change to localhost if you are testing locally)
      final uri = Uri.parse('https://api.mdcatpro.com/api/test/by-subject-class?subject=$encodedSubject&class=$encodedClass');
      
      final response = await http.get(uri, headers: {
        if (token != null) "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true && data['tests'] != null) {
          final List testsData = data['tests'];
          _levels = testsData.map((json) => LevelModel.fromJson(json)).toList();
        } else {
          errorMessage = "No tests found.";
        }
      } else {
        errorMessage = "Server error: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage = "Error fetching tests: $e";
    }

    isLoading = false;
    notifyListeners();
  }
}
