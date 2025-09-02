import 'package:flutter/material.dart';
import 'package:mdcat/widgets/custom_background.dart';
import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';

class ScoreHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> scoreData = [
    {
      "subject": "Math",
      "date": "22 June 2025",
      "score": "70 out of 45",
      "status": "Continue",
    },
    {
      "subject": "Math",
      "date": "22 June 2025",
      "score": "70 out of 45",
      "status": "See Result",
    },
    {
      "subject": "Math",
      "date": "22 June 2025",
      "score": "70 out of 45",
      "status": "See Result",
    },
    {
      "subject": "Math",
      "date": "22 June 2025",
      "score": "70 out of 45",
      "status": "See Result",
    },
    {
      "subject": "Math",
      "date": "22 June 2025",
      "score": "70 out of 45",
      "status": "See Result",
    },
    {
      "subject": "Math",
      "date": "22 June 2025",
      "score": "70 out of 45",
      "status": "See Result",
    },
  ];

  ScoreHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const AppBottomNav(currentIndex: 2),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gradient AppBar
          CustomHeader(
            title: "Your Score History",

            counterText: "", // 👈 empty text, so nothing will appear
          ),

          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "History",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),

          // List of scores
          Expanded(
            child: ListView.builder(
              itemCount: scoreData.length,
              itemBuilder: (context, index) {
                final data = scoreData[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left side text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data["subject"]!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            data["score"]!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      // Right side date + button
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            data["date"]!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF8C59FF),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              data["status"]!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
