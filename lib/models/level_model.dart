class LevelModel {
  final String id;
  final String title;
  final int mcqs;
  final int price;
  final String level;
  final int testDuration;
  bool isUnlocked;
  final bool isFree;

  LevelModel({
    required this.id,
    required this.title,
    required this.mcqs,
    required this.price,
    required this.level,
    this.testDuration = 0,
    this.isUnlocked = false,
    this.isFree = false,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      mcqs: json['questionCount'] ?? 0,
      price: json['credits'] ?? 0,
      level: json['chapter'] ?? '',
      testDuration: json['testDuration'] ?? 0,
      isUnlocked: json['isFree'] ?? false,
      isFree: json['isFree'] ?? false,
    );
  }
}
