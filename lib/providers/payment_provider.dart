// ignore_for_file: unused_field

import 'dart:io';
// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:mdcat/services/token_storage.dart';

class PaymentProvider extends ChangeNotifier {
  final TextEditingController transactionIdController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  File? selectedFile;
  String? selectedFileName;
  bool isLoading = false;
  String? errorMessage;

  final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.mdcatpro.com/api"));

  /// Pick file
  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
      );

      if (result != null && result.files.single.path != null) {
        selectedFile = File(result.files.single.path!);
        selectedFileName = result.files.single.name;
        print("🔹 File picked: $selectedFileName");
        notifyListeners();
      }
    } catch (e) {
      debugPrint("❌ File picking error: $e");
    }
  }

  /// Submit payment
  Future<bool> submitPayment() async {
    if (amountController.text.isEmpty || selectedFile == null) {
      errorMessage = "Amount and proof image are required";
      notifyListeners();
      return false;
    }

    try {
      isLoading = true;
      notifyListeners();

      String fileName = selectedFile!.path.split('/').last;

      FormData formData = FormData.fromMap({
        "amount": int.parse(amountController.text), // make sure it's int
        "proofImage": await MultipartFile.fromFile(
          selectedFile!.path,
          filename: fileName,
        ),
      });

      // Get token from storage
      final token = await TokenStorage.getToken();
      if (token == null) {
        errorMessage = "No token found. Please login again.";
        return false;
      }

      Response response = await Dio(
        BaseOptions(
          baseUrl: "https://api.mdcatpro.com/api",
          headers: {
            "Authorization": token,
            "Content-Type": "multipart/form-data",
          },
        ),
      ).post("/student/purchase-request", data: formData);

      print("🔹 SubmitPayment Status: ${response.statusCode}");
      print("🔹 SubmitPayment Body: ${response.data}");

      if (response.statusCode == 200) {
        // Reset after success
        transactionIdController.clear();
        amountController.clear();
        selectedFile = null;
        selectedFileName = null;

        return true;
      } else {
        errorMessage = response.data["message"] ?? "Something went wrong";
        return false;
      }
    } on DioException catch (e) {
      errorMessage = e.response?.data["message"] ?? "Something went wrong";
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Future<bool> submitPayment() async {
  //   if (amountController.text.isEmpty || selectedFile == null) {
  //     errorMessage = "Amount and proof image are required";
  //     notifyListeners();
  //     return false;
  //   }

  //   isLoading = true;
  //   errorMessage = null;
  //   notifyListeners();

  //   try {
  //     final token = await TokenStorage.getToken();
  //     if (token == null || token.isEmpty) {
  //       errorMessage = "No token found. Please login again.";
  //       isLoading = false;
  //       notifyListeners();
  //       return false;
  //     }

  //     String fileName = selectedFile!.path.split('/').last;
  //     int fileSize = await selectedFile!.length();
  //     print("🔹 File name: $fileName, size: $fileSize bytes");
  //     print("🔹 Amount: ${amountController.text}");

  //     FormData formData = FormData.fromMap({
  //       "amount": amountController.text,
  //       "proofImage": await MultipartFile.fromFile(
  //         selectedFile!.path,
  //         filename: fileName,
  //       ),
  //     });

  //     print("🔹 Sending request to /student/purchase-request");

  //     Response response = await _dio.post(
  //       "/student/purchase-request",
  //       data: formData,
  //       options: Options(
  //         headers: {
  //           "Authorization": token,
  //           "Content-Type": "multipart/form-data",
  //         },
  //       ),
  //     );

  //     print("🔹 Response status: ${response.statusCode}");
  //     print("🔹 Response data: ${response.data}");

  //     dynamic data = response.data;
  //     if (data is String) data = jsonDecode(data);

  //     if (response.statusCode == 200) {
  //       print("✅ Success: ${data['message']}");
  //       // Reset form
  //       transactionIdController.clear();
  //       amountController.clear();
  //       selectedFile = null;
  //       selectedFileName = null;
  //       notifyListeners();
  //       return true;
  //     } else {
  //       errorMessage = data?['message'] ?? "Something went wrong";
  //       print("❌ Error: $errorMessage");
  //     }
  //   } catch (e) {
  //     errorMessage = "Failed to submit payment: $e";
  //     print("❌ Exception: $errorMessage");
  //   } finally {
  //     isLoading = false;
  //     notifyListeners();
  //   }

  // return false;

  @override
  void dispose() {
    transactionIdController.dispose();
    amountController.dispose();
    super.dispose();
  }
}

// import 'dart:io';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:dio/dio.dart';
// import 'package:mdcat/services/token_storage.dart';

// class PaymentProvider extends ChangeNotifier {
//   final TextEditingController transactionIdController = TextEditingController();
//   final TextEditingController amountController = TextEditingController();

//   File? selectedFile;
//   String? selectedFileName;
//   bool isLoading = false;
//   String? errorMessage;

//   final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.mdcatpro.com/api"));

//   /// Pick file
//   Future<void> pickFile() async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
//       );

//       if (result != null && result.files.single.path != null) {
//         selectedFile = File(result.files.single.path!);
//         selectedFileName = result.files.single.name;
//         print("🔹 File picked: $selectedFileName");
//         notifyListeners();
//       }
//     } catch (e) {
//       debugPrint("❌ File picking error: $e");
//     }
//   }

//   /// Submit payment
//   Future<void> submitPayment(BuildContext context) async {
//     if (amountController.text.isEmpty || selectedFile == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Amount and proof image are required")),
//       );
//       return;
//     }

//     try {
//       isLoading = true;
//       errorMessage = null;
//       notifyListeners();

//       // ✅ Get token from TokenStorage
//       final token = await TokenStorage.getToken();
//       if (token == null || token.isEmpty) {
//         errorMessage = "No token found. Please login again.";
//         print("❌ SubmitPayment: No token available");
//         isLoading = false;
//         notifyListeners();
//         return;
//       }

//       String fileName = selectedFile!.path.split('/').last;
//       int fileSize = await selectedFile!.length();
//       print("🔹 File name: $fileName, size: $fileSize bytes");
//       print("🔹 Amount: ${amountController.text}");

//       FormData formData = FormData.fromMap({
//         "amount": amountController.text,
//         "proofImage": await MultipartFile.fromFile(
//           selectedFile!.path,
//           filename: fileName,
//         ),
//       });

//       print("🔹 Sending request to /student/purchase-request");

//       Response response = await _dio.post(
//         "/student/purchase-request",
//         data: formData,
//         options: Options(
//           headers: {
//             "Authorization": token,
//             "Content-Type": "multipart/form-data",
//           },
//         ),
//       );

//       print("🔹 Response status: ${response.statusCode}");
//       print("🔹 Response data: ${response.data}");

//       // Safe parsing
//       dynamic data = response.data;
//       if (data is String) data = jsonDecode(data);

//       if (response.statusCode == 200) {
//         final message = data["message"] ?? "Purchase request submitted";
//         print("✅ Success: $message");
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text(message)));

