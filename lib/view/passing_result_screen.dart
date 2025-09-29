// import 'package:flutter/material.dart';
// import 'package:mdcat/providers/passing_result_provider.dart';
// import 'package:mdcat/widgets/circle_gradient.dart';
// import 'package:mdcat/widgets/custom_background.dart';
// import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';
// import 'package:provider/provider.dart';

// class ResultScreen extends StatelessWidget {
//   const ResultScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final result = context.watch<ResultProvider>().result;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       bottomNavigationBar: const AppBottomNav(currentIndex: 0),

//       body: Column(
//         children: [
//           CustomHeader(title: "Physics ", counterText: "#1/70"),

//           const SizedBox(height: 15),

//           // 🔹 LinearProgressIndicator with rounded corners
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10), // Rounded corners
//               child: LinearProgressIndicator(
//                 value: result.percentage / 100, // percentage progress
//                 backgroundColor: Colors.grey.shade300,
//                 valueColor: const AlwaysStoppedAnimation<Color>(
//                   Color(0xFFFF5A29), // 🔸 your #FF5A29 color
//                 ),
//                 minHeight: 8, // a bit thicker
//               ),
//             ),
//           ),

//           const SizedBox(height: 24),
//           const Text(
//             "Congratulation!  🎉",
//             style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
//           ),
//           const SizedBox(height: 7),
//           // _buildCircularProgress(result.percentage),
//           GradientCircularProgress(percent: 85),

//           const SizedBox(height: 10),
//           const Text(
//             "Mcqs Passed 👏",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(height: 15),
//           Text(
//             "${result.correctAnswers}/${result.totalQuestions}",
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 15),
//           Text(
//             "You have Pass the Test",
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               children: [
//                 SizedBox(
//                   width: 235, // fixed width
//                   height: 47, // fixed height
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF8C59FF),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(
//                           16,
//                         ), // updated radius
//                       ),
//                     ),
//                     onPressed: () {},
//                     child: const Text(
//                       "Start New Test",
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 18),
//                 SizedBox(
//                   width: 235, // fixed width
//                   height: 47, // fixed height
//                   child: OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(
//                           16,
//                         ), // updated radius
//                       ),
//                       side: const BorderSide(color: Color(0xFF8C59FF)),
//                     ),
//                     onPressed: () {},
//                     child: const Text(
//                       "Check Result",
//                       style: TextStyle(fontSize: 16, color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }

//   // Widget _buildCircularProgress(double percent) {
//   //   return SizedBox(
//   //     height: 220, // bigger container
//   //     width: 220,
//   //     child: Stack(
//   //       alignment: Alignment.center,
//   //       children: [
//   //         Transform.scale(
//   //           scale: 3.7, // enlarge circle
//   //           child: CircularProgressIndicator(
//   //             value: percent / 100,
//   //             strokeWidth: 8, // thicker ring
//   //             backgroundColor: Color(0x2EB158FF),
//   //             valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8C59FF)),
//   //           ),
//   //         ),
//   //         Text(
//   //           "${percent.toStringAsFixed(0)}%",
//   //           style: const TextStyle(
//   //             fontSize: 22, // make percentage text bigger too
//   //             fontWeight: FontWeight.bold,
//   //             color: Colors.black,
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//   // }
// }
// import 'package:flutter/material.dart';
// import 'package:mdcat/providers/passing_result_provider.dart';
// import 'package:mdcat/providers/quiz_provider.dart';
// import 'package:mdcat/providers/subject_provider.dart';
// import 'package:mdcat/view/test_result_screen.dart';
// import 'package:mdcat/widgets/circle_gradient.dart';
// import 'package:mdcat/widgets/custom_background.dart';
// import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';
// import 'package:provider/provider.dart';

// class ResultScreen extends StatelessWidget {
//   const ResultScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final quizProvider = context.watch<QuizProvider>();

//     // // Calculate dynamic values
//     // final totalQuestions = quizProvider.questions.length;
//     // final correctAnswers = quizProvider.correctAnswers.length;
//     // final percentage = totalQuestions == 0
//     //     ? 0
//     //     : (correctAnswers / totalQuestions) * 100;

//     // Get subject from first question if available
//     final subject = context.watch<SubjectProvider>().selectedSubject ?? "Test";
//     final result = context.watch<ResultProvider>().result;
//     final quizProvider = context.read<QuizProvider>();

//     // final subject = context.watch<SubjectProvider>().selectedSubject ?? "Test";
//     final double percentage = result.totalQuestions > 0
//         ? (result.correctAnswers / result.totalQuestions) * 100
//         : 0;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       bottomNavigationBar: const AppBottomNav(currentIndex: 0),
//       body: Column(
//         children: [
//           CustomHeader(
//             title: subject,
//             counterText: "#1/${result.totalQuestions}",
//           ),

