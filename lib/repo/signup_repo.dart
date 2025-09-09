import 'package:mdcat/models/student_model.dart';
// import 'package:mdcat/services/signup_service.dart';
import 'package:mdcat/services/signup_services.dart';

class SignupRepo {
  final SignupService _service = SignupService();

  Future<Student> signup({
    required String name,
    required String fatherName,
    required String phoneNo,
    required String email,
    required String password,
    required String testType,
    required String province,
    required String gender,
    String? profilePicPath,
  }) {
    return _service.signupStudent(
      name: name,
      fatherName: fatherName,
      phoneNo: phoneNo,
      email: email,
      password: password,
      testType: testType,
      province: province,
      gender: gender,
      profilePicPath: profilePicPath,
    );
  }
}
