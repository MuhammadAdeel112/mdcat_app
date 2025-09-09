// class AnswerOption {
//   final String text;
//   final bool isCorrect;
//   bool isSelected;

//   AnswerOption({
//     required this.text,
//     required this.isCorrect,
//     this.isSelected = false,
//   });
// }

// class AnswerOption {
//   final String text;
//   final bool isCorrect;
//   bool isSelected;

//   AnswerOption({
//     required this.text,
//     required this.isCorrect,
//     this.isSelected = false,
//   });
// }

class AnswerOption {
  final String label; // A, B, C...
  final String text;
  final bool isCorrect;
  bool isSelected;

  AnswerOption({
    required this.label,
    required this.text,
    required this.isCorrect,
    this.isSelected = false,
  });
}
