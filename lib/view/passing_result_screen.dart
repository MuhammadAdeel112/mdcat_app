import 'package:flutter/material.dart';
import 'package:mdcat/providers/passing_result_provider.dart';
import 'package:mdcat/widgets/circle_gradient.dart';
import 'package:mdcat/widgets/custom_background.dart';
import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final result = context.watch<ResultProvider>().result;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),

      body: Column(
        children: [
          CustomHeader(title: "Physics ", counterText: "#1/70"),

          const SizedBox(height: 15),

          // 🔹 LinearProgressIndicator with rounded corners
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Rounded corners
              child: LinearProgressIndicator(
                value: result.percentage / 100, // percentage progress
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFFFF5A29), // 🔸 your #FF5A29 color
                ),
                minHeight: 8, // a bit thicker
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text(
            "Congratulation!  🎉",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 7),
          // _buildCircularProgress(result.percentage),
          GradientCircularProgress(percent: 85),

          const SizedBox(height: 10),
          const Text(
            "Mcqs Passed 👏",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 15),
          Text(
            "${result.correctAnswers}/${result.totalQuestions}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Text(
            "You have Pass the Test",
            style: TextStyle(
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
                  width: 235, // fixed width
                  height: 47, // fixed height
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8C59FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ), // updated radius
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Start New Test",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: 235, // fixed width
                  height: 47, // fixed height
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ), // updated radius
                      ),
                      side: const BorderSide(color: Color(0xFF8C59FF)),
                    ),
                    onPressed: () {},
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

  // Widget _buildCircularProgress(double percent) {
  //   return SizedBox(
  //     height: 220, // bigger container
  //     width: 220,
  //     child: Stack(
  //       alignment: Alignment.center,
  //       children: [
  //         Transform.scale(
  //           scale: 3.7, // enlarge circle
  //           child: CircularProgressIndicator(
  //             value: percent / 100,
  //             strokeWidth: 8, // thicker ring
  //             backgroundColor: Color(0x2EB158FF),
  //             valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8C59FF)),
  //           ),
  //         ),
  //         Text(
  //           "${percent.toStringAsFixed(0)}%",
  //           style: const TextStyle(
  //             fontSize: 22, // make percentage text bigger too
  //             fontWeight: FontWeight.bold,
  //             color: Colors.black,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
