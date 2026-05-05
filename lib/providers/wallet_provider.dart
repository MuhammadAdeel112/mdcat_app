// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:mdcat/models/wallet_model.dart';
// // import 'package:mdcat/providers/auth_provider.dart';
// // import 'package:provider/provider.dart';

// // class WalletProvider with ChangeNotifier {
// //   WalletData? wallet;
// //   bool isLoading = false;
// //   String? errorMessage;

// //   Future<bool> fetchWallet(BuildContext context) async {
// //     try {
// //       isLoading = true;
// //       errorMessage = null;
// //       notifyListeners();

// //       // ✅ Get token from login provider
// //       final token = Provider.of<AuthProvider>(context, listen: false).token;

// //       final response = await http.get(
// //         Uri.parse("https://api.mdcatpro.com/api/student/history/used-credits"),
// //         headers: {
// //           "Authorization": "Bearer $token",
// //         },
// //       );

// //       if (response.statusCode == 200) {
// //         final data = jsonDecode(response.body);
// //         wallet = WalletData.fromJson(data);
// //         isLoading = false;
// //         notifyListeners();
// //         return true;
// //       } else {
// //         errorMessage = "Failed to load";
// //       }
// //     } catch (e) {
// //       errorMessage = "Error: $e";
// //     }

// //     isLoading = false;
// //     notifyListeners();
// //     return false;
// //   }
// // }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:mdcat/services/token_storage.dart';
// // import '../utils/token_storage.dart'; // make sure path is correct

// class WalletProvider extends ChangeNotifier {
//   int totalCreditsUsed = 0;
//   List<dynamic> tests = [];
//   bool loading = false;
//   String? errorMessage;

//   Future<bool> fetchWalletData() async {
//     loading = true;
//     notifyListeners();

//     try {
//       final token = await TokenStorage.getToken(); // ✅ Read token

//       if (token == null) {
//         errorMessage = "User not logged in";
//         loading = false;
//         notifyListeners();
//         return false;
//       }

//       final uri = Uri.parse(
//         "https://api.mdcatpro.com/api/student/history/used-credits",
//       );

//       final response = await http.get(
//         uri,
//         headers: {
//           "Authorization": "Bearer $token",
//           "Content-Type": "application/json",
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         totalCreditsUsed = data["totalCreditsUsed"] ?? 0;
//         tests = data["tests"] ?? [];

//         loading = false;
//         notifyListeners();
//         return true;
//       } else {
//         errorMessage = "Failed to load wallet data";
//         loading = false;
//         notifyListeners();
//         return false;
//       }
//     } catch (e) {
//       errorMessage = e.toString();
//       loading = false;
//       notifyListeners();
//       return false;
//     }
//   }
// }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:mdcat/models/wallet_model.dart';
// import 'package:mdcat/services/token_storage.dart';
// // import 'wallet_model.dart';

// class WalletProvider extends ChangeNotifier {
//   bool isLoading = false;
//   String? errorMessage;

//   int totalCreditsUsed = 0;
//   List<UsedCreditItem> usedTests = [];

//   Future<void> fetchWalletData() async {
//     isLoading = true;
//     errorMessage = null;
//     notifyListeners();

//     try {
//       final token = await TokenStorage.getToken();
//       if (token == null || token.isEmpty) {
//         errorMessage = "No token found. Please login again.";
//         isLoading = false;
//         notifyListeners();
//         return;
//       }

//       final url = Uri.parse(
//         "https://api.mdcatpro.com/api/student/history/used-credits",
//       );

//       final response = await http.get(
//         url,
//         headers: {"Content-Type": "application/json", "Authorization": token},
//       );

//       print("🔹 Wallet URL: $url");
//       print("🔹 Wallet Status: ${response.statusCode}");
//       print("🔹 Wallet Body: ${response.body}");

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         totalCreditsUsed = data["totalCreditsUsed"] ?? 0;

//         if (data["tests"] != null && data["tests"] is List) {
//           usedTests = (data["tests"] as List)
//               .map((item) => UsedCreditItem.fromJson(item))
//               .toList();
//         } else {
//           usedTests = [];
//         }
//       } else {
//         errorMessage = "Server Error: ${response.statusCode}";
//       }
//     } catch (e) {
//       errorMessage = "Something went wrong: $e";
//     }