//         // Reset form
//         transactionIdController.clear();
//         amountController.clear();
//         selectedFile = null;
//         selectedFileName = null;
//         notifyListeners();
//       } else {
//         errorMessage = data?["message"] ?? "Something went wrong";
//         print("❌ Error: $errorMessage");
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text(errorMessage!)));
//       }
//     } catch (e) {
//       errorMessage = "Failed to submit payment: $e";
//       print("❌ Exception: $errorMessage");
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text(errorMessage!)));
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   @override
//   void dispose() {
//     transactionIdController.dispose();
//     amountController.dispose();
//     super.dispose();
//   }
// }

// // import 'dart:io';
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:file_picker/file_picker.dart';
// // import 'package:dio/dio.dart';
// // // import 'package:mdcat/services/token_storage.dart';

// // class PaymentProvider extends ChangeNotifier {
// //   final TextEditingController transactionIdController = TextEditingController();
// //   final TextEditingController amountController = TextEditingController();

// //   File? selectedFile;
// //   String? selectedFileName;
// //   bool isLoading = false;
// //   String? errorMessage;

// //   final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.mdcatpro.com/api"));

// //   /// Pick file directly with FilePicker
// //   Future<void> pickFile() async {
// //     try {
// //       FilePickerResult? result = await FilePicker.platform.pickFiles(
// //         type: FileType.custom,
// //         allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
// //       );

