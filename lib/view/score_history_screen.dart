// import 'package:flutter/material.dart';
// import 'package:mdcat/providers/score_history_provider.dart';
// import 'package:mdcat/widgets/custom_background.dart';
// import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';

// class ScoreHistoryScreen extends StatelessWidget {
//   const ScoreHistoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => ScoreHistoryProvider()..fetchScoreHistory(),
//       child: Consumer<ScoreHistoryProvider>(
//         builder: (context, provider, _) {
//           // trigger fetch if not done yet
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             if (!provider.isLoading &&
//                 provider.attempts.isEmpty &&
//                 provider.errorMessage == null) {
//               provider.fetchScoreHistory();
//             }
//           });

//           return Scaffold(
//             backgroundColor: Colors.white,
//             bottomNavigationBar: const AppBottomNav(currentIndex: 2),

//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /// Gradient Header
//                 const CustomHeader(
//                   title: "Your Score History",
//                   counterText: "",
//                 ),

//                 const Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Text(
//                     "History",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                   ),
//                 ),

//                 /// Main content
//                 Expanded(
//                   child: provider.isLoading
//                       ? const Center(
//                           child: CircularProgressIndicator(
//                             color: Color(0xFF8C59FF),
//                           ),
//                         )
//                       : provider.errorMessage != null
//                       ? Center(
//                           child: Text(
//                             provider.errorMessage!,
//                             style: const TextStyle(
//                               color: Colors.redAccent,
//                               fontSize: 14,
//                             ),
//                           ),
//                         )
//                       : provider.attempts.isEmpty
//                       ? const Center(
//                           child: Text(
//                             "No test attempts found",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.black54,
//                             ),
//                           ),
//                         )
//                       : ListView.builder(
//                           itemCount: provider.attempts.length,
//                           itemBuilder: (context, index) {
//                             final attempt = provider.attempts[index];
//                             final formattedDate = DateFormat(
//                               'dd MMM yyyy',
//                             ).format(attempt.attemptedAt);

//                             return Container(
//                               margin: const EdgeInsets.symmetric(
//                                 horizontal: 16,
//                                 vertical: 8,
//                               ),
//                               padding: const EdgeInsets.all(12),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(12),
//                                 border: Border.all(color: Colors.grey.shade300),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.shade200,
//                                     blurRadius: 5,
//                                     spreadRadius: 1,
//                                     offset: const Offset(0, 3),
//                                   ),
//                                 ],
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   /// Left side text
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         attempt.subject,
//                                         style: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Text(
//                                         "${attempt.score} out of ${attempt.credits}",
//                                         style: const TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.black54,
//                                         ),
//                                       ),
//                                     ],
//                                   ),

//                                   /// Right side
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Text(
//                                         formattedDate,
//                                         style: const TextStyle(
//                                           fontSize: 12,
//                                           color: Colors.black54,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 8),
//                                       ElevatedButton(
//                                         onPressed: () {
//                                           // Later: navigate to result details if needed
//                                         },
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor: const Color(
//                                             0xFF8C59FF,
//                                           ),
//                                           padding: const EdgeInsets.symmetric(
//                                             horizontal: 16,
//                                             vertical: 6,
//                                           ),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(
//                                               8,
//                                             ),
//                                           ),
//                                         ),
//                                         child: Text(
//                                           attempt.status == "in-progress"
//                                               ? "Continue"
//                                               : "See Result",
//                                           style: const TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdcat/providers/score_history_provider.dart';
import 'package:mdcat/view/homescreen.dart';
// import 'package:mdcat/view/home_screen.dart';
// import 'package:mdcat/view/homescreen.dart';
import 'package:mdcat/widgets/custom_background.dart';
import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';
// import 'package:mdcat/widgets/top_gradient_with_back.dart';
// import 'package:mdcat/widgets/topgardientwithback.dart';
import 'package:provider/provider.dart';

import 'package:mdcat/view/Test_attempt_list_screen.dart';

class ScoreHistoryScreen extends StatelessWidget {
  const ScoreHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScoreHistoryProvider()..fetchScoreHistory(),
      child: Consumer<ScoreHistoryProvider>(
        builder: (context, provider, _) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!provider.isLoading &&
                provider.attempts.isEmpty &&
                provider.errorMessage == null) {
              provider.fetchScoreHistory();
            }
          });

          return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: const AppBottomNav(currentIndex: 2),

            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 Gradient Header (unchanged)
                CustomHeader(
                  title: "Your Score History",
                  counterText: "",
                  onBack: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                ),

                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "History",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),

                /// 🔹 Main content
                Expanded(
                  child: provider.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF8C59FF),
                          ),
                        )
                      : provider.errorMessage != null
                      ? Center(
                          child: Text(
                            provider.errorMessage!,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 14,
                            ),
                          ),
                        )
                      : provider.attempts.isEmpty
                      ? const Center(
                          child: Text(
                            "No test attempts found",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: provider.attempts.length,
                          itemBuilder: (context, index) {
                            final attempt = provider.attempts[index];
                            final formattedDate = DateFormat(
                              'dd MMM yyyy',
                            ).format(attempt.attemptedAt);

                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade300),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  /// Left side text
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        attempt.subject,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "${attempt.score} out of ${attempt.credits}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),

                                  /// Right side date + button
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        formattedDate,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (attempt.status == "in-progress") {
                                            // Your continue logic later
                                          } else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => TestAttemptsListScreen(
                                                  testId: attempt.testId,
                                                  testTitle: attempt.title,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF8C59FF),
                                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        ),
                                        child: Text(
                                          attempt.status == "in-progress" ? "Continue" : "See Result",
                                          style: const TextStyle(color: Colors.white, fontSize: 12),
                                        ),
                                      ),
                                      // ElevatedButton(
                                      //   onPressed: () {
                                      //     if (attempt.status == "in-progress") {
                                      //       // TODO: Your Continue logic here (you said you'll handle it later)
                                      //       ScaffoldMessenger.of(context).showSnackBar(
                                      //         const SnackBar(content: Text("Continue feature coming soon...")),
                                      //       );
                                      //     } else {
                                      //       // "See Result" - Open list of attempts
                                      //       Navigator.push(
                                      //         context,
                                      //         MaterialPageRoute(
                                      //           builder: (_) => TestAttemptsListScreen(
                                      //             testId: attempt.testId,
                                      //             testTitle: attempt.title,
                                      //           ),
                                      //         ),
                                      //       );
                                      //     }
                                      //   },
                                      //   style: ElevatedButton.styleFrom(
                                      //     backgroundColor: const Color(0xFF8C59FF),
                                      //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                      //     shape: RoundedRectangleBorder(
                                      //       borderRadius: BorderRadius.circular(8),
                                      //     ),
                                      //   ),
                                      //   child: Text(
                                      //     attempt.status == "in-progress" ? "Continue" : "See Result",
                                      //     style: const TextStyle(color: Colors.white, fontSize: 12),
                                      //   ),
                                      // ),
                                      // ElevatedButton(
                                      //   onPressed: () {
                                      //     // TODO: View or Continue action
                                      //   },
                                      //   style: ElevatedButton.styleFrom(
                                      //     backgroundColor: const Color(
                                      //       0xFF8C59FF,
                                      //     ),
                                      //     padding: const EdgeInsets.symmetric(
                                      //       horizontal: 16,
                                      //       vertical: 6,
                                      //     ),
                                      //     shape: RoundedRectangleBorder(
                                      //       borderRadius: BorderRadius.circular(
                                      //         8,
                                      //       ),
                                      //     ),
                                      //   ),
                                      //   child: Text(
                                      //     attempt.status == "in-progress"
                                      //         ? "Continue"
                                      //         : "See Result",
                                      //     style: const TextStyle(
                                      //       color: Colors.white,
                                      //       fontSize: 12,
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
