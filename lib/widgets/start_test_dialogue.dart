import 'package:flutter/material.dart';
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
  final bool isFree;

  const StartTestDialog({
    super.key,
    required this.testId,
    required this.testTitle,
    required this.credits,
    required this.level,
    required this.subject,
    required this.className,
    this.isFree = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Text("Start Test"),
      content: Consumer2<AttemptProvider, QuizProvider>(
        builder: (context, attemptProvider, quizProvider, child) {
          if (attemptProvider.isLoading || quizProvider.isLoading) {
            return const SizedBox(
              height: 80,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 12),
                    Text("Preparing your test..."),
                  ],
                ),
              ),
            );
          }

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
              Text(isFree ? "Free Test ✅" : "Credits Required: $credits"),
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
                      // ✅ Step 1: Attempt FIRST — this purchases/unlocks the test
                      final attemptSuccess =
                          await attemptProvider.attemptTest(testId);

                      if (!attemptSuccess) {
                        debugPrint(
                          "⚠️ AttemptTest failed: ${attemptProvider.errorMessage}",
                        );

                        if (!isFree) {
                          // ❌ Paid test: show error and stop
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  attemptProvider.errorMessage ??
                                      "Failed to start test. Please try again.",
                                ),
                              ),
                            );
                          }
                          return;
                        }
                        // ✅ Free test: continue even if attempt fails
                        debugPrint(
                          "✅ Free test — bypassing attempt failure",
                        );
                      }

                      // ✅ Step 2: Fetch questions — pass attemptId to prove test is purchased
                      final fetchSuccess =
                          await quizProvider.fetchQuestionsByTestId(
                        testId,
                        attemptId: attemptProvider.attemptId,
                      );

                      if (!fetchSuccess) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                quizProvider.errorMessage ??
                                    "No questions found for this test.",
                              ),
                            ),
                          );
                        }
                        return;
                      }

                      // ✅ Step 3: Navigate to QuizScreen
                      if (context.mounted) {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              attemptId: attemptProvider.attemptId ?? "",
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
