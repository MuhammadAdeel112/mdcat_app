// class LevelModel {
//   final int id;
//   final String title;
//   final int mcqs;

//   LevelModel({required this.id, required this.title, required this.mcqs});
// }
class LevelModel {
  final int id;
  final String title;
  final int mcqs;
  final int price; // credits needed to unlock
  bool isUnlocked; // lock/unlock state

  LevelModel({
    required this.id,
    required this.title,
    required this.mcqs,
    required this.price,
    this.isUnlocked = false, // default locked
  });
}