//     isLoading = false;
//     notifyListeners();
//   }
// }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:mdcat/models/wallet_model.dart';
// import 'package:mdcat/services/token_storage.dart';

// class WalletProvider extends ChangeNotifier {
//   bool isLoading = false;
//   String? errorMessage;

//   int totalCreditsUsed = 0;
//   int availableCredits = 0;
//   int totalDeposits = 0; // ✅ deposit = total credits used
//   List<UsedCreditItem> usedTests = [];

//   Future<void> fetchWalletData() async {
//     isLoading = true;
//     errorMessage = null;
//     notifyListeners();

//     try {
//       final token = await TokenStorage.getToken();
//       if (token == null || token.isEmpty) {
//         errorMessage = "No token found. Please login again.";
//         isLoading = false;
//         notifyListeners();
//         return;
//       }

//       // ✅ 1: Profile API -> coins (balance)
//       final profileUrl = Uri.parse(
//         "https://api.mdcatpro.com/api/student/profile",
//       );
//       final profileRes = await http.get(
//         profileUrl,
//         headers: {"Content-Type": "application/json", "Authorization": token},
//       );

//       if (profileRes.statusCode == 200) {
//         final profileData = jsonDecode(profileRes.body);
//         availableCredits = profileData["coins"] ?? 0;
//       }

//       // ✅ 2: Used credits API
//       final url = Uri.parse(
//         "https://api.mdcatpro.com/api/student/history/used-credits",
//       );

//       final response = await http.get(
//         url,
//         headers: {"Content-Type": "application/json", "Authorization": token},
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         totalCreditsUsed = data["totalCreditsUsed"] ?? 0;

//         // ✅ Deposit is sum of used credits
//         totalDeposits = totalCreditsUsed;

//         if (data["tests"] != null && data["tests"] is List) {
//           usedTests = (data["tests"] as List)
//               .map((item) => UsedCreditItem.fromJson(item))
//               .toList();
//         } else {
//           usedTests = [];
//         }
//       } else {
//         errorMessage = "Server Error: ${response.statusCode}";
//       }
//     } catch (e) {
//       errorMessage = "Something went wrong: $e";
//     }

//     isLoading = false;
//     notifyListeners();
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mdcat/models/wallet_model.dart';
import 'package:mdcat/services/token_storage.dart';

class WalletProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  int totalCreditsUsed = 0;
  int availableCredits = 0;
  int totalDeposits = 0;
  List<UsedCreditItem> usedTests = [];

  Future<void> fetchWalletData() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final token = await TokenStorage.getToken();
      if (token == null || token.isEmpty) {
        errorMessage = "No token found. Please login again.";
        isLoading = false;
        notifyListeners();
        return;
      }

      // ✅ Profile API for balance
      final profileUrl = Uri.parse(
        "https://api.mdcatpro.com/api/student/updateProfile",
      );
      final profileRes = await http.get(
        profileUrl,
        headers: {
          // "Content-Type": "application/json", "Authorization": token
          "Authorization": token,
          "Content-Type": "multipart/form-data",
        },
      );

      print("📌 PROFILE Status: ${profileRes.statusCode}");
      print("📌 PROFILE Body: ${profileRes.body}");

      if (profileRes.statusCode == 200) {
        final profileData = jsonDecode(profileRes.body);
        availableCredits = profileData["coins"] ?? 0;
        print("✅ Available Credits Loaded: $availableCredits");
      }

      // ✅ Used credits API
      final url = Uri.parse(
        "https://api.mdcatpro.com/api/student/history/used-credits",
      );

      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "Authorization": token},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        totalCreditsUsed = data["totalCreditsUsed"] ?? 0;
        totalDeposits = totalCreditsUsed;

        if (data["tests"] != null && data["tests"] is List) {
          usedTests = (data["tests"] as List)
              .map((item) => UsedCreditItem.fromJson(item))
              .toList();
        } else {
          usedTests = [];
        }
      } else {
        errorMessage = "Server Error: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage = "Something went wrong: $e";
    }

    isLoading = false;
    notifyListeners();
  }
}
