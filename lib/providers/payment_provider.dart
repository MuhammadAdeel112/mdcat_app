import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaymentProvider extends ChangeNotifier {
  TextEditingController transactionIdController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  File? uploadedFile;
  bool isLoading = false;
  String? apiResponse;

  Future<void> pickFile(File file) async {
    uploadedFile = file;
    notifyListeners();
  }

  Future<void> submitPayment(BuildContext context) async {
    if (transactionIdController.text.isEmpty || amountController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter all fields")));
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      // Example API endpoint (replace with your own)
      final uri = Uri.parse("https://yourapi.com/payment");
      var request = http.MultipartRequest("POST", uri);

      request.fields["transaction_id"] = transactionIdController.text.trim();
      request.fields["amount"] = amountController.text.trim();

      if (uploadedFile != null) {
        request.files.add(
          await http.MultipartFile.fromPath("file", uploadedFile!.path),
        );
      }

      var response = await request.send();
      var responseData = await http.Response.fromStream(response);

      apiResponse = responseData.body;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Response: $apiResponse")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    isLoading = false;
    notifyListeners();
  }
}
