// // import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:mdcat/models/student_model.dart';

// class SignupService {
//   final Dio _dio = Dio(
//     BaseOptions(
//       // baseUrl: "http://localhost:5000/api/student",
//       baseUrl: "http://47.130.103.135/api/student/signup",
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 10),
//     ),
//   );

//   Future<Student> signupStudent({
//     required String name,
//     required String fatherName,
//     required String phoneNo,
//     required String email,
//     required String password,
//     required String testType,
//     required String province,
//     required String gender,
//     String? profilePicPath,
//   }) async {
//     try {
//       final formData = FormData.fromMap({
//         "name": name,
//         "fatherName": fatherName,
//         "phoneNo": phoneNo,
//         "email": email,
//         "password": password,
//         "testType": testType,
//         "province": province,
//         "gender": gender,
//         if (profilePicPath != null && profilePicPath.isNotEmpty)
//           "profilePic": await MultipartFile.fromFile(profilePicPath),
//       });

//       final response = await _dio.post(
//         "/signup",
//         data: formData,
//         options: Options(contentType: "multipart/form-data"),
//       );

//       if (response.statusCode == 201) {
//         return Student.fromJson(response.data['student']);
//       } else {
//         throw Exception(response.data['message'] ?? "Signup failed");
//       }
//     } on DioException catch (e) {
//       throw Exception(
//         e.response?.data['message'] ?? "Network Error: ${e.message}",
//       );
//     }
//   }
// }
// import 'package:dio/dio.dart';

// class SignupService {
//   final Dio _dio = Dio();

//   // ✅ Use your hosted API instead of localhost
//   static const String baseUrl = "http://47.130.103.135/api/student/signup";

//   Future<Response> signupStudent({
//     required String name,
//     required String fatherName,
//     required String phoneNo,
//     required String email,
//     required String password,
//     required String testType,
//     required String province,
//     required String gender,
//     String? profilePicPath,
//   }) async {
//     try {
//       FormData formData = FormData.fromMap({
//         "name": name,
//         "fatherName": fatherName,
//         "phoneNo": phoneNo,
//         "email": email,
//         "password": password,
//         "testType": testType,
//         "province": province,
//         "gender": gender,
//         if (profilePicPath != null && profilePicPath.isNotEmpty)
//           "profilePic": await MultipartFile.fromFile(
//             profilePicPath,
//             filename: profilePicPath.split("/").last,
//           ),
//       });

//       final response = await _dio.post(
//         baseUrl,
//         data: formData,
//         options: Options(
//           headers: {"Content-Type": "multipart/form-data"},
//         ),
//       );

//       return response;
//     } on DioException catch (e) {
//       throw Exception(
//         e.response?.data ?? e.message ?? "Signup failed",
//       );
//     }
//   }
// }
import 'package:dio/dio.dart';
import 'package:mdcat/models/student_model.dart';

class SignupService {
  final Dio _dio = Dio();

  static const String baseUrl = "http://47.130.103.135/api/student/signup";

  Future<Student> signupStudent({
    required String name,
    required String fatherName,
    required String phoneNo,
    required String email,
    required String password,
    required String testType,
    required String province,
    required String gender,
    String? profilePicPath,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "fatherName": fatherName,
        "phoneNo": phoneNo,
        "email": email,
        "password": password,
        "testType": testType,
        "province": province,
        "gender": gender,
        if (profilePicPath != null && profilePicPath.isNotEmpty)
          "profilePic": await MultipartFile.fromFile(
            profilePicPath,
            filename: profilePicPath.split("/").last,
          ),
      });

      final response = await _dio.post(
        baseUrl,
        data: formData,
        options: Options(headers: {"Content-Type": "multipart/form-data"}),
      );

      // ✅ Success → map response to Student model
      if (response.statusCode == 201) {
        return Student.fromJson(response.data["student"]);
      } else {
        throw Exception(response.data["message"] ?? "Signup failed");
      }
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?["message"] ?? e.message ?? "Signup failed",
      );
    }
  }
}
