class Student {
  final String id;
  final String name;
  final String fatherName;
  final String phoneNo;
  final String email;
  final String profilePic;
  final String testType;
  final String province;
  final String gender;

  Student({
    required this.id,
    required this.name,
    required this.fatherName,
    required this.phoneNo,
    required this.email,
    required this.profilePic,
    required this.testType,
    required this.province,
    required this.gender,
  });
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] ?? json['_id'] ?? '',
      name: json['name'] ?? '',
      fatherName: json['fatherName'] ?? '',
      phoneNo: json['phoneNo'] ?? '',
      email: json['email'] ?? '',
      profilePic: json['profilePic'] ?? '',
      testType: json['testType'] ?? '',
      province: json['province'] ?? '',
      gender: json['gender'] ?? '',
    );
  }
}
