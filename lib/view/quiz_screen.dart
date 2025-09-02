import 'package:flutter/material.dart';
import 'package:mdcat/providers/quiz_provider.dart';
import 'package:mdcat/widgets/custom_background.dart';
import 'package:mdcat/widgets/option_tile.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

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
                  title: "Demo Test",
                  counterText: "1/70",
                  timerText: "1 hour 15 min",
                ),

                // Container(
                //   width: double.infinity,
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 30,
                //     vertical: 30,
                //   ),
                //   decoration: BoxDecoration(
                //     image: const DecorationImage(
                //       image: AssetImage(
                //         "assets/images/demo background.png",
                //       ), // 👈 your gradient image
                //       fit: BoxFit.cover,
                //     ),
                //     borderRadius: const BorderRadius.only(
                //       bottomLeft: Radius.circular(16),
                //       bottomRight: Radius.circular(16),
                //     ),
                //   ),
                //   child: Column(
                //     children: [
                //       Row(
                //         children: [
                //           InkWell(
                //             onTap: () => Navigator.of(context).pop(),
                //             child: const Icon(
                //               Icons.arrow_back,
                //               size: 20,
                //               color: Colors.white,
                //             ),
                //           ),

                //           const Spacer(),
                //           const Text(
                //             "Demo Test",
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.w600,
                //               color: Colors.black,
                //             ),
                //           ),
                //           const Spacer(),
                //           const Icon(
                //             Icons.more_vert,
                //             color: Colors.transparent,
                //           ),
                //         ],
                //       ),
                //       const SizedBox(height: 12),
                //       Container(
                //         height: 40, // adjust depending on your header height
                //         width: double.infinity,
                //         child: Stack(
                //           children: [
                //             /// Question Progress (#1/70) - bottom center
                //             ///
                //             Align(
                //               alignment: Alignment.bottomCenter,
                //               child: Text(
                //                 qp.counterText, // 👈 dynamic counter
                //                 style: const TextStyle(
                //                   fontSize: 15,
                //                   fontWeight: FontWeight.w600,
                //                   color: Colors.black,
                //                 ),
                //               ),
                //             ),

                //             /// Timer - bottom right
                //             Align(
                //               alignment: Alignment.bottomRight,
                //               child: Row(
                //                 mainAxisSize: MainAxisSize.min,
                //                 children: const [
                //                   Icon(
                //                     Icons.access_time,
                //                     size: 16,
                //                     color: Colors.black,
                //                   ),
                //                   SizedBox(width: 4),
                //                   Text(
                //                     "1 hour 15 min",
                //                     style: TextStyle(
                //                       color: Colors.black,
                //                       fontSize: 13,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),

                //     ],
                //   ),
                // ),

                // const SizedBox(height: 16),
                const SizedBox(height: 12),
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
                        label: "${String.fromCharCode(65 + i)}.",
                        text: question.options[i],
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
              ],
            ),
          ),
        );
      },
    );
  }
}
