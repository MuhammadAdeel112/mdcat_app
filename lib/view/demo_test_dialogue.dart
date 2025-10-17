// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:mdcat/providers/quiz_provider.dart';
// import 'package:mdcat/view/quiz_screen.dart';

// class DemoTestDialog extends StatelessWidget {
//   const DemoTestDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       title: const Text(
//         "Start Demo Test",
//         style: TextStyle(fontWeight: FontWeight.bold),
//       ),
//       content: const Text(
//         "This demo test will help you understand how the actual test works.",
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context), // Close the dialog
//           child: const Text("Cancel"),
//         ),
//         ElevatedButton(
//           onPressed: () async {
//             // ✅ Store root context before closing this dialog
//             final rootContext = Navigator.of(context).context;

//             Navigator.pop(context); // Close this dialog first

//             // ✅ Now use rootContext to show loading indicator
//             showDialog(
//               context: rootContext,
//               barrierDismissible: false,
//               builder: (_) => const Center(child: CircularProgressIndicator()),
//             );

//             final quizProvider = rootContext.read<QuizProvider>();

//             // Fetch demo test questions (same logic as Mockup Test)
//             final success = await quizProvider.fetchQuestions(
//               subject: "Demo", // specify 'Demo' as subject
//               className: null,
//               level: null,
//             );

//             // ✅ Safely close loading dialog
//             if (rootContext.mounted) Navigator.pop(rootContext);

//             if (success && quizProvider.questions.isNotEmpty) {
//               // ✅ Use rootContext for navigation
//               Navigator.push(
//                 rootContext,
//                 MaterialPageRoute(
//                   builder: (_) => QuizScreen(
//                     attemptId: "demo_${DateTime.now().millisecondsSinceEpoch}",
//                     questions: quizProvider.questions,
//                   ),
//                 ),
//               );
//             } else {
//               ScaffoldMessenger.of(rootContext).showSnackBar(
//                 SnackBar(
//                   content: Text(
//                     quizProvider.errorMessage ??
//                         "Failed to fetch demo questions",
//                   ),
//                 ),
//               );
//             }
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color(0xFF8C59FF),
//           ),
//           child: const Text("Start Your Demo Test"),
//         ),
//       ],
//     );
//   }
// }
