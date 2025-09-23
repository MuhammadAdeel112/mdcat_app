// class LevelModel {
//   final String id;
//   final String title;
//   final int mcqs;
//   final int price;
//   final String level; // 🔹 New field
//   final String subject; // 🔹 New field
//   final String className; // 🔹 New field
//   bool isUnlocked;

//   LevelModel({
//     required this.id,
//     required this.title,
//     required this.mcqs,
//     required this.price,
//     required this.level, // 🔹 Required now
//     required this.subject, // 🔹 Required now
//     required this.className, // 🔹 Required now
//     this.isUnlocked = false,
//   });
// }
class LevelModel {
  final String id;
  final String title;
  final int mcqs;
  final int price;
  final String level;
  bool isUnlocked;

  LevelModel({
    required this.id,
    required this.title,
    required this.mcqs,
    required this.price,
    required this.level,
    this.isUnlocked = false,
  });
}
