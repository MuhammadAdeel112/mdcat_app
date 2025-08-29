import 'package:flutter/material.dart';
import 'package:mdcat/providers/quiz_provider.dart';
import 'package:mdcat/widgets/option_tile.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, qp, child) {
        final question = qp.questions[qp.currentIndex];
        final total = qp.questions.length;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                /// Header
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.black87,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "Demo Test",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.more_vert, color: Colors.transparent),
                    ],
                  ),
                ),

                /// Progress info
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "# ${qp.currentIndex + 1} ",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                              text: "/ $total",
                              style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "1 hour 15 min",
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: LinearProgressIndicator(
                    value: qp.progress(),
                    color: Colors.orange,
                    backgroundColor: Colors.grey.shade200,
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 16),

                /// Question text
                // Question Box
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 8,
                  ),
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
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //   child: Text(
                //     "${qp.currentIndex + 1}. ${question.text}",
                //     style: const TextStyle(
                //       fontSize: 15,
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                // ),
                const SizedBox(height: 16),

                /// Section Title
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 8,
                  ),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Choose Correct Answers",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(
                          255,
                          221,
                          169,
                          252,
                        ), // 👈 solid color
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// Options
                //
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: question.options.length,
                    itemBuilder: (context, i) {
                      return OptionTile(
                        qIndex: qp.currentIndex,
                        index: i,
                        label: "${String.fromCharCode(65 + i)}.",
                        text: question.options[i],
                      );
                    },
                  ),
                ),

                /// Show answers link
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 8,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Show Answers",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),

                /// Bottom Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => qp.skipQuestion(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text("Skip"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => qp.nextQuestion(),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.purple),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(color: Colors.purple),
                              ),
                              SizedBox(width: 6),
                              Icon(Icons.arrow_right_alt, color: Colors.purple),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Container(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 20,
                //     vertical: 12,
                //   ),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.black12,
                //         blurRadius: 4,
                //         offset: Offset(0, -2),
                //       ),
                //     ],
                //   ),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: ElevatedButton(
                //           onPressed: () => qp.skipQuestion(),
                //           style: ElevatedButton.styleFrom(
                //             backgroundColor: Colors.purple,
                //             foregroundColor: Colors.white,
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8),
                //             ),
                //             padding: const EdgeInsets.symmetric(vertical: 14),
                //           ),
                //           child: const Text("Skip"),
                //         ),
                //       ),
                //       const SizedBox(width: 12),
                //       Expanded(
                //         child: OutlinedButton(
                //           onPressed: () => qp.nextQuestion(),
                //           style: OutlinedButton.styleFrom(
                //             side: const BorderSide(color: Colors.purple),
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8),
                //             ),
                //             padding: const EdgeInsets.symmetric(vertical: 14),
                //           ),
                //           child: const Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text(
                //                 "Next",
                //                 style: TextStyle(color: Colors.purple),
                //               ),
                //               SizedBox(width: 6),
                //               Icon(Icons.arrow_right_alt, color: Colors.purple),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
