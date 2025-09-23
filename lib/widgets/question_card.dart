// import 'package:flutter/material.dart';
// import 'package:mdcat/providers/quiz_provider.dart';
// import 'package:mdcat/providers/test_result_provider.dart';
// import 'package:provider/provider.dart';
// // import '../models/question.dart';
// // import '../viewmodels/test_result_viewmodel.dart';

// class QuestionCard extends StatelessWidget {
//   final Question question;

//   const QuestionCard({super.key, required this.question});

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = Provider.of<TestResultViewModel>(context, listen: false);

//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("${question.id}. ${question.text}",
//                 style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
//             const SizedBox(height: 10),
//             const Text("Correct Answers",
//                 style: TextStyle(fontSize: 12, color: Colors.purple)),
//             const SizedBox(height: 6),
//             ...List.generate(question.options.length, (index) {
//               final option = question.options[index];
//               final isCorrect = option.isCorrect;
//               final isSelected = option.isSelected;

//               Color? tileColor;
//               if (isSelected && isCorrect) {
//                 tileColor = Colors.blue.shade100; // selected correct
//               } else if (isSelected && !isCorrect) {
//                 tileColor = Colors.red.shade100; // wrong selected
//               } else {
//                 tileColor = Colors.grey.shade200; // default
//               }

//               return GestureDetector(
//                 onTap: () => viewModel.selectAnswer(question.id, index),
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(vertical: 4),
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: tileColor,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Text(option.text, style: const TextStyle(fontSize: 14)),
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:mdcat/models/question_model.dart';
// // import '../models/question.dart';

// class QuestionCard extends StatelessWidget {
//   final Question question;

//   const QuestionCard({super.key, required this.question});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               question.text,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 10),
//             ...question.options.map((option) {
//               return Container(
//                 margin: const EdgeInsets.symmetric(vertical: 4),
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: option.isSelected
//                       ? (option.isCorrect ? Colors.green[100] : Colors.red[100])
//                       : Colors.grey[200],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(option.text),
//               );
//             }).toList(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: unnecessary_cast

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
                onTap: () => vm.selectAnswer(question.id as int, idx),

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
