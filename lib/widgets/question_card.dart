import 'package:flutter/material.dart';
import 'package:mdcat/models/question_model.dart';
import 'package:mdcat/providers/test_result_provider.dart';
import 'package:provider/provider.dart';
// import '../models/question.dart';
// import '../viewmodels/test_result_viewmodel.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TestResultViewModel>(context, listen: false);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question number + text
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "${question.id}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    question.text,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
            const Text(
              "Correct Answers",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Options
            ...question.options.asMap().entries.map((entry) {
              final idx = entry.key;
              final option = entry.value;
              return GestureDetector(
                // onTap: () => vm.selectAnswer(question.id, idx),
                // onTap: () => vm.selectAnswer(question.id.toString(), idx),
                onTap: () => vm.selectAnswer(question.id, idx),

                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _getOptionColor(option),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _getOptionBorder(option),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        option.label,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text(option.text)),
                      if (option.isSelected && option.isCorrect)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                          size: 18,
                        ),
                      if (option.isSelected && !option.isCorrect)
                        const Icon(
                          Icons.close_rounded,
                          color: Colors.red,
                          size: 18,
                        ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Color _getOptionColor(option) {
    if (option.isSelected && option.isCorrect) return Colors.blue.shade100;
    if (option.isSelected && !option.isCorrect) return Colors.red.shade100;
    if (!option.isSelected && option.isCorrect) return Colors.blue.shade50;
    return const Color(0xFFF2F2F5);
  }

  Color _getOptionBorder(option) {
    if (option.isSelected && option.isCorrect) return Colors.blue.shade700;
    if (option.isSelected && !option.isCorrect) return Colors.red.shade700;
    if (!option.isSelected && option.isCorrect) return Colors.blue.shade200;
    return const Color(0xFFE6E6EA);
  }
}
