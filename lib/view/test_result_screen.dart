import 'package:flutter/material.dart';
import 'package:mdcat/models/answer_option_model.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/custom_background.dart';
import '../widgets/Result_optiontile.dart';

class TestResultScreen extends StatefulWidget {
  const TestResultScreen({super.key});

  @override
  State<TestResultScreen> createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.watch<QuizProvider>();

    final question = quizProvider.questions[currentIndex];
    final selectedLabel =
        quizProvider.selectedOptions[currentIndex]; // user choice
    final correctLabel =
        quizProvider.correctAnswers[currentIndex]; // correct choice

    // Prepare updated options with flags
    final updatedOptions = question.options.map((opt) {
      return AnswerOption(
        text: opt.text,
        label: opt.label,
        isCorrect: opt.label == correctLabel,
        isSelected: opt.label == selectedLabel,
      );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            CustomHeader(
              title: "Test Result",
              counterText:
                  "#${currentIndex + 1}/${quizProvider.questions.length}",
              timerText: "Level 1",
            ),

            const SizedBox(height: 12),

            // Question
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade400, width: 1),
                color: Colors.white,
              ),
              child: Text(
                "${currentIndex + 1}. ${question.text}",
                style: const TextStyle(
                  fontFamily: "Lexend",
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 5),

            // "Correct Answer" label
            // ✅ Correct Answer label aligned to left
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 12.0,
                  bottom: 8.0,
                ),
                child: Text(
                  "Correct Answers:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC99EE4),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 6),

            // Options
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: List.generate(
                  updatedOptions.length,
                  (i) => ResultOptionTile(option: updatedOptions[i], index: i),
                ),
              ),
            ),

            // Navigation buttons
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 116,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Previous Button
                  ElevatedButton(
                    onPressed: currentIndex > 0
                        ? () {
                            setState(() {
                              currentIndex--;
                            });
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8C59FF),
                      // Change as needed
                      foregroundColor: Colors.white, // Text color
                      fixedSize: const Size(
                        110,
                        50,
                      ), // Same size for both buttons
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Previous"),
                  ),

                  // Next Button
                  ElevatedButton(
                    onPressed: currentIndex < quizProvider.questions.length - 1
                        ? () {
                            setState(() {
                              currentIndex++;
                            });
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Change as needed
                      foregroundColor: Colors.black, // Text color
                      fixedSize: const Size(110, 50), // Same size
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: Color(0xFF8C59FF), // Border color
                          width: 1,
                        ),
                      ),
                    ),
                    child: const Text("Next"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
