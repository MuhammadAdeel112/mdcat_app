import 'package:dio/dio.dart';
import 'package:mdcat/models/student_model.dart';

class SignupService {
  final Dio _dio = Dio();

  // static const String baseUrl = "http://47.130.103.135/api/student/signup";
  // static const String baseUrl = "https://api.mdcatpro.com/api/student/signup";
  static const String baseUrl = "https://api.mdcatpro.com/api/student/signup";
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

      // 🔹 DEBUG: print all fields
      print("=== FormData Fields ===");
      formData.fields.forEach((field) {
        print("${field.key}: ${field.value}");
      });

      // 🔹 DEBUG: print all files
      print("=== FormData Files ===");
      formData.files.forEach((file) {
        print("${file.key}: ${file.value.filename}");
      });

      final response = await _dio.post(
        baseUrl,
        data: formData,
      //   options: Options(
      //       // headers: {"Content-Type": "multipart/form-data"}
      //
       );
      // 🔹 Debug: see what API actually sends
      print("=== Response Data ===");
      print(response.data);
      print("=== Response Status ===");
      print(response.statusCode);

      if (response.statusCode == 201) {
        return Student.fromJson(response.data["student"]);
      } else {
        throw Exception(response.data["message"] ?? "Signup failed");
      }
    }
    on DioException catch (e) {
      print("=== ERROR ===");
      print(e.response?.data);
      print(e.message);
      print(e.response?.statusCode);

      throw Exception(
        e.response?.data?["message"] ?? e.message ?? "Signup failed",
      );
    }
    // on DioException catch (e) {
    //   throw Exception(
    //     e.response?.data?["message"] ?? e.message ?? "Signup failed",
    //   );
    // }
  }

  // Future<Student> signupStudent({
  //   required String name,
  //   required String fatherName,
  //   required String phoneNo,
  //   required String email,
  //   required String password,
  //   required String testType,
  //   required String province,
  //   required String gender,
  //   String? profilePicPath,
  // }) async {
  //   try {
  //     FormData formData = FormData.fromMap({
  //       "name": name,
  //       "fatherName": fatherName,
  //       "phoneNo": phoneNo,
  //       "email": email,
  //       "password": password,
  //       "testType": testType,
  //       "province": province,
  //       "gender": gender,
  //       if (profilePicPath != null && profilePicPath.isNotEmpty)
  //         "profilePic": await MultipartFile.fromFile(
  //           profilePicPath,
  //           filename: profilePicPath.split("/").last,
  //         ),
  //     });

  //     final response = await _dio.post(
  //       baseUrl,
  //       data: formData,
  //       options: Options(headers: {"Content-Type": "multipart/form-data"}),
  //     );

  //     // ✅ Success → map response to Student model
  //     if (response.statusCode == 201) {
  //       return Student.fromJson(response.data["student"]);
  //     } else {
  //       throw Exception(response.data["message"] ?? "Signup failed");
  //     }
  //   } on DioException catch (e) {
  //     throw Exception(
  //       e.response?.data?["message"] ?? e.message ?? "Signup failed",
  //     );
  //   }
  // }
}