//           // CustomHeader(
//           //   title: subject, // dynamic subject
//           //   counterText: "#1/${result.totalQuestions}",
//           // ),
//           const SizedBox(height: 15),

//           // Linear Progress Indicator
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: LinearProgressIndicator(
//                 value: percentage / 100,
//                 backgroundColor: Colors.grey.shade300,
//                 valueColor: const AlwaysStoppedAnimation<Color>(
//                   Color(0xFFFF5A29),
//                 ),
//                 minHeight: 8,
//               ),
//             ),
//           ),

//           const SizedBox(height: 24),
//           const Text(
//             "Congratulation!  🎉",
//             style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
//           ),
//           const SizedBox(height: 7),

//           // Circular Progress
//           GradientCircularProgress(percent: percentage),

//           const SizedBox(height: 10),
//           const Text(
//             "Mcqs Passed 👏",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(height: 15),
//           Text(
//             "${result.correctAnswers}/${result.totalQuestions}",
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),

//           // Text(
//           //   "$correctAnswers/$totalQuestions",
//           //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           // ),
//           const SizedBox(height: 15),

//           Text(
//             "You passed the test!",
//             style: const TextStyle(
//               fontSize: 14,
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Spacer(),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               children: [
//                 SizedBox(
//                   width: 235,
//                   height: 47,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF8C59FF),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                     ),
//                     onPressed: () {
//                       // Restart or go to new test
//                       quizProvider.resetQuiz(); // implement in provider
//                       Navigator.pop(context); // or navigate to test selection
//                     },
//                     child: const Text(
//                       "Start New Test",
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 18),
//                 SizedBox(
//                   width: 235,
//                   height: 47,
//                   child: OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       side: const BorderSide(color: Color(0xFF8C59FF)),
//                     ),
//                     onPressed: () {
//                       // Navigate to detailed result screen
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => TestResultScreen(
//                             // quizProvider: quizProvider,
//                           ),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       "Check Result",
//                       style: TextStyle(fontSize: 16, color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mdcat/providers/passing_result_provider.dart';
import 'package:mdcat/providers/quiz_provider.dart';
import 'package:mdcat/providers/subject_provider.dart';
import 'package:mdcat/view/test_result_screen.dart';
import 'package:mdcat/widgets/circle_gradient.dart';
import 'package:mdcat/widgets/custom_background.dart';
import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';
import 'package:provider/provider.dart';

// import '../providers/quiz_provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final result = context.watch<ResultProvider>().result;
    final subject = context.watch<SubjectProvider>().selectedSubject ?? "Test";
    final quizProvider = context.read<QuizProvider>();
    final totalQuestions = quizProvider.questions.length;
    // ignore: unused_local_variable
    final attemptedQuestions =
        quizProvider.selectedOptions.length; // only for reset

    final double percentage = result.totalQuestions > 0
        ? (result.correctAnswers / result.totalQuestions) * 100
        : 0;
    final bool isPassed = percentage > 50;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
      body: Column(
        children: [
          CustomHeader(
            title: subject,
            counterText: "#1/${result.totalQuestions}",
          ),

          const SizedBox(height: 15),

          // Linear Progress Indicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: totalQuestions == 0
                    ? 0
                    : quizProvider.selectedOptions.length / totalQuestions,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFFFF5A29),
                ),
                minHeight: 8,
              ),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 24),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(10),
          //     child: LinearProgressIndicator(
          //       value: percentage / 100,
          //       backgroundColor: Colors.grey.shade300,
          //       valueColor: const AlwaysStoppedAnimation<Color>(
          //         Color(0xFFFF5A29),
          //       ),
          //       minHeight: 8,
          //     ),
          //   ),
          // ),
          const SizedBox(height: 24),
          Text(
            isPassed ? "Congratulation! 🎉" : "Whoops, sorry 😞",
            style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
          ),
          // const Text(
          //   "Congratulation!  🎉",
          //   style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
          // ),
          const SizedBox(height: 7),

          // Circular Progress
          GradientCircularProgress(percent: percentage),

          const SizedBox(height: 10),
          Text(
            isPassed ? "Mcqs Passed 👏" : "Mcqs Failed ❌",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          // const Text(
          //   "Mcqs Passed 👏",
          //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          // ),
          const SizedBox(height: 15),

          Text(
            "${result.correctAnswers}/${result.totalQuestions}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),

          Text(
            isPassed
                ? "You have passed the test!"
                : "You have failed the test!",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Text(
          //   "You have pass the test!",
          //   style: const TextStyle(
          //     fontSize: 14,
          //     color: Colors.black,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          const Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(
                  width: 235,
                  height: 47,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8C59FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      quizProvider.resetQuiz();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Start New Test",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: 235,
                  height: 47,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      side: const BorderSide(color: Color(0xFF8C59FF)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TestResultScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Check Result",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
