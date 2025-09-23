class AnswerOption {
  final String label; // A., B., C., D.
  final String text;
  final bool isCorrect;
  bool isSelected;

  AnswerOption({
    required this.label,
    required this.text,
    required this.isCorrect,
    this.isSelected = false,
  });

  // Factory method to create from API option
  factory AnswerOption.fromApi({
    required String label,
    required String text,
    required bool isCorrect,
  }) {
    return AnswerOption(
      label: label,
      text: text,
      isCorrect: isCorrect,
      isSelected: false,
    );
  }
}
