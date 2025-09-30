// import 'package:flutter/material.dart';
// // import 'package:mdcat/models/answer_option_model.dart';
// // import 'package:mdcat/models/answer_option_model.dart';
// import 'package:mdcat/widgets/Result_optiontile.dart';
// import 'package:provider/provider.dart';
// import '../providers/test_result_provider.dart';
// import '../widgets/custom_background.dart';

// class TestResultScreen extends StatelessWidget {
//   const TestResultScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TestResultViewModel>(
//       builder: (context, vm, child) {
//         return Scaffold(
//           backgroundColor: Colors.white,
//           body: SafeArea(
//             child: Column(
//               children: [
//                 /// Purple Gradient Header
//                 CustomHeader(
//                   title: "Test Result",
//                   counterText: "# ${vm.questions.length}", // total questions
//                   timerText:
//                       "Level 1", // 👈 You can replace with time if needed
//                 ),

//                 const SizedBox(height: 12),

//                 const SizedBox(height: 16),

//                 /// Result Questions List
//                 Expanded(
//                   child: ListView.builder(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     itemCount: vm.questions.length,
//                     itemBuilder: (context, qIndex) {
//                       final question = vm.questions[qIndex];
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           /// Question Card
//                           Container(
//                             width: double.infinity,
//                             padding: const EdgeInsets.all(14),
//                             margin: const EdgeInsets.only(bottom: 10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               border: Border.all(
//                                 color: Colors.grey.shade400,
//                                 width: 1,
//                               ),
//                               color: Colors.white,
//                             ),
//                             child: Text(
//                               "${qIndex + 1}. ${question.text}",
//                               style: const TextStyle(
//                                 fontFamily: "Lexend",
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w400,
//                                 height: 1.0,
//                                 letterSpacing: 0,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                           ),

//                           /// Section Title
//                           const Padding(
//                             padding: EdgeInsets.only(left: 4.0, bottom: 6),
//                             child: Text(
//                               "Correct Answers",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xFFD4B1E8),
//                               ),
//                             ),
//                           ),

//                           /// Options (with result coloring)
//                           Column(
//                             children: List.generate(4, (i) {
//                               final option = question.options[i];
//                               return ResultOptionTile(option: option, index: i);
//                             }),
//                           ),

//                           const SizedBox(height: 16),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mdcat/models/answer_option_model.dart';
// import 'package:mdcat/providers/test_result_provider.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/custom_background.dart';
import '../widgets/Result_optiontile.dart';

class TestResultScreen extends StatelessWidget {
  // final String level;
  const TestResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.watch<QuizProvider>();
    //  final vm = context.watch<TestResultViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              title: "Test Result",
              counterText: "#${quizProvider.questions.length}",
              timerText: "level 1",
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: quizProvider.questions.length,
                itemBuilder: (context, qIndex) {
                  final question = quizProvider.questions[qIndex];
                  final selectedLabel =
                      quizProvider.selectedOptions[qIndex]; // string label
                  final correctLabel =
                      quizProvider.correctAnswers[qIndex]; // string label

                  // Create a temporary copy of options with correct isSelected flags
                  final updatedOptions = question.options.map((opt) {
                    return AnswerOption(
                      text: opt.text,
                      label: opt.label,
                      isCorrect: opt.label == correctLabel,
                      isSelected: opt.label == selectedLabel,
                    );
                  }).toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Question Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1,
                          ),
                          color: Colors.white,
                        ),
                        child: Text(
                          "${qIndex + 1}. ${question.text}",
                          style: const TextStyle(
                            fontFamily: "Lexend",
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            height: 1.0,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      // Options
                      Column(
                        children: List.generate(
                          updatedOptions.length,
                          (i) => ResultOptionTile(
                            option: updatedOptions[i],
                            index: i,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
