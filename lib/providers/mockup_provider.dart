import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mdcat/models/level_model.dart';
import 'package:mdcat/services/token_storage.dart';

class MockupProvider extends ChangeNotifier {
  List<LevelModel> _mockups = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<LevelModel> get mockups => _mockups;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchMockups() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final token = await TokenStorage.getToken();
      final uri = Uri.parse('https://api.mdcatpro.com/api/test/mockup');

      final response = await http.get(uri, headers: {
        if (token != null) "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      });

      debugPrint("🔹 Mockup API Status: ${response.statusCode}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true && data['tests'] != null) {
          final List testsData = data['tests'];
          
          _mockups = testsData.map((json) {
            // Mapping mockup specific fields to LevelModel
            return LevelModel(
              id: json['_id'] ?? '',
              title: json['title'] ?? '',
              mcqs: json['totalQuestions'] ?? 0, // Mockup use totalQuestions
              price: json['credits'] ?? 0,
              level: json['chapter'] ?? 'Mockup Test',
              testDuration: json['testDuration'] ?? 0,
              isUnlocked: true, // We'll manage unlock logic if needed
              isFree: json['isFree'] ?? false,
            );
          }).toList();
          
          debugPrint("✅ Mockups fetched: ${_mockups.length}");
        } else {
          _errorMessage = "No mockup tests found.";
        }
      } else {
        _errorMessage = "Server error: ${response.statusCode}";
      }
    } catch (e) {
      _errorMessage = "Error fetching mockups: $e";
      debugPrint("❌ Mockup API Error: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
