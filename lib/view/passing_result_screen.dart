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
  // final String level;
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

          const SizedBox(height: 24),
          Text(
            isPassed ? "Congratulation! 🎉" : "Whoops, sorry 😞",
            style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 7),

          // Circular Progress
          GradientCircularProgress(percent: percentage),

          const SizedBox(height: 10),
          Text(
            isPassed ? "Mcqs Passed 👏" : "Mcqs Failed ❌",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),

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
                          builder: (_) => TestResultScreen(
                            // level: quizProvider.selectedLevel, // ✅ Pass the level dynamically
                          ),
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
