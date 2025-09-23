// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // class AttemptProvider with ChangeNotifier {
// //   bool _isLoading = false;
// //   String? _attemptId;
// //   String? _errorMessage;

// //   bool get isLoading => _isLoading;
// //   String? get attemptId => _attemptId;
// //   String? get errorMessage => _errorMessage;
// //   Future<bool> startAttempt(String testId) async {
// //     _isLoading = true;
// //     notifyListeners();

// //     final url = Uri.parse("http://47.130.103.135/api/student/attempt/start");

// //     try {
// //       final response = await http.post(
// //         url,
// //         headers: {
// //           "Authorization": "<YOUR_TOKEN>",
// //           "Content-Type": "application/json",
// //         },
// //         body: jsonEncode({"testId": testId}), // ✅ body
// //       );

// //       _isLoading = false;

// //       if (response.statusCode == 200) {
// //         final data = jsonDecode(response.body);
// //         _attemptId = data["attemptId"]; // ✅ get attemptId
// //         // optionally, you can also store remainingCoins
// //         // int remainingCoins = data["remainingCoins"];
// //         _errorMessage = null;
// //         notifyListeners();
// //         return true;
// //       } else {
// //         _errorMessage = "Failed: ${response.body}";
// //         notifyListeners();
// //         return false;
// //       }
// //     } catch (e) {
// //       _isLoading = false;
// //       _errorMessage = e.toString();
// //       notifyListeners();
// //       return false;
// //     }
// //   }

// //   // Future<bool> startAttempt(String testId) async {
// //   //   _isLoading = true;
// //   //   notifyListeners();

// //   //   final url = Uri.parse("http://47.130.103.135/api/student/attempt/start");

// //   //   try {
// //   //     final response = await http.post(
// //   //       url,
// //   //       headers: {
// //   //         "Authorization":
// //   //             "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4OWMzMjczYTI4M2Q4OTVhYmE5OGY4YyIsInJvbGUiOiJzdHVkZW50IiwiaWF0IjoxNzU3NDg0MDc0LCJleHAiOjE3NTgwODg4NzR9.Ea_avM_jQTM8zBB4r4MGW7_uW0pdnxxr1_-uztJ77Yo",
// //   //         "Content-Type": "application/json",
// //   //       },
// //   //       body: jsonEncode({"testId": testId}),
// //   //     );

// //   //     _isLoading = false;

// //   //     if (response.statusCode == 200) {
// //   //       final data = jsonDecode(response.body);

// //   //       // API usually returns attemptId or some attempt object
// //   //       _attemptId = data["_id"]; // adjust based on actual response
// //   //       _errorMessage = null;
// //   //       notifyListeners();

// //   //       return true;
// //   //     } else {
// //   //       _errorMessage = "Failed: ${response.body}";
// //   //       notifyListeners();
// //   //       return false;
// //   //     }
// //   //   } catch (e) {
// //   //     _isLoading = false;
// //   //     _errorMessage = e.toString();
// //   //     notifyListeners();
// //   //     return false;
// //   //   }
// //   // }
// // }
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // class AttemptProvider with ChangeNotifier {
// //   bool _isLoading = false;
// //   String? _attemptId;
// //   String? _errorMessage;

// //   bool get isLoading => _isLoading;
// //   String? get attemptId => _attemptId;
// //   String? get errorMessage => _errorMessage;

// //   Future<bool> startAttempt(String testId) async {
// //     _isLoading = true;
// //     notifyListeners();

// //     final url = Uri.parse("http://47.130.103.135/api/student/attempt/start");

// //     // 🔑 put your token here (later you can fetch it from secure storage/shared prefs)
// //     const String token =
// //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4OWMzMjczYTI4M2Q4OTVhYmE5OGY4YyIsInJvbGUiOiJzdHVkZW50IiwiaWF0IjoxNzU3NDg0MDc0LCJleHAiOjE3NTgwODg4NzR9.Ea_avM_jQTM8zBB4r4MGW7_uW0pdnxxr1_-uztJ77Yo";

// //     try {
// //       final response = await http.post(
// //         url,
// //         headers: {
// //           "Authorization": "Bearer $token", // ✅ FIXED: Added Bearer
// //           "Content-Type": "application/json",
// //         },
// //         body: jsonEncode({"testId": testId}), // ✅ body
// //       );

// //       _isLoading = false;

// //       if (response.statusCode == 200) {
// //         final data = jsonDecode(response.body);

