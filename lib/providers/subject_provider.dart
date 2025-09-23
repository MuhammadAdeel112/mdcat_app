import 'package:flutter/foundation.dart';

class SubjectProvider extends ChangeNotifier {
  String? _selectedSubject;

  String? get selectedSubject => _selectedSubject;

  void selectSubject(String subject) {
    _selectedSubject = subject;
    notifyListeners();
  }

  void clearSubject() {
    _selectedSubject = null;
    notifyListeners();
  }
}