// //       if (result != null && result.files.single.path != null) {
// //         selectedFile = File(result.files.single.path!);
// //         selectedFileName = result.files.single.name;
// //         print("🔹 File picked: $selectedFileName");
// //         notifyListeners();
// //       }
// //     } catch (e) {
// //       debugPrint("❌ File picking error: $e");
// //     }
// //   }

// //   /// Submit payment
// //   Future<void> submitPayment(BuildContext context) async {
// //     if (amountController.text.isEmpty || selectedFile == null) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text("Amount and proof image are required")),
// //       );
// //       return;
// //     }

// //     try {
// //       isLoading = true;
// //       errorMessage = null;
// //       notifyListeners();

// //       // Replace with your token logic if needed
// //       final token = "<YOUR_TOKEN_HERE>";
// //       print("🔹 SubmitPayment called with token: $token");

// //       String fileName = selectedFile!.path.split('/').last;
// //       print(
// //         "🔹 File name: $fileName, size: ${await selectedFile!.length()} bytes",
// //       );

// //       FormData formData = FormData.fromMap({
// //         "amount": amountController.text,
// //         "proofImage": await MultipartFile.fromFile(
// //           selectedFile!.path,
// //           filename: fileName,
// //         ),
// //       });

// //       print("🔹 Sending request to /student/purchase-request");

// //       Response response = await _dio.post(
// //         "/student/purchase-request",
// //         data: formData,
// //         options: Options(headers: {"Authorization": token}),
// //       );

// //       print("🔹 Response status: ${response.statusCode}");
// //       print("🔹 Response data: ${response.data}");

// //       dynamic data = response.data;
// //       if (data is String) data = jsonDecode(data);

// //       if (response.statusCode == 200) {
// //         final message = data["message"] ?? "Purchase request submitted";
// //         print("✅ Success: $message");
// //         ScaffoldMessenger.of(
// //           context,
// //         ).showSnackBar(SnackBar(content: Text(message)));

// //         // Reset form
// //         transactionIdController.clear();
// //         amountController.clear();
// //         selectedFile = null;
// //         selectedFileName = null;
// //         notifyListeners();
// //       } else {
// //         errorMessage = data?["message"] ?? "Something went wrong";
// //         print("❌ Error: $errorMessage");
// //         ScaffoldMessenger.of(
// //           context,
// //         ).showSnackBar(SnackBar(content: Text(errorMessage!)));
// //       }
// //     } catch (e) {
// //       errorMessage = "Failed to submit payment: $e";
// //       print("❌ Exception: $e");
// //       ScaffoldMessenger.of(
// //         context,
// //       ).showSnackBar(SnackBar(content: Text(errorMessage!)));
// //     } finally {
// //       isLoading = false;
// //       notifyListeners();
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     transactionIdController.dispose();
// //     amountController.dispose();
// //     super.dispose();
// //   }
// // }

// // // // import 'dart:convert';
// // // import 'dart:io';
// // // import 'package:flutter/material.dart';
// // // import 'package:file_picker/file_picker.dart';
// // // import 'package:dio/dio.dart';
// // // // import 'package:mdcat/services/token_storage.dart';

// // // class PaymentProvider extends ChangeNotifier {
// // //   final TextEditingController transactionIdController = TextEditingController();
// // //   final TextEditingController amountController = TextEditingController();

// // //   File? selectedFile;
// // //   String? selectedFileName;
// // //   bool isLoading = false;

// // //   final Dio _dio = Dio(
// // //     BaseOptions(
// // //       baseUrl: "https://api.mdcatpro.com/api",
// // //       headers: {
// // //         "Authorization":
// // //             "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4OWMzMjczYTI4M2Q4OTVhYmE5OGY4YyIsInJvbGUiOiJzdHVkZW50IiwiaWF0IjoxNzU3Mzk4OTg5LCJleHAiOjE3NTgwMDM3ODl9.1SN7xkBIycufTlB5iD2KKA_ZlKQUC4kYpOq-At2zR4k",
// // //       },
// // //     ),
// // //   );

