// import 'package:flutter/material.dart';
// import 'package:mdcat/providers/test_result_provider.dart';
// import 'package:provider/provider.dart';
// // import '../viewmodels/test_result_viewmodel.dart';
// import '../widgets/question_card.dart';

// class TestResultPage extends StatelessWidget {
//   const TestResultPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = Provider.of<TestResultViewModel>(context);

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.purple.shade100,
//         title: const Text("Test Result", style: TextStyle(color: Colors.black)),
//         centerTitle: true,
//       ),

//       //       body: ListView.builder(
//       //   padding: const EdgeInsets.all(12),
//       //   itemCount: viewModel.questions.length,
//       //   itemBuilder: (context, index) {
//       //     final question = viewModel.questions[index];
//       //     return QuestionCard(question: question);
//       //   },
//       // ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(12),
//         itemCount: viewModel.questions.length,
//         itemBuilder: (context, index) {
//           return QuestionCard(question: viewModel.questions[index]);
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:mdcat/providers/test_result_provider.dart';
// import 'package:mdcat/widgets/custom_background.dart';
// import 'package:provider/provider.dart';
// // import '../viewmodels/test_result_viewmodel.dart';
// import '../widgets/question_card.dart';

// class TestResultPage extends StatelessWidget {
//   const TestResultPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<TestResultViewModel>(context);

//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Gradient Header
//             CustomHeader(
//               title: "Test Result",
//               counterText: "#70/45",
//               timerText: "Level 1",
//             ),

//             // Score Row
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//               child: Row(
//                 children: [
//                   Text(
//                     "# ${vm.correctCount} / ${vm.totalQuestions}",
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                   ),
//                   const Spacer(),
//                   const Text(
//                     "Level 1",
//                     style: TextStyle(color: Colors.black54, fontSize: 14),
//                   ),
//                 ],
//               ),
//             ),

//             // Questions List
//             Expanded(
//               child: ListView.builder(
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 itemCount: vm.questions.length,
//                 itemBuilder: (context, index) {
//                   final question = vm.questions[index];
//                   return QuestionCard(question: question);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
// import 'package:mdcat/models/answer_option_model.dart';
// import 'package:mdcat/models/answer_option_model.dart';
import 'package:mdcat/widgets/Result_optiontile.dart';
import 'package:provider/provider.dart';
import '../providers/test_result_provider.dart';
import '../widgets/custom_background.dart';

class TestResultScreen extends StatelessWidget {
  const TestResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TestResultViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                /// Purple Gradient Header
                CustomHeader(
                  title: "Test Result",
                  counterText: "# ${vm.questions.length}", // total questions
                  timerText:
                      "Level 1", // 👈 You can replace with time if needed
                ),

                const SizedBox(height: 12),

                const SizedBox(height: 16),

                /// Result Questions List
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: vm.questions.length,
                    itemBuilder: (context, qIndex) {
                      final question = vm.questions[qIndex];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Question Card
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
                                letterSpacing: 0,
                                color: Colors.black87,
                              ),
                            ),
                          ),

                          /// Section Title
                          const Padding(
                            padding: EdgeInsets.only(left: 4.0, bottom: 6),
                            child: Text(
                              "Correct Answers",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFD4B1E8),
                              ),
                            ),
                          ),

                          /// Options (with result coloring)
                          Column(
                            children: List.generate(4, (i) {
                              final option = question.options[i];
                              return ResultOptionTile(option: option, index: i);
                            }),
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
      },
    );
  }
}
