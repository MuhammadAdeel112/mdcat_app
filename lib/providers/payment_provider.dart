import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';

class PaymentProvider extends ChangeNotifier {
  final TextEditingController transactionIdController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  File? selectedFile;
  String? selectedFileName;
  bool isLoading = false;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://47.130.103.135/api",
      headers: {
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4OWMzMjczYTI4M2Q4OTVhYmE5OGY4YyIsInJvbGUiOiJzdHVkZW50IiwiaWF0IjoxNzU3Mzk4OTg5LCJleHAiOjE3NTgwMDM3ODl9.1SN7xkBIycufTlB5iD2KKA_ZlKQUC4kYpOq-At2zR4k",
      },
    ),
  );

  /// Pick file directly with FilePicker (no arguments needed)
  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
      );

      if (result != null && result.files.single.path != null) {
        selectedFile = File(result.files.single.path!);
        selectedFileName = result.files.single.name;
        notifyListeners();
      }
    } catch (e) {
      debugPrint("File picking error: $e");
    }
  }

  /// Submit payment details
  Future<void> submitPayment(BuildContext context) async {
    if (amountController.text.isEmpty || selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Amount and proof image are required")),
      );
      return;
    }

    try {
      isLoading = true;
      notifyListeners();

      String fileName = selectedFile!.path.split('/').last;

      FormData formData = FormData.fromMap({
        "amount": amountController.text,
        "proofImage": await MultipartFile.fromFile(
          selectedFile!.path,
          filename: fileName,
        ),
      });

      Response response = await _dio.post(
        "/student/purchase-request",
        data: formData,
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(response.data["message"])));

        // Reset form after success
        transactionIdController.clear();
        amountController.clear();
        selectedFile = null;
        selectedFileName = null;
      }
    } on DioException catch (e) {
      String errorMessage = "Something went wrong";
      if (e.response != null && e.response?.data != null) {
        errorMessage = e.response?.data["message"] ?? errorMessage;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    transactionIdController.dispose();
    amountController.dispose();
    super.dispose();
  }
}
