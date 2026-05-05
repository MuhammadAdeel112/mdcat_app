// import 'package:flutter/material.dart';
// import 'package:mdcat/models/question_model.dart';
// import 'package:mdcat/providers/quiz_provider.dart';
// import 'package:mdcat/widgets/custom_background.dart';
// import 'package:mdcat/widgets/option_tile.dart';
// import 'package:provider/provider.dart';
//
// // class QuizScreen extends StatelessWidget {
// //   final String attemptId;
// //   final List<Question> questions;
// //   const QuizScreen({
// //     super.key,
// //     required this.attemptId,
// //     required this.questions,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Consumer<QuizProvider>(
// //       builder: (context, qp, child) {
// //         final question = qp.questions[qp.currentIndex];
// //         // final total = qp.questions.length;
// //         WidgetsBinding.instance.addPostFrameCallback((_) {
// //           if (!qp.isTimerRunning) {
// //             // optional check to avoid restarting
// //             qp.startTimer();
// //           }
// //         });
// class QuizScreen extends StatefulWidget {
//   final String attemptId;
//   final List<Question> questions;
//
//   const QuizScreen({
//     super.key,
//     required this.attemptId,
//     required this.questions,
//   });
//
//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }
//
// class _QuizScreenState extends State<QuizScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//     // ✅ Yahan questions Provider mein set hote hain
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<QuizProvider>().setQuestions(widget.questions);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<QuizProvider>(
//       builder: (context, qp, child) {
//
//         // ✅ Guard lagao - questions load hone tak loading dikhao
//         if (qp.questions.isEmpty) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }
//
//         final question = qp.questions[qp.currentIndex];
//
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (!qp.isTimerRunning) {
//             qp.startTimer();
//           }
//         });
//
//         return Scaffold(
//           backgroundColor: Colors.white,
//           body: SafeArea(
//             child: Column(
//               children: [
//                 /// Purple Gradient Header
//                 CustomHeader(
//                   title: "Demo Test",
//                   counterText: "#${qp.currentIndex + 1}/${qp.questions.length}",
//                   timerText: qp.timerText,
//                 ),
//
//                 // const SizedBox(height: 16),
//                 const SizedBox(height: 12),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.85,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Consumer<QuizProvider>(
//                       builder: (context, qp, child) {
//                         return LinearProgressIndicator(
//                           value: qp.progress, // ✅ dynamic progress
//                           color: Colors.orange,
//                           backgroundColor: Colors.grey.shade300,
//                           minHeight: 6,
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 16),
//
//                 /// Question Box
//                 /// Question Box
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(14),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: Colors.grey.shade400, width: 1),
//                       color: Colors.white,
//                     ),
//                     child: Text(
//                       "${qp.currentIndex + 1}. ${question.text}",
//                       style: const TextStyle(
//                         fontFamily: "Lexend", // 👈 applied only here
//                         fontSize: 17,
//                         fontWeight: FontWeight.w400,
//                         height: 1.0,
//                         letterSpacing: 0,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 16),
//
//                 /// Section Title
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Choose Correct Answers",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFFD4B1E8),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 12),
//
//                 /// Options
//                 Expanded(
//                   child: ListView.builder(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     itemCount: question.options.length,
//                     itemBuilder: (context, i) {
//                       return OptionTile(
//                         qIndex: qp.currentIndex,
//                         index: i,
//                         label: question.options[i].label, // A, B, C, D
//                         text: question.options[i].text, // actual option text
//                       );
//                     },
//                   ),
//                 ),
//
//                 /// Bottom Buttons (Left & Right)
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 14,
//                     right: 14,
//                     bottom: 100,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: 118,
//                         height: 42,
//                         child: ElevatedButton(
//                           onPressed: () => qp.skipQuestion(),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Color(0xFF8C59FF),
//                             foregroundColor: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(
//                                 12,
//                               ), // 👈 12px radius
//                             ),
//                             padding:
//                                 EdgeInsets.zero, // 👈 removes default padding
//                           ),
//                           child: const Text("Skip"),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 118,
//                         height: 42,
//                         child: OutlinedButton(
//                           onPressed:
//                               (qp.isAnswered(qp.currentIndex) ||
//                                   qp.skippedIndexes.contains(qp.currentIndex))
//                               ? () {
//                                   // ✅ If this is the LAST question → Submit
//                                   if (qp.currentIndex ==
//                                       qp.questions.length - 1) {
//                                     qp.submitQuiz(context, attemptId);
//                                   } else {
//                                     qp.nextQuestion();
//                                   }
//                                 }
//                               : null,
//                           style: OutlinedButton.styleFrom(
//                             side: const BorderSide(
//                               color: Color(0xFF8C59FF),
//                               width: 1,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             padding: EdgeInsets.zero,
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 // ✅ Auto switch text from NEXT → SUBMIT
//                                 qp.currentIndex == qp.questions.length - 1
//                                     ? "Submit"
//                                     : "Next",
//                                 style: const TextStyle(color: Colors.black),
//                               ),
//                               const SizedBox(width: 6),
//                               Icon(
//                                 qp.currentIndex == qp.questions.length - 1
//                                     ? Icons
//                                           .check_circle_outline // ✅ submit icon
//                                     : Icons.arrow_right_alt, // ✅ next arrow
//                                 color: Colors.black,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//
//                       // SizedBox(
//                       //   width: 118,
//                       //   height: 42,
//                       //   child: OutlinedButton(
//                       //     onPressed:
//                       //         (qp.isAnswered(qp.currentIndex) ||
//                       //             qp.skippedIndexes.contains(qp.currentIndex))
//                       //         ? () => qp.nextQuestion()
//                       //         : null, // 🚫 disables if not answered or skipped
//                       //     style: OutlinedButton.styleFrom(
//                       //       side: const BorderSide(
//                       //         color: Color(0xFF8C59FF),
//                       //         width: 1,
//                       //       ),
//                       //       shape: RoundedRectangleBorder(
//                       //         borderRadius: BorderRadius.circular(12),
//                       //       ),
//                       //       padding: EdgeInsets.zero,
//                       //     ),
//                       //     child: const Row(
//                       //       mainAxisAlignment: MainAxisAlignment.center,
//                       //       children: [
//                       //         Text(
//                       //           "Next",
//                       //           style: TextStyle(color: Colors.black),
//                       //         ),
//                       //         SizedBox(width: 6),
//                       //         Icon(Icons.arrow_right_alt, color: Colors.black),
//                       //       ],
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//
//                     // Submit button
//                   ),
//                 ),
//
//                 // Below the Wrap showing skipped indexes
//                 // if (qp.isQuizFinished)
//                 //   ElevatedButton(
//                 //     onPressed: () {
//                 //       qp.submitQuiz(
//                 //         context,
//                 //         attemptId,
//                 //       ); // ✅ pass context + attemptId
//                 //     },
//                 //     child: const Text("Submit Quiz"),
//                 //   ),
//
//                 /// Show Skipped Questions Indexes
//                 if (qp.skippedIndexes.isNotEmpty)
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 20),
//                     child: Wrap(
//                       alignment: WrapAlignment.center,
//                       spacing: 8,
//                       children: qp.skippedIndexes.map((index) {
//                         return CircleAvatar(
//                           radius: 16,
//                           backgroundColor: Color(0xFF8C59FF),
//                           child: Text(
//                             "${index + 1}", // 👈 show MCQ number (1-based)
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mdcat/models/question_model.dart';
import 'package:mdcat/providers/quiz_provider.dart';
import 'package:mdcat/widgets/custom_background.dart';
import 'package:mdcat/widgets/option_tile.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  final String attemptId;
  final List<Question> questions;

  const QuizScreen({
    super.key,
    required this.attemptId,
    required this.questions,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    // ✅ Yahan questions Provider mein set ho rahe hain
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final qp = context.read<QuizProvider>();
      qp.setQuestions(widget.questions); // ✅ FIX
      qp.startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, qp, child) {
        // ✅ Guard — jab tak questions load na hon
        if (qp.questions.isEmpty) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final question = qp.questions[qp.currentIndex];

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                CustomHeader(
                  title: "Demo Test",
                  counterText: "#${qp.currentIndex + 1}/${qp.questions.length}",
                  timerText: qp.timerText,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: qp.progress,
                      color: Colors.orange,
                      backgroundColor: Colors.grey.shade300,
                      minHeight: 6,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade400, width: 1),
                      color: Colors.white,
                    ),
                    child: Text(
                      "${qp.currentIndex + 1}. ${question.text}",
                      style: const TextStyle(
                        fontFamily: "Lexend",
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                        letterSpacing: 0,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Choose Correct Answers",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFD4B1E8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: question.options.length,
                    itemBuilder: (context, i) {
                      return OptionTile(
                        qIndex: qp.currentIndex,
                        index: i,
                        label: question.options[i].label,
                        text: question.options[i].text,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14, bottom: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 118,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: () => qp.skipQuestion(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8C59FF),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Text("Skip"),
                        ),
                      ),
                      SizedBox(
                        width: 118,
                        height: 42,
                        child: OutlinedButton(
                          onPressed: (qp.isAnswered(qp.currentIndex) ||
                              qp.skippedIndexes.contains(qp.currentIndex))
                              ? () {
                            if (qp.currentIndex == qp.questions.length - 1) {
                              qp.submitQuiz(context, widget.attemptId); // ✅ widget.attemptId
                            } else {
                              qp.nextQuestion();
                            }
                          }
                              : null,
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF8C59FF), width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                qp.currentIndex == qp.questions.length - 1
                                    ? "Submit"
                                    : "Next",
                                style: const TextStyle(color: Colors.black),
                              ),
                              const SizedBox(width: 6),
                              Icon(
                                qp.currentIndex == qp.questions.length - 1
                                    ? Icons.check_circle_outline
                                    : Icons.arrow_right_alt,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (qp.skippedIndexes.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      children: qp.skippedIndexes.map((index) {
                        return CircleAvatar(
                          radius: 16,
                          backgroundColor: const Color(0xFF8C59FF),
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}