// //         // ✅ Adjust this based on your API response shape
// //         _attemptId = data["attemptId"] ?? data["_id"];
// //         _errorMessage = null;
// //         notifyListeners();
// //         return true;
// //       } else {
// //         _errorMessage = "Failed: ${response.body}";
// //         notifyListeners();
// //         return false;
// //       }
// //     } catch (e) {
// //       _isLoading = false;
// //       _errorMessage = e.toString();
// //       notifyListeners();
// //       return false;
// //     }
// //   }
// // }
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:shared_preferences/shared_preferences.dart';

// // class AttemptProvider with ChangeNotifier {
// //   bool _isLoading = false;
// //   String? _attemptId;
// //   String? _errorMessage;

// //   bool get isLoading => _isLoading;
// //   String? get attemptId => _attemptId;
// //   String? get errorMessage => _errorMessage;

// //   Future<bool> startAttempt(String testId) async {
// //     _isLoading = true;
// //     notifyListeners();

// //     final url = Uri.parse("http://47.130.103.135/api/student/attempt/start");

// //     try {
// //       // 🔑 1. Get token from SharedPreferences
// //       final prefs = await SharedPreferences.getInstance();
// //       final token = prefs.getString("authToken"); // store it after login

// //       if (token == null) {
// //         _isLoading = false;
// //         _errorMessage = "No token found. Please log in again.";
// //         notifyListeners();
// //         return false;
// //       }

// //       // 🔑 2. Send API request with Bearer token
// //       final response = await http.post(
// //         url,
// //         headers: {
// //           "Authorization": "Bearer $token", // ✅ dynamic token
// //           "Content-Type": "application/json",
// //         },
// //         body: jsonEncode({"testId": testId}),
// //       );

// //       _isLoading = false;

// //       if (response.statusCode == 200) {
// //         final data = jsonDecode(response.body);

// //         _attemptId = data["attemptId"] ?? data["_id"];
// //         _errorMessage = null;
// //         notifyListeners();
// //         return true;
// //       } else {
// //         _errorMessage = "Failed: ${response.body}";
// //         notifyListeners();
// //         return false;
// //       }
// //     } catch (e) {
// //       _isLoading = false;
// //       _errorMessage = e.toString();
// //       notifyListeners();
// //       return false;
// //     }
// //   }
// // }
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:mdcat/services/token_storage.dart'; // 👈 import

// // class AttemptProvider with ChangeNotifier {
// //   bool _isLoading = false;
// //   String? _attemptId;
// //   String? _errorMessage;

// //   bool get isLoading => _isLoading;
// //   String? get attemptId => _attemptId;
// //   String? get errorMessage => _errorMessage;

// //   Future<bool> startAttempt(String testId) async {
// //     _isLoading = true;
// //     notifyListeners();

// //     final url = Uri.parse("http://47.130.103.135/api/student/attempt/start");

// //     try {
// //       // ✅ Fetch token from SharedPreferences
// //       final token = await TokenStorage.getToken();

// //       if (token == null || token.isEmpty) {
// //         _errorMessage = "No token found. Please login again.";
// //         _isLoading = false;
// //         notifyListeners();
// //         return false;
// //       }

// //       final response = await http.post(
// //         url,
// //         headers: {
// //           "Authorization": "Bearer $token", // 👈 use Bearer format
// //           "Content-Type": "application/json",
// //         },
// //         body: jsonEncode({"testId": testId}),
// //       );

// //       _isLoading = false;

// //       if (response.statusCode == 200) {
// //         final data = jsonDecode(response.body);
// //         _attemptId = data["attemptId"];
// //         _errorMessage = null;
// //         notifyListeners();
// //         return true;
// //       } else {
// //         _errorMessage = "Failed: ${response.body}";
// //         notifyListeners();
// //         return false;
// //       }
// //     } catch (e) {
// //       _isLoading = false;
// //       _errorMessage = e.toString();
// //       notifyListeners();
// //       return false;
// //     }
// //   }
// // }
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:mdcat/services/token_storage.dart'; // 👈 import

// // class AttemptProvider with ChangeNotifier {
// //   bool _isLoading = false;
// //   String? _attemptId;
// //   String? _errorMessage;

// //   bool get isLoading => _isLoading;
// //   String? get attemptId => _attemptId;
// //   String? get errorMessage => _errorMessage;

// //   Future<bool> startAttempt(String testId) async {
// //     _isLoading = true;
// //     notifyListeners();

// //     final url = Uri.parse("http://47.130.103.135/api/student/attempt/start");

