import 'package:flutter/material.dart';
import '../models/level_model.dart';

class LevelsViewModel extends ChangeNotifier {
  int _userCredits =
      50; // 👈 Example: initial credits (could be fetched from DB)
  final List<LevelModel> _levels = List.generate(
    15,
    (index) => LevelModel(
      id: index + 1,
      title: "Level ${index + 1}",
      mcqs: (index % 2 == 0) ? 20 : 15,
      price: (index + 1) * 5, // 👈 Example: price grows with level
    ),
  );

  List<LevelModel> get levels => _levels;
  int get userCredits => _userCredits;

  /// Try to unlock a level
  bool unlockLevel(int id) {
    final level = _levels.firstWhere((lvl) => lvl.id == id);
    if (_userCredits >= level.price) {
      _userCredits -= level.price;
      level.isUnlocked = true;
      notifyListeners();
      return true; // success
    }
    return false; // not enough credits
  }

  /// Add credits after purchase
  void addCredits(int amount) {
    _userCredits += amount;
    notifyListeners();
  }
}
