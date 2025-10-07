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