// //     try {
// //       // ✅ Fetch token from SharedPreferences
// //       final token = await TokenStorage.getToken();

// //       if (token == null || token.isEmpty) {
// //         _errorMessage = "No token found. Please login again.";
// //         _isLoading = false;
// //         notifyListeners();
// //         return false;
// //       }

// //       final response = await http.post(
// //         url,
// //         headers: {
// //           "Authorization": "Bearer $token", // 👈 use Bearer format
// //           "Content-Type": "application/json",
// //         },
// //         body: jsonEncode({"testId": testId}),
// //       );

// //       _isLoading = false;

// //       if (response.statusCode == 200) {
// //         final data = jsonDecode(response.body);
// //         _attemptId = data["attemptId"];
// //         _errorMessage = null;
// //         notifyListeners();
// //         return true;
// //       } else {
// //         _errorMessage = "Failed: ${response.body}";
// //         notifyListeners();
// //         return false;
// //       }
// //     } catch (e) {
// //       _isLoading = false;
// //       _errorMessage = e.toString();
// //       notifyListeners();
// //       return false;
// //     }
// //   }
// // }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:mdcat/services/token_storage.dart';

// class AttemptProvider with ChangeNotifier {
//   bool _isLoading = false;
//   String? _attemptId;
//   String? _errorMessage;

//   bool get isLoading => _isLoading;
//   String? get attemptId => _attemptId;
//   String? get errorMessage => _errorMessage;

//   Future<bool> startAttempt(String testId) async {
//     _isLoading = true;
//     notifyListeners();

//     final url = Uri.parse("http://47.130.103.135/api/student/attempt/start");

//     // Fetch token from SharedPreferences (raw token)
//     final token = await TokenStorage.getToken();

//     if (token == null || token.isEmpty) {
//       _errorMessage = "No token found. Please login again.";
//       _isLoading = false;
//       notifyListeners();
//       return false;
//     }

//     // Send token with "Bearer " prefix in header
//     final response = await http.post(
//       url,
//       headers: {"Authorization": token, "Content-Type": "application/json"},
//       body: jsonEncode({"testId": testId}),
//     );

//     if (response.statusCode == 201) {
//       final data = jsonDecode(response.body);
//       _attemptId = data["attemptId"];
//       _errorMessage = null;
//       notifyListeners();
//       return true;
//     } else {
//       _errorMessage = "Failed: ${response.body}";
//       notifyListeners();
//       return false;
//     }

//     //   final response = await http.post(
//     //     url,
//     //     headers: {
//     //       "Authorization": token, // prepend here
//     //       "Content-Type": "application/json",
//     //     },
//     //     body: jsonEncode({"testId": testId}),
//     //   );

//     //   _isLoading = false;

//     //   if (response.statusCode == 200) {
//     //     final data = jsonDecode(response.body);
//     //     _attemptId = data["attemptId"];
//     //     _errorMessage = null;
//     //     notifyListeners();
//     //     return true;
//     //   } else {
//     //     _errorMessage = "Failed: ${response.body}";
//     //     notifyListeners();
//     //     return false;
//     //   }
//     // } catch (e) {
//     //   _isLoading = false;
//     //   _errorMessage = e.toString();
//     //   notifyListeners();
//     //   return false;
//     // }
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mdcat/services/token_storage.dart';

class AttemptProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  String? attemptId;
  int? remainingCoins;

  /// 🔹 Attempt Test API
  Future<bool> attemptTest(String testId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final url = Uri.parse("http://47.130.103.135/api/student/attempt/start");

      final token = await TokenStorage.getToken();
      if (token == null || token.isEmpty) {
        errorMessage = "No token found. Please login again.";
        isLoading = false;
        notifyListeners();
        return false;
      }

      final body = {"testId": testId};

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": token, // ✅ token from storage
        },
        body: jsonEncode(body),
      );

      print("🔹 AttemptTest url: ${url}");
      print("🔹 AttemptTest requestbody: ${jsonEncode(body)}");
      print("🔹 AttemptTest Status: ${response.statusCode}");
      print("🔹 AttemptTest Body: ${response.body}");

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);

        attemptId = data["attemptId"];
        remainingCoins = data["remainingCoins"];

        isLoading = false;
        notifyListeners();
        return true;
      } else {
        errorMessage = "Server error: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage = "Failed to attempt test: $e";
    }

    isLoading = false;
    notifyListeners();
    return false;
  }
}
