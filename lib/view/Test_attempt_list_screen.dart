// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:mdcat/models/Test_model.dart';
// import 'package:mdcat/providers/test_result_provider.dart';
// import 'package:mdcat/view/Test_result_from_history.dart';
// import 'package:mdcat/widgets/custom_background.dart';
// import 'package:provider/provider.dart';
//
// class TestAttemptsListScreen extends StatelessWidget {
//   final String testId;
//   final String testTitle;
//
//   const TestAttemptsListScreen({
//     super.key,
//     required this.testId,
//     required this.testTitle,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => TestResultProvider()..fetchTestAttempts(testId),
//       child: Consumer<TestResultProvider>(
//         builder: (context, provider, _) {
//           return Scaffold(
//             backgroundColor: Colors.white,
//             body: Column(
//               children: [
//                 /// Header
//                 CustomHeader(
//                   title: testTitle,
//                   counterText: "",
//                   onBack: () => Navigator.pop(context),
//                 ),
//
//                 /// Loading State
//                 if (provider.isLoading)
//                   const Expanded(
//                     child: Center(
//                       child: CircularProgressIndicator(
//                         color: Color(0xFF8C59FF),
//                       ),
//                     ),
//                   ),
//
//                 /// Error State
//                 if (provider.errorMessage != null)
//                   Expanded(
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Text(
//                           provider.errorMessage!,
//                           style: const TextStyle(color: Colors.red, fontSize: 16),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                 /// Main Content - Attempts List
//                 if (provider.testResult != null)
//                   Expanded(
//                     child: Column(
//                       children: [
//                         /// Summary Card
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Card(
//                             elevation: 2,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   _buildSummaryItem(
//                                     "Attempts",
//                                     provider.testResult!.summary['totalAttempts'].toString(),
//                                   ),
//                                   _buildSummaryItem(
//                                     "Best Score",
//                                     provider.testResult!.summary['bestScore'].toString(),
//                                   ),
//                                   _buildSummaryItem(
//                                     "Average",
//                                     provider.testResult!.summary['averageScore'].toString(),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         /// Attempts List
//                         Expanded(
//                           child: ListView.builder(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             itemCount: provider.testResult!.attempts.length,
//                             itemBuilder: (context, index) {
//                               final attempt = provider.testResult!.attempts[index];
//                               final formattedDate = DateFormat('dd MMM yyyy • hh:mm a')
//                                   .format(attempt.startedAt);
//
//                               return Card(
//                                 margin: const EdgeInsets.only(bottom: 12),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: ListTile(
//                                   contentPadding: const EdgeInsets.symmetric(
//                                     horizontal: 16,
//                                     vertical: 8,
//                                   ),
//                                   leading: CircleAvatar(
//                                     backgroundColor: const Color(0xFF8C59FF),
//                                     radius: 22,
//                                     child: Text(
//                                       attempt.attemptNumber.toString(),
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   title: Text(
//                                     "Attempt ${attempt.attemptNumber}",
//                                     style: const TextStyle(fontWeight: FontWeight.w600),
//                                   ),
//                                   subtitle: Text(
//                                     formattedDate,
//                                     style: const TextStyle(color: Colors.black54),
//                                   ),
//                                   trailing: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Text(
//                                         "${attempt.score}/${provider.testResult!.totalQuestions}",
//                                         style: const TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       Text(
//                                         attempt.status == "completed"
//                                             ? "Completed"
//                                             : "In Progress",
//                                         style: TextStyle(
//                                           fontSize: 12,
//                                           color: attempt.status == "completed"
//                                               ? Colors.green
//                                               : Colors.orange,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   onTap: attempt.status == "completed"
//                                       ? () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (_) => TestResultFromHistory(
//                                           answers: attempt.answers,
//                                           testTitle: testTitle,
//                                         ),
//                                       ),
//                                     );
//                                   }
//                                       : null,
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildSummaryItem(String label, String value) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         Text(
//           label,
//           style: const TextStyle(fontSize: 13, color: Colors.grey),
//         ),
//       ],
//     );
//   }
// }
// lib/views/test_attempts_list_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdcat/models/Test_model.dart';
import 'package:mdcat/providers/test_result_provider.dart';
import 'package:mdcat/view/Test_result_from_history.dart';
import 'package:mdcat/widgets/custom_background.dart';
import 'package:provider/provider.dart';

import 'Test_result_from_history.dart';
import 'Test_review_screen.dart';

class TestAttemptsListScreen extends StatelessWidget {
  final String testId;
  final String testTitle;

  const TestAttemptsListScreen({
    super.key,
    required this.testId,
    required this.testTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TestResultProvider()..fetchTestAttempts(testId),
      child: Consumer<TestResultProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                CustomHeader(
                  title: testTitle,
                  counterText: "",
                  onBack: () => Navigator.pop(context),
                ),

                if (provider.isLoading)
                  const Expanded(child: Center(child: CircularProgressIndicator(color: Color(0xFF8C59FF)))),

                if (provider.errorMessage != null)
                  Expanded(
                    child: Center(child: Text(provider.errorMessage!, style: const TextStyle(color: Colors.red))),
                  ),

                if (provider.testResult != null)
                  Expanded(
                    child: Column(
                      children: [
                        // Summary
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  _buildSummary("Attempts", provider.testResult!.summary['totalAttempts'].toString()),
                                  _buildSummary("Best", provider.testResult!.summary['bestScore'].toString()),
                                  _buildSummary("Avg", provider.testResult!.summary['averageScore'].toString()),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Attempts List
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: provider.testResult!.attempts.length,
                            itemBuilder: (context, index) {
                              final attempt = provider.testResult!.attempts[index];
                              final date = DateFormat('dd MMM yyyy • hh:mm a').format(attempt.startedAt);

                              return Card(
                                margin: const EdgeInsets.only(bottom: 12),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: const Color(0xFF8C59FF),
                                    child: Text(attempt.attemptNumber.toString(), style: const TextStyle(color: Colors.white)),
                                  ),
                                  title: Text("Attempt ${attempt.attemptNumber}"),
                                  subtitle: Text(date),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${attempt.score}/${provider.testResult!.totalQuestions}", style: const TextStyle(fontWeight: FontWeight.bold)),
                                      Text(attempt.status == "completed" ? "Completed" : "In Progress",
                                          style: TextStyle(color: attempt.status == "completed" ? Colors.green : Colors.orange)),
                                    ],
                                  ),
                                  onTap: attempt.status == "completed"
                                      ? () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => TestReviewScreen(
                                        attempt: attempt,           // Passing full attempt
                                        testTitle: testTitle,
                                      ),
                                    ),
                                  )
                                      : null,
                                  // onTap: attempt.status == "completed"
                                  //     ? () => Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (_) => TestResultFromHistory(
                                  //       answers: attempt.answers,
                                  //       testTitle: testTitle,
                                  //     ),
                                  //   ),
                                  // )
                                  //     : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSummary(String label, String value) {
    return Column(children: [Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), Text(label, style: const TextStyle(color: Colors.grey))]);
  }
}