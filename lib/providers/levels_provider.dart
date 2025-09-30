// import 'package:flutter/material.dart';
// import '../models/level_model.dart';

// class LevelsViewModel extends ChangeNotifier {
//   int _userCredits =
//       50; // 👈 Example: initial credits (could be fetched from DB)
//   final List<LevelModel> _levels = List.generate(
//     15,
//     (index) => LevelModel(
//       id: index + 1,
//       title: "Level ${index + 1}",
//       mcqs: (index % 2 == 0) ? 20 : 15,
//       price: (index + 1) * 5, // 👈 Example: price grows with level
//     ),
//   );

//   List<LevelModel> get levels => _levels;
//   int get userCredits => _userCredits;

//   /// Try to unlock a level
//   bool unlockLevel(int id) {
//     final level = _levels.firstWhere((lvl) => lvl.id == id);
//     if (_userCredits >= level.price) {
//       _userCredits -= level.price;
//       level.isUnlocked = true;
//       notifyListeners();
//       return true; // success
//     }
//     return false; // not enough credits
//   }

//   /// Add credits after purchase
//   void addCredits(int amount) {
//     _userCredits += amount;
//     notifyListeners();
//   }
// }
// import 'package:flutter/material.dart';
// import '../models/level_model.dart';

// class LevelsViewModel extends ChangeNotifier {
//   int _userCredits = 50;

//   // ✅ Use real ObjectId strings for testId
//   final List<LevelModel> _levels = [
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc2f",
//       title: "Level 1",
//       mcqs: 20,
//       price: 5,
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc30",
//       title: "Level 2",
//       mcqs: 15,
//       price: 10,
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc31",
//       title: "Level 3",
//       mcqs: 20,
//       price: 15,
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc32",
//       title: "Level 4",
//       mcqs: 15,
//       price: 20,
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc33",
//       title: "Level 5",
//       mcqs: 20,
//       price: 25,
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc34",
//       title: "Level 6",
//       mcqs: 15,
//       price: 30,
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc35",
//       title: "Level 7",
//       mcqs: 20,
//       price: 35,
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc36",
//       title: "Level 8",
//       mcqs: 15,
//       price: 40,
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc37",
//       title: "Level 9",
//       mcqs: 20,
//       price: 45,
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc38",
//       title: "Level 10",
//       mcqs: 15,
//       price: 50,
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc39",
//       title: "Level 11",
//       mcqs: 20,
//       price: 55,
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc3a",
//       title: "Level 12",
//       mcqs: 15,
//       price: 60,
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc3b",
//       title: "Level 13",
//       mcqs: 20,
//       price: 65,
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc3c",
//       title: "Level 14",
//       mcqs: 15,
//       price: 70,
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc3d",
//       title: "Level 15",
//       mcqs: 20,
//       price: 75,
//     ),
//   ];

//   List<LevelModel> get levels => _levels;
//   int get userCredits => _userCredits;

//   /// Unlock a level
//   bool unlockLevel(String id) {
//     final level = _levels.firstWhere((lvl) => lvl.id == id);
//     if (_userCredits >= level.price) {
//       _userCredits -= level.price;
//       level.isUnlocked = true;
//       notifyListeners();
//       return true;
//     }
//     return false;
//   }

// ignore_for_file: unused_field

//   /// Add credits
//   void addCredits(int amount) {
//     _userCredits += amount;
//     notifyListeners();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:mdcat/models/level_model.dart';
// // import '../models/level_model.dart';

// class LevelsViewModel extends ChangeNotifier {
//   int _userCredits = 50;
//   List<LevelModel> get levels => _levels;

//   final List<LevelModel> _levels = [
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc2f",
//       title: "Level 1",
//       mcqs: 20,
//       price: 5,
//       level: "Level 1",
//       subject: "Physics",
//       className: "11",
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc30",
//       title: "Level 2",
//       mcqs: 15,
//       price: 10,
//       level: "Level 2",
//       subject: "Physics",
//       className: "11",
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc31",
//       title: "Level 3",
//       mcqs: 20,
//       price: 15,
//       level: "Level 3",
//       subject: "Physics",
//       className: "11",
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc32",
//       title: "Level 4",
//       mcqs: 15,
//       price: 20,
//       level: "Level 4",
//       subject: "Physics",
//       className: "11",
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc33",
//       title: "Level 5",
//       mcqs: 20,
//       price: 25,
//       level: "Level 5",
//       subject: "Physics",
//       className: "11",
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc34",
//       title: "Level 6",
//       mcqs: 15,
//       price: 30,
//       level: "Level 6",
//       subject: "Physics",
//       className: "11",
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc35",
//       title: "Level 7",
//       mcqs: 20,
//       price: 35,
//       level: "Level 7",
//       subject: "Physics",
//       className: "11",
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc36",
//       title: "Level 8",
//       mcqs: 15,
//       price: 40,
//       level: "Level 8",
//       subject: "Physics",
//       className: "11",
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc37",
//       title: "Level 9",
//       mcqs: 20,
//       price: 45,
//       level: "Level 9",
//       subject: "Physics",
//       className: "11",
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc38",
//       title: "Level 10",
//       mcqs: 15,
//       price: 50,
//       level: "Level 10",
//       subject: "Physics",
//       className: "11",
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc39",
//       title: "Level 11",
//       mcqs: 20,
//       price: 55,
//       level: "Level 11",
//       subject: "Physics",
//       className: "11",
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc3a",
//       title: "Level 12",
//       mcqs: 15,
//       price: 60,
//       level: "Level 12",
//       subject: "Physics",
//       className: "11",
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc3b",
//       title: "Level 13",
//       mcqs: 20,
//       price: 65,
//       level: "Level 13",
//       subject: "Physics",
//       className: "11",
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc3c",
//       title: "Level 14",
//       mcqs: 15,
//       price: 70,
//       level: "Level 14",
//       subject: "Physics",
//       className: "11",
//     ),
//     LevelModel(
//       id: "68c3d4c958f454dbcafbdc3d",
//       title: "Level 15",
//       mcqs: 20,
//       price: 75,
//       level: "Level 15",
//       subject: "Physics",
//       className: "11",
//     ),
//   ];
// }
import 'package:flutter/material.dart';
import 'package:mdcat/models/level_model.dart';

