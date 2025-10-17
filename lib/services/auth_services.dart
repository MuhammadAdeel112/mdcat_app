import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // static const String baseUrl = "http://10.0.2.2:5000/api/student";
  // static const String baseUrl = "http://47.130.103.135/api/student";
  static const String baseUrl = "https://api.mdcatpro.com/api/student";

  // Use 10.0.2.2 for Android emulator; replace with localhost/real IP for other setups

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/signin');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data; // contains message and token
    } else {
      throw Exception(data['message'] ?? 'Login failed');
    }
  }
}
