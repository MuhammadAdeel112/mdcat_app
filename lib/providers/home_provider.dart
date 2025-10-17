import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  String _searchFilter = "All";
  String _searchQuery = "";
  int _notifCount = 3;

  // Getters
  String get searchFilter => _searchFilter;
  String get searchQuery => _searchQuery;
  int get notifCount => _notifCount;

  // 🔹 Update search filter (dropdown)
  void setSearchFilter(String value) {
    _searchFilter = value;
    notifyListeners();
  }

  // 🔹 Update search query (search bar text)
  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  // 🔹 Reset notifications (already present in your code)
  void resetNotifCount() {
    _notifCount = 0;
    notifyListeners();
  }
}
