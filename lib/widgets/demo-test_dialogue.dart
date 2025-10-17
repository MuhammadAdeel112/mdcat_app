import 'package:flutter/material.dart';
import 'package:mdcat/providers/class_selection_provider.dart';
import 'package:mdcat/providers/quiz_provider.dart';
import 'package:mdcat/view/quiz_screen.dart';
import 'package:provider/provider.dart';
// import 'package:mdcat/view/demo_quizscreen.dart';
// import 'package:mdcat/view/quiz_screen.dart';

class DemoTestDialog extends StatelessWidget {
  const DemoTestDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Cross Icon at top right
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(top: 8, right: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFFCCCCCC), width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.close, size: 16, color: Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Title
            const Text(
              "Demo Test",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // Description
            const Text(
              "Lorem ipsum dolor sit amet consectetur. Quam varius tortor aliquam habitant.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),

            const SizedBox(height: 20),

            // Button
            // Button with gradient background
            SizedBox(
              width: 200,
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8C59FF), Color(0xFF492699)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    final quizProvider = context.read<QuizProvider>();
                    final className = context
                        .read<ClassSelectionProvider>()
                        .selectedClass;
                    final subject =
                        "Demo Test"; // or whatever identifier you want
                    final level = null;

                    // Show loading dialog
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) =>
                          const Center(child: CircularProgressIndicator()),
                    );

                    // Fetch questions
                    final success = await quizProvider.fetchQuestions(
                      subject: subject,
                      className: className,
                      level: level,
                    );

                    Navigator.pop(context); // close loading dialog

                    if (success) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuizScreen(
                            attemptId:
                                "demo_${DateTime.now().millisecondsSinceEpoch}",
                            questions: quizProvider.questions,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            quizProvider.errorMessage ??
                                "Failed to fetch questions",
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Start your Demo Test",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
