// class WalletHistory {
//   final String testId;
//   final String title;
//   final String subject;
//   final int credits;

//   WalletHistory({
//     required this.testId,
//     required this.title,
//     required this.subject,
//     required this.credits,
//   });

//   factory WalletHistory.fromJson(Map<String, dynamic> json) {
//     return WalletHistory(
//       testId: json['testId'] ?? '',
//       title: json['title'] ?? '',
//       subject: json['subject'] ?? '',
//       credits: json['credits'] ?? 0,
//     );
//   }
// }

// class WalletData {
//   final int totalCreditsUsed;
//   final List<WalletHistory> tests;

//   WalletData({
//     required this.totalCreditsUsed,
//     required this.tests,
//   });

//   factory WalletData.fromJson(Map<String, dynamic> json) {
//     return WalletData(
//       totalCreditsUsed: json['totalCreditsUsed'] ?? 0,
//       tests: (json['tests'] as List)
//           .map((e) => WalletHistory.fromJson(e))
//           .toList(),
//     );
//   }
// }
class UsedCreditItem {
  final String testId;
  final String title;
  final String subject;
  final int credits;

  UsedCreditItem({
    required this.testId,
    required this.title,
    required this.subject,
    required this.credits,
  });

  factory UsedCreditItem.fromJson(Map<String, dynamic> json) {
    return UsedCreditItem(
      testId: json['testId'] ?? '',
      title: json['title'] ?? '',
      subject: json['subject'] ?? '',
      credits: json['credits'] ?? 0,
    );
  }
}