// // //   /// Pick file directly with FilePicker (no arguments needed)
// // //   Future<void> pickFile() async {
// // //     try {
// // //       FilePickerResult? result = await FilePicker.platform.pickFiles(
// // //         type: FileType.custom,
// // //         allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
// // //       );

// // //       if (result != null && result.files.single.path != null) {
// // //         selectedFile = File(result.files.single.path!);
// // //         selectedFileName = result.files.single.name;
// // //         notifyListeners();
// // //       }
// // //     } catch (e) {
// // //       debugPrint("File picking error: $e");
// // //     }
// // //   }

// // //   /// Submit payment details
// // //   Future<void> submitPayment(BuildContext context) async {
// // //     if (amountController.text.isEmpty || selectedFile == null) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(content: Text("Amount and proof image are required")),
// // //       );
// // //       return;
// // //     }

// // //     try {
// // //       isLoading = true;
// // //       notifyListeners();

// // //       String fileName = selectedFile!.path.split('/').last;

// // //       FormData formData = FormData.fromMap({
// // //         "amount": amountController.text,
// // //         "proofImage": await MultipartFile.fromFile(
// // //           selectedFile!.path,
// // //           filename: fileName,
// // //         ),
// // //       });

// // //       Response response = await _dio.post(
// // //         "/student/purchase-request",
// // //         data: formData,
// // //       );

// // //       if (response.statusCode == 200) {
// // //         ScaffoldMessenger.of(
// // //           context,
// // //         ).showSnackBar(SnackBar(content: Text(response.data["message"])));

// // //         // Reset form after success
// // //         transactionIdController.clear();
// // //         amountController.clear();
// // //         selectedFile = null;
// // //         selectedFileName = null;
// // //       }
// // //     } on DioException catch (e) {
// // //       String errorMessage = "Something went wrong";
// // //       if (e.response != null && e.response?.data != null) {
// // //         errorMessage = e.response?.data["message"] ?? errorMessage;
// // //       }

// // //       ScaffoldMessenger.of(
// // //         context,
// // //       ).showSnackBar(SnackBar(content: Text(errorMessage)));
// // //     } finally {
// // //       isLoading = false;
// // //       notifyListeners();
// // //     }
// // //   }

// // //   @override
// // //   void dispose() {
// // //     transactionIdController.dispose();
// // //     amountController.dispose();
// // //     super.dispose();
// // //   }
// // // }
// // // class PaymentProvider extends ChangeNotifier {
// // //   final TextEditingController amountController = TextEditingController();

// // //   File? selectedFile;
// // //   String? selectedFileName;
// // //   bool isLoading = false;

// // //   final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.mdcatpro.com/api"));

// // //   /// Pick file
// // //   Future<void> pickFile() async {
// // //     try {
// // //       FilePickerResult? result = await FilePicker.platform.pickFiles(
// // //         type: FileType.custom,
// // //         allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
// // //       );

// // //       if (result != null && result.files.single.path != null) {
// // //         selectedFile = File(result.files.single.path!);
// // //         selectedFileName = result.files.single.name;
// // //         print("🔹 File picked: $selectedFileName");
// // //         notifyListeners();
// // //       }
// // //     } catch (e) {
// // //       print("❌ File picking error: $e");
// // //     }
// // //   }

// // //   /// Submit payment
// // //   Future<void> submitPayment(BuildContext context) async {
// // //     print("🔹 SubmitPayment called");

// // //     final token = await TokenStorage.getToken();
// // //     if (token == null || token.isEmpty) {
// // //       print("⚠️ No token found");
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(content: Text("No token found. Please login again.")),
// // //       );
// // //       return;
// // //     }

// // //     if (amountController.text.isEmpty || selectedFile == null) {
// // //       print("⚠️ Validation failed: Amount or file missing");
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(content: Text("Amount and proof image are required")),
// // //       );
// // //       return;
// // //     }

// // //     final amount = int.tryParse(amountController.text);
// // //     if (amount == null) {
// // //       print("⚠️ Validation failed: Amount is not a number");
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(content: Text("Please enter a valid numeric amount")),
// // //       );
// // //       return;
// // //     }

