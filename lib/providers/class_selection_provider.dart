import 'package:flutter/foundation.dart';

class ClassSelectionProvider with ChangeNotifier {
  String? _selectedClass;

  String? get selectedClass => _selectedClass;

  void selectClass(String? value) {
    _selectedClass = value;
    notifyListeners();
  }

  void clearSelection() {
    _selectedClass = null;
    notifyListeners();
  }
}
