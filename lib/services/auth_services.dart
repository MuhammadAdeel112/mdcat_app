import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // static const String baseUrl = "http://10.0.2.2:5000/api/student";
  // static const String baseUrl = "http://47.130.103.135/api/student";
  // static const String baseUrl = "https://api.mdcatpro.com/api/student";
  static const String baseUrl = "https://api.mdcatpro.com/api/student";

  // Use 10.0.2.2 for Android emulator; replace with localhost/real IP for other setups

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/signin');
    print("LOGIN URL: $url");
    print("LOGIN BODY: ${jsonEncode({"email": email, "password": password})}");

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );
    print("LOGIN STATUS: ${response.statusCode}");
    print("LOGIN RESPONSE: ${response.body}");

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data; // contains message and token
    } else {
      throw Exception(data['message'] ?? 'Login failed');
    }

  }

  //verify api code
  Future<Map<String, dynamic>> forgotPassword(String email) async {
    final url = Uri.parse(
      'https://api.mdcatpro.com/api/student/forgot-password',
    );

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // ✅ Successful response
      return data; // {"message": "Reset code sent to email"}
    } else {
      throw Exception(data['message'] ?? 'Forgot password failed');
    }
  }

  Future<Map<String, dynamic>> verifyCode(String email, String code) async {
    final url = Uri.parse('https://api.mdcatpro.com/api/student/verify-code');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "code": code}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data; // success response
    } else {
      throw Exception(data['message'] ?? 'Invalid or expired code');
    }
  }
}