// // //     final fileSize = await selectedFile!.length();
// // //     print("🔹 File size: $fileSize bytes");
// // //     if (fileSize > 10 * 1024 * 1024) {
// // //       print("⚠️ File exceeds 10MB");
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(content: Text("File size must be less than 10MB")),
// // //       );
// // //       return;
// // //     }

// // //     final allowedExtensions = ['jpg', 'jpeg', 'png', 'pdf'];
// // //     final fileExt = selectedFileName?.split('.').last.toLowerCase();
// // //     print("🔹 File extension: $fileExt");
// // //     if (fileExt == null || !allowedExtensions.contains(fileExt)) {
// // //       print("⚠️ Invalid file type");
// // //       ScaffoldMessenger.of(
// // //         context,
// // //       ).showSnackBar(const SnackBar(content: Text("Invalid file type")));
// // //       return;
// // //     }

// // //     try {
// // //       isLoading = true;
// // //       notifyListeners();
// // //       print("🔹 Sending request...");

// // //       String fileName = selectedFile!.path.split('/').last;
// // //       FormData formData = FormData.fromMap({
// // //         "amount": amount,
// // //         "proofImage": await MultipartFile.fromFile(
// // //           selectedFile!.path,
// // //           filename: fileName,
// // //         ),
// // //       });
// // //       Response response = await _dio.post(
// // //         "/student/purchase-request",
// // //         data: formData,
// // //         options: Options(headers: {"Authorization": token}),
// // //       );

// // //       print("🔹 Response status: ${response.statusCode}");
// // //       print("🔹 Response data: ${response.data}");

// // //       // Parse response correctly
// // //       dynamic data = response.data;
// // //       if (data is String) data = jsonDecode(data);

// // //       if (response.statusCode == 200) {
// // //         final message = data["message"] ?? "Payment submitted";
// // //         print("✅ Success: $message");
// // //         ScaffoldMessenger.of(
// // //           context,
// // //         ).showSnackBar(SnackBar(content: Text(message)));

// // //         // Reset
// // //         amountController.clear();
// // //         selectedFile = null;
// // //         selectedFileName = null;
// // //         notifyListeners();
// // //       } else {
// // //         final msg = data?["message"] ?? "Something went wrong";
// // //         print("⚠️ Non-200 response: $msg");
// // //         ScaffoldMessenger.of(
// // //           context,
// // //         ).showSnackBar(SnackBar(content: Text(msg)));
// // //       }

// // //       // Response response = await _dio.post(
// // //       //   "/student/purchase-request",
// // //       //   data: formData,
// // //       //   options: Options(headers: {"Authorization": token}),
// // //       // );

// // //       // print("🔹 Response status: ${response.statusCode}");
// // //       // print("🔹 Response data: ${response.data}");

// // //       // if (response.statusCode == 200) {
// // //       //   final message = response.data["message"] ?? "Payment submitted";
// // //       //   print("✅ Success: $message");
// // //       //   ScaffoldMessenger.of(
// // //       //     context,
// // //       //   ).showSnackBar(SnackBar(content: Text(message)));

// // //       //   // Reset
// // //       //   amountController.clear();
// // //       //   selectedFile = null;
// // //       //   selectedFileName = null;
// // //       //   notifyListeners();
// // //       // } else {
// // //       //   final msg = response.data?["message"] ?? "Something went wrong";
// // //       //   print("⚠️ Non-200 response: $msg");
// // //       //   ScaffoldMessenger.of(
// // //       //     context,
// // //       //   ).showSnackBar(SnackBar(content: Text(msg)));
// // //       // }
// // //     } on DioException catch (e) {
// // //       String errorMessage = "Something went wrong";
// // //       if (e.response != null && e.response?.data != null) {
// // //         errorMessage = e.response?.data["message"] ?? errorMessage;
// // //       }
// // //       print("❌ DioException: $errorMessage");
// // //       ScaffoldMessenger.of(
// // //         context,
// // //       ).showSnackBar(SnackBar(content: Text(errorMessage)));
// // //     } finally {
// // //       isLoading = false;
// // //       notifyListeners();
// // //       print("🔹 SubmitPayment finished");
// // //     }
// // //   }

// // //   @override
// // //   void dispose() {
// // //     amountController.dispose();
// // //     super.dispose();
// // //   }
// // // }
