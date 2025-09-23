// class LevelModel {
//   final int id;
//   final String title;
//   final int mcqs;

//   LevelModel({required this.id, required this.title, required this.mcqs});
// }
// class LevelModel {
//   final int id;
//   final String title;
//   final int mcqs;
//   final int price; // credits needed to unlock
//   bool isUnlocked; // lock/unlock state

//   LevelModel({
//     required this.id,
//     required this.title,
//     required this.mcqs,
//     required this.price,
//     this.isUnlocked = false, // default locked
//   });
// }
// class LevelModel {
//   final int id;
//   final String title;
//   final int mcqs;
//   final bool isUnlocked;
//   final int credits; // add this

//   LevelModel({
//     required this.id,
//     required this.title,
//     required this.mcqs,
//     required this.isUnlocked,
//     required this.credits, // add this
//   });
// }
// class LevelModel {
//   // final int id;
//   final String id;
//   final String title;
//   final int mcqs;
//   final int price; // Add this
//   bool isUnlocked;

//   LevelModel({
//     required this.id,
//     required this.title,
//     required this.mcqs,
//     required this.price, // ✅ add required
//     this.isUnlocked = false,
//   });
// }
// class LevelModel {
//   final String id;
//   final String title;
//   final int price;
//   final String level;
//   final String subject;
//   final String className;

//   LevelModel({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.level,
//     required this.subject,
//     required this.className,
//   });

//   factory LevelModel.fromJson(Map<String, dynamic> json) {
//     return LevelModel(
//       id: json["_id"] ?? "",
//       title: json["title"] ?? "",
//       price: json["credits"] ?? 0,
//       level: json["level"] ?? "",
//       subject: json["subject"] ?? "",
//       className: json["class"] ?? "",
//     );
//   }
// }

class LevelModel {
  final String id;
  final String title;
  final int mcqs;
  final int price;
  final String level; // 🔹 New field
  final String subject; // 🔹 New field
  final String className; // 🔹 New field
  bool isUnlocked;

  LevelModel({
    required this.id,
    required this.title,
    required this.mcqs,
    required this.price,
    required this.level, // 🔹 Required now
    required this.subject, // 🔹 Required now
    required this.className, // 🔹 Required now
    this.isUnlocked = false,
  });
}
