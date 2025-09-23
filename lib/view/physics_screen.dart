import 'package:flutter/material.dart';
import 'package:mdcat/providers/quiz_provider.dart';
import 'package:mdcat/widgets/custom_background.dart';
import 'package:mdcat/widgets/option_tile.dart';
import 'package:provider/provider.dart';

class PhysicsScreen extends StatelessWidget {
  const PhysicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, qp, child) {
        final question = qp.questions[qp.currentIndex];
        // final total = qp.questions.length;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                /// Purple Gradient Header
                CustomHeader(
                  title: "Physics",
                  counterText: "#1/70",
                  timerText: "Level 1",
                ),

                // const SizedBox(height: 16),
                const SizedBox(height: 12),
                // Add this just above LinearProgressIndicator
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Pause",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          final qp = context.read<QuizProvider>();
                          qp.pauseQuiz();

                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              title: Row(
                                children: [
                                  const Text(
                                    "Quiz Paused",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                      ); // close the dialog
                                    },
                                  ),
                                ],
                              ),
                              content: const Text(
                                "Your quiz is paused. Click Resume to continue.",
                                style: TextStyle(fontSize: 16),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    qp.resumeQuiz();
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Resume"),
                                ),
                              ],
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.orange,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                        ),
                        child: const Text(
                          "Pause",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width:
                      MediaQuery.of(context).size.width *
                      0.85, // 👈 85% of screen width
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.2, // qp.progress()
                      color: Colors.orange,
                      backgroundColor: Colors.grey.shade300,
                      minHeight: 6,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                /// Question Box
                /// Question Box
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
                        fontFamily: "Lexend", // 👈 applied only here
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

                /// Section Title
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

                /// Options
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: question.options.length,
                    itemBuilder: (context, i) {
                      return OptionTile(
                        qIndex: qp.currentIndex,
                        index: i,
                        label: question.options[i].label, // A, B, C, D
                        text: question.options[i].text, // actual option text
                      );
                    },
                  ),
                ),

                /// Bottom Buttons (Left & Right)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 14,
                    right: 14,
                    bottom: 100,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 118,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: () => qp.skipQuestion(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF8C59FF),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // 👈 12px radius
                            ),
                            padding:
                                EdgeInsets.zero, // 👈 removes default padding
                          ),
                          child: const Text("Skip"),
                        ),
                      ),
                      SizedBox(
                        width: 118,
                        height: 42,
                        child: OutlinedButton(
                          onPressed: () => qp.nextQuestion(),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xFF8C59FF),
                              width: 1,
                            ), // 👈 border width
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // 👈 12px radius
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(width: 6),
                              Icon(Icons.arrow_right_alt, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Show Skipped Questions Indexes
                if (qp.skippedIndexes.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      children: qp.skippedIndexes.map((index) {
                        return CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xFF8C59FF),
                          child: Text(
                            "${index + 1}", // 👈 show MCQ number (1-based)
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
