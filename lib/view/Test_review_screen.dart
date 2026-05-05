// lib/views/test_review_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdcat/models/Test_model.dart';
import 'package:mdcat/widgets/custom_background.dart';
import 'package:mdcat/widgets/Result_optiontile.dart';

import '../models/Test_model.dart';
import '../models/answer_option_model.dart';   // Your existing good widget

class TestReviewScreen extends StatelessWidget {
  final TestAttempt attempt;
  final String testTitle;

  const TestReviewScreen({
    super.key,
    required this.attempt,
    required this.testTitle,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMM yyyy • hh:mm a').format(attempt.startedAt);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomHeader(
            title: testTitle,
            counterText: "Attempt ${attempt.attemptNumber}",
            onBack: () => Navigator.pop(context),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Score: ${attempt.score}/${attempt.answers.length}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: attempt.answers.length,
              itemBuilder: (context, index) {
                final answer = attempt.answers[index];

                return QuestionReviewCard(answer: answer, questionNumber: index + 1);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// New Widget for Single Question Review
class QuestionReviewCard extends StatelessWidget {
  final AnswerDetail answer;
  final int questionNumber;

  const QuestionReviewCard({
    super.key,
    required this.answer,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8C59FF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Q$questionNumber",
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF8C59FF)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    answer.questionText,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Options using your ResultOptionTile
            ...answer.options.asMap().entries.map((entry) {
              int idx = entry.key;
              String optionText = entry.value;

              final option = AnswerOption(
                text: optionText,
                label: (idx + 1).toString(),
                isCorrect: (idx + 1) == answer.correctOption,
                isSelected: (idx + 1) == answer.selectedOption,
              );

              return ResultOptionTile(option: option, index: idx);
            }),
          ],
        ),
      ),
    );
  }
}