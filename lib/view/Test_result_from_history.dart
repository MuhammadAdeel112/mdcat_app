// // import 'package:flutter/material.dart';
// // import 'package:mdcat/models/question_model.dart';     // Your question model
// // import 'package:mdcat/models/Test_model.dart';
// // import 'package:mdcat/providers/test_result_provider.dart'; // or QuizProvider
// // import 'package:provider/provider.dart';
// // import 'package:mdcat/view/test_result_screen.dart';
// // import 'package:mdcat/providers/test_result_provider.dart';
// //
// // import '../models/answer_option_model.dart'; // Your existing result screen
// //
// // class TestResultFromHistory extends StatelessWidget {
// //   final List<AnswerDetail> answers;
// //   final String testTitle;
// //
// //   const TestResultFromHistory({
// //     super.key,
// //     required this.answers,
// //     required this.testTitle,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // Convert API data to your Question model
// //     final List<Question> questions = answers.map((answer) {
// //       final List<AnswerOption> options = answer.options.asMap().entries.map((entry) {
// //         int index = entry.key;           // 0,1,2,3
// //         String optionText = entry.value;
// //
// //         return AnswerOption(
// //           text: optionText,
// //           label: (index + 1).toString(),           // "1","2","3","4"
// //           isCorrect: (index + 1) == answer.correctOption,
// //           isSelected: (index + 1) == answer.selectedOption,
// //         );
// //       }).toList();
// //
// //       return Question(
// //         id: answer.questionId,
// //         text: answer.questionText,
// //         options: options,
// //         // Add other fields if your Question model requires them
// //       );
// //     }).toList();
// //
// //     return ChangeNotifierProvider(
// //       create: (_) => TestResultViewModel()..setQuestions(questions),
// //       child: const TestResultScreen(),
// //     );
// //   }
// // }
// // lib/views/test_result_from_history.dart
// // import 'package:flutter/material.dart';
// // import 'package:mdcat/models/question_model.dart';
// // import 'package:mdcat/models/Test_model.dart';
// // import 'package:mdcat/providers/test_result_provider.dart'; // Your provider file
// // import 'package:provider/provider.dart';
// //
// // import '../models/answer_option_model.dart';
// // import '../providers/quiz_provider.dart';
// // import '../view/test_result_screen.dart';   // Adjust path if needed
// //
// // class TestResultFromHistory extends StatelessWidget {
// //   final List<AnswerDetail> answers;
// //   final String testTitle;
// //
// //   const TestResultFromHistory({
// //     super.key,
// //     required this.answers,
// //     required this.testTitle,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // Convert API answers to Question model
// //     final List<Question> questions = answers.map((answer) {
// //       final List<AnswerOption> options = answer.options.asMap().entries.map((entry) {
// //         int index = entry.key;
// //         return AnswerOption(
// //           text: entry.value,
// //           label: (index + 1).toString(),
// //           isCorrect: (index + 1) == answer.correctOption,
// //           isSelected: (index + 1) == answer.selectedOption,
// //         );
// //       }).toList();
// //
// //       return Question(
// //         id: answer.questionId,
// //         text: answer.questionText,
// //         options: options,
// //       );
// //     }).toList();
// //
// //     return ChangeNotifierProvider(
// //       create: (_) => QuizProvider()..setQuestions(questions),   // ← Changed to QuizProvider
// //       child: const TestResultScreen(),
// //     );
// //   }
// // }
// // lib/views/test_result_from_history.dart
// // import 'package:flutter/material.dart';
// // import 'package:mdcat/models/question_model.dart';
// // import 'package:mdcat/models/Test_model.dart';
// // import 'package:mdcat/providers/quiz_provider.dart';
// // import 'package:provider/provider.dart';
// //
// // import 'package:mdcat/view/test_result_screen.dart';
// //
// // import '../models/answer_option_model.dart';  // Make sure path is correct
// //
// // class TestResultFromHistory extends StatelessWidget {
// //   final List<AnswerDetail> answers;
// //   final String testTitle;
// //
// //   const TestResultFromHistory({
// //     super.key,
// //     required this.answers,
// //     required this.testTitle,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final List<Question> questions = answers.map((answer) {
// //       final List<AnswerOption> options = answer.options.asMap().entries.map((e) {
// //         int index = e.key;
// //         return AnswerOption(
// //           text: e.value,
// //           label: (index + 1).toString(),
// //           isCorrect: (index + 1) == answer.correctOption,
// //           isSelected: (index + 1) == answer.selectedOption,
// //         );
// //       }).toList();
// //
// //       return Question(
// //         id: answer.questionId,
// //         text: answer.questionText,
// //         options: options,
// //       );
// //     }).toList();
// //
// //     return ChangeNotifierProvider(
// //       create: (_) {
// //         final provider = QuizProvider();
// //         provider.setQuestions(questions);
// //         provider.markAsReviewMode();   // ← We will add this
// //         return provider;
// //       },
// //       child: const TestResultScreen(),
// //     );
// //   }
// // }
// // lib/views/test_result_from_history.dart
// // import 'package:flutter/material.dart';
// // import 'package:mdcat/models/question_model.dart';
// // import 'package:mdcat/models/Test_model.dart';
// // import 'package:mdcat/providers/quiz_provider.dart';
// // import 'package:provider/provider.dart';
// //
// // import 'package:mdcat/view/test_result_screen.dart';
// //
// // import '../models/answer_option_model.dart';   // Your existing screen
// //
// // class TestResultFromHistory extends StatelessWidget {
// //   final List<AnswerDetail> answers;
// //   final String testTitle;
// //
// //   const TestResultFromHistory({
// //     super.key,
// //     required this.answers,
// //     required this.testTitle,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final List<Question> questions = answers.map((answer) {
// //       final List<AnswerOption> options = answer.options.asMap().entries.map((e) {
// //         int index = e.key;
// //         return AnswerOption(
// //           text: e.value,
// //           label: (index + 1).toString(),
// //           isCorrect: (index + 1) == answer.correctOption,
// //           isSelected: (index + 1) == answer.selectedOption,
// //         );
// //       }).toList();
// //
// //       return Question(
// //         id: answer.questionId,
// //         text: answer.questionText,
// //         options: options,
// //       );
// //     }).toList();
// //
// //     return ChangeNotifierProvider(
// //       create: (_) {
// //         final provider = QuizProvider();
// //         provider.setQuestions(questions);
// //         provider.markAsReviewMode();
// //         return provider;
// //       },
// //       child: const TestResultScreen(),
// //     );
// //   }
// // }
// // lib/views/test_result_from_history.dart
// // import 'package:flutter/material.dart';
// // import 'package:mdcat/models/question_model.dart';
// // import 'package:mdcat/models/Test_model.dart';
// // import 'package:mdcat/providers/quiz_provider.dart';
// // import 'package:mdcat/view/test_result_screen.dart';
// // import 'package:provider/provider.dart';
// //
// // import '../models/Test_model.dart';
// // import '../models/answer_option_model.dart';
// // import 'package:mdcat/view/test_result_screen.dart';
// //
// // class TestResultFromHistory extends StatelessWidget {
// //   final TestAttempt attempt;        // Changed: Passing full attempt
// //   final String testTitle;
// //
// //   const TestResultFromHistory({
// //     super.key,
// //     required this.attempt,
// //     required this.testTitle,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // Convert ONLY this attempt's answers
// //     final List<Question> questions = attempt.answers.map((answer) {
// //       final List<AnswerOption> options = answer.options.asMap().entries.map((e) {
// //         int index = e.key;
// //         return AnswerOption(
// //           text: e.value,
// //           label: (index + 1).toString(),
// //           isCorrect: (index + 1) == answer.correctOption,
// //           isSelected: (index + 1) == answer.selectedOption,
// //         );
// //       }).toList();
// //
// //       return Question(
// //         id: answer.questionId,
// //         text: answer.questionText,
// //         options: options,
// //       );
// //     }).toList();
// //
// //     return ChangeNotifierProvider(
// //       create: (_) {
// //         final provider = QuizProvider();
// //         provider.setQuestions(questions);
// //         provider.markAsReviewMode();     // Important for review mode
// //         return provider;
// //       },
// //       child: const TestResultScreen(),
// //     );
// //   }
// // }
// // lib/views/test_result_from_history.dart
// import 'package:flutter/material.dart';
// import 'package:mdcat/models/question_model.dart';
// import 'package:mdcat/models/Test_model.dart';
// import 'package:mdcat/providers/quiz_provider.dart';
// import 'package:mdcat/view/test_result_screen.dart';
// import 'package:provider/provider.dart';
//
// import '../models/Test_model.dart';
// import '../models/answer_option_model.dart';
// import 'package:mdcat/view/test_result_screen.dart';
//
// class TestResultFromHistory extends StatelessWidget {
//   final TestAttempt attempt;
//   final String testTitle;
//
//   const TestResultFromHistory({
//     super.key,
//     required this.attempt,
//     required this.testTitle,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     print("📝 Opening Review for Attempt ${attempt.attemptNumber} with ${attempt.answers.length} questions");
//
//     final List<Question> questions = attempt.answers.map((answer) {
//       final List<AnswerOption> options = answer.options.asMap().entries.map((e) {
//         int index = e.key;
//         return AnswerOption(
//           text: e.value,
//           label: (index + 1).toString(),
//           isCorrect: (index + 1) == answer.correctOption,
//           isSelected: (index + 1) == answer.selectedOption,
//         );
//       }).toList();
//
//       return Question(
//         id: answer.questionId,
//         text: answer.questionText,
//         options: options,
//       );
//     }).toList();
//
//     return ChangeNotifierProvider(
//       create: (_) {
//         final provider = QuizProvider();
//         provider.setQuestions(questions);
//         provider.markAsReviewMode();        // ← This is critical
//         return provider;
//       },
//       child: const TestResultScreen(),
//     );
//   }
// }