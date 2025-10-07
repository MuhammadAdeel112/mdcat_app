import 'package:flutter/material.dart';
// import 'package:mdcat/view/physics_screen.dart';
import 'package:mdcat/view/quiz_screen.dart';
import 'package:provider/provider.dart';
import 'package:mdcat/providers/attempt_provider.dart';
import 'package:mdcat/providers/quiz_provider.dart';

class StartTestDialog extends StatelessWidget {
  final String testId;
  final String testTitle;
  final int credits;
  final String level;
  final String subject;
  final String className;

  const StartTestDialog({
    super.key,
    required this.testId,
    required this.testTitle,
    required this.credits,
    required this.level,
    required this.subject,
    required this.className,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Text("Start Test"),
      content: Consumer2<AttemptProvider, QuizProvider>(
        builder: (context, attemptProvider, quizProvider, child) {
          // Show loading indicator if API is in progress
          if (attemptProvider.isLoading || quizProvider.isLoading) {
            return SizedBox(
              height: 80,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 12),
                    Text("Preparing your test..."),
                  ],
                ),
              ),
            );
          }

          // Normal content when not loading
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Test: $testTitle",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text("Level: $level"),
              Text("Subject: $subject"),
              Text("Class: $className"),
              Text("Credits Required: $credits"),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        Consumer2<AttemptProvider, QuizProvider>(
          builder: (context, attemptProvider, quizProvider, child) {
            return ElevatedButton(
              onPressed: attemptProvider.isLoading || quizProvider.isLoading
                  ? null
                  : () async {
                      // ✅ Step 1: Fetch questions using filters
                      final fetchSuccess = await quizProvider.fetchQuestions(
                        level,
                        subject,
                        className,
                      );

                      if (!fetchSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              quizProvider.errorMessage ??
                                  "No questions found for this test.",
                            ),
                          ),
                        );
                        return;
                      }

                      // ✅ Step 2: Get dynamic testId from fetched test
                      final testIdFromApi = quizProvider.questions.isNotEmpty
                          ? quizProvider.questions[0].testId
                          : null;

                      // final testIdFromApi = quizProvider.questions.isNotEmpty
                      //     ? quizProvider
                      //           .questions[0]
                      //           .testId // you need to add testId in Question model
                      //     : null;

                      if (testIdFromApi == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Invalid test ID.")),
                        );
                        return;
                      }

                      // ✅ Step 3: Attempt the test
                      final attemptSuccess = await attemptProvider.attemptTest(
                        testIdFromApi,
                      );

                      if (!attemptSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              attemptProvider.errorMessage ??
                                  "Failed to start test. Please try again.",
                            ),
                          ),
                        );
                        return;
                      }

                      // ✅ Step 4: Navigate to QuizScreen
                      if (context.mounted) {
                        Navigator.pop(context); // Close dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              attemptId: attemptProvider.attemptId!,
                              questions: quizProvider.questions,
                            ),
                          ),
                        );
                      }
                    },
              child: const Text("Start"),
            );
          },
        ),
      ],
    );
  }
}
