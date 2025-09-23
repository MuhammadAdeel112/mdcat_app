import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  String _searchFilter = "All";
  int _notifCount = 3;

  String get searchFilter => _searchFilter;
  int get notifCount => _notifCount;

  void setSearchFilter(String value) {
    _searchFilter = value;
    notifyListeners();
  }

  void resetNotifCount() {
    _notifCount = 0;
    notifyListeners();
  }

  void setNotifCount(int value) {
    _notifCount = value;
    notifyListeners();
  }
}
