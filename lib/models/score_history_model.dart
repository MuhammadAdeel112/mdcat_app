class ScoreHistory {
  final String subject;
  final String date;
  final String score;
  final String status;

  ScoreHistory({
    required this.subject,
    required this.date,
    required this.score,
    required this.status,
  });

  factory ScoreHistory.fromJson(Map<String, dynamic> json) {
    return ScoreHistory(
      subject: json['subject'] ?? '',
      date: json['date'] ?? '',
      score: json['score'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