class LevelsViewModel extends ChangeNotifier {
  LevelModel? _selectedLevel;
  int _userCredits = 50; // default credits (you can change this)
  int get userCredits => _userCredits;

  LevelModel? get selectedLevel => _selectedLevel;

  final List<LevelModel> _levels = [
    LevelModel(
      id: "68c3d4c958f454dbcafbdc2f",
      title: "Level 1",
      mcqs: 20,
      price: 5,
      level: "Level 1",
      // subject: "Physics",
      // className: "11",
    ),
    LevelModel(
      id: "68c3d4c958f454dbcafbdc30",
      title: "Level 2",
      mcqs: 15,
      price: 10,
      level: "Level 2",
      // subject: "Physics",
      // className: "11",
    ),
    LevelModel(
      id: "68c3d4c958f454dbcafbdc31",
      title: "Level 3",
      mcqs: 20,
      price: 15,
      level: "Level 3",
      // subject: "Physics",
      // className: "11",
    ),
    LevelModel(
      id: "68c3d4c958f454dbcafbdc32",
      title: "Level 4",
      mcqs: 15,
      price: 20,
      level: "Level 4",
      // subject: "Physics",
      // className: "11",
    ),
    LevelModel(
      id: "68c3d4c958f454dbcafbdc33",
      title: "Level 5",
      mcqs: 20,
      price: 25,
      level: "Level 5",
      // subject: "Physics",
      // className: "11",
    ),
    LevelModel(
      id: "68c3d4c958f454dbcafbdc34",
      title: "Level 6",
      mcqs: 15,
      price: 30,
      level: "Level 6",
      // subject: "Physics",
      // className: "11",
    ),
    LevelModel(
      id: "68c3d4c958f454dbcafbdc35",
      title: "Level 7",
      mcqs: 20,
      price: 35,
      level: "Level 7",
      // subject: "Physics",
      // className: "11",
    ),
    LevelModel(
      id: "68c3d4c958f454dbcafbdc36",
      title: "Level 8",
      mcqs: 15,
      price: 40,
      level: "Level 8",
      // subject: "Physics",
      // className: "11",
    ),
    LevelModel(
      id: "68c3d4c958f454dbcafbdc37",
      title: "Level 9",
      mcqs: 20,
      price: 45,
      level: "Level 9",
      // subject: "Physics",
      // className: "11",
    ),
    LevelModel(
      id: "68c3d4c958f454dbcafbdc38",
      title: "Level 10",
      mcqs: 15,
      price: 50,
      level: "Level 10",
      // subject: "Physics",
      // className: "11",
    ),
    LevelModel(
      id: "68c3d4c958f454dbcafbdc39",
      title: "Level 11",
      mcqs: 20,
      price: 55,
      level: "Level 11",
      // subject: "Physics",
      // className: "11",
    ),
    LevelModel(
      id: "68c3d4c958f454dbcafbdc3a",
      title: "Level 12",
      mcqs: 15,
      price: 60,
      level: "Level 12",
      // subject: "Physics",
      // className: "11",
    ),
    LevelModel(
      id: "68c3d4c958f454dbcafbdc3b",
      title: "Level 13",
      mcqs: 20,
      price: 65,
      level: "Level 13",
      // subject: "Physics",
      // className: "11",
    ),
    LevelModel(
      id: "68c3d4c958f454dbcafbdc3c",
      title: "Level 14",
      mcqs: 15,
      price: 70,
      level: "Level 14",
      // subject: "Physics",
      // className: "11",
    ),
    LevelModel(
      id: "68c3d4c958f454dbcafbdc3d",
      title: "Level 15",
      mcqs: 20,
      price: 75,
      level: "Level 15",
      // subject: "Physics",
      // className: "11",
    ),
  ];

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
}
