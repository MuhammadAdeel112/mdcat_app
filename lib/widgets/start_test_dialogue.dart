// import 'package:flutter/material.dart';

// class StartTestDialog extends StatelessWidget {
//   final String testTitle;
//   final int credits;
//   final String testId;
//   final VoidCallback onConfirm;

//   const StartTestDialog({
//     super.key,
//     required this.testId,
//     required this.onConfirm,
//     required this.testTitle,
//     required this.credits,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Close button
//             Align(
//               alignment: Alignment.topRight,
//               child: GestureDetector(
//                 onTap: () => Navigator.of(context).pop(false), // cancel
//                 child: Container(
//                   width: 28,
//                   height: 28,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF2F2F2),
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.grey.shade400),
//                   ),
//                   child: const Icon(Icons.close, size: 18, color: Colors.black),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 8),

//             // Title
//             const Text(
//               "Do you really want to start this test?",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),

//             const SizedBox(height: 12),

//             // Details
//             Text(
//               "$testTitle will take $credits credits.",
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 14, color: Colors.black87),
//             ),

//             const SizedBox(height: 24),

//             // Start Test Button
//             // Start Test Button
//             Container(
//               width: 160,
//               height: 44,
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xFF8C59FF), Color(0xFF492699)],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TextButton(
//                 onPressed: () {
//                   onConfirm(); // ✅ run your start test logic
//                   Navigator.of(context).pop(true); // ✅ close dialog after
//                 },
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 child: const Text(
//                   "Start Test",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),

//             // Container(
//             //   width: 160,
//             //   height: 44,
//             //   decoration: BoxDecoration(
//             //     gradient: const LinearGradient(
//             //       colors: [Color(0xFF8C59FF), Color(0xFF492699)],
//             //       begin: Alignment.topCenter,
//             //       end: Alignment.bottomCenter,
//             //     ),
//             //     borderRadius: BorderRadius.circular(10),
//             //   ),
//             //   child: TextButton(
//             //     onPressed: () => Navigator.of(context).pop(true), // confirm
//             //     style: TextButton.styleFrom(
//             //       backgroundColor: Colors.transparent,
//             //       shadowColor: Colors.transparent,
//             //     ),
//             //     child: const Text(
//             //       "Start Test",
//             //       style: TextStyle(
//             //         color: Colors.white,
//             //         fontSize: 15,
//             //         fontWeight: FontWeight.bold,
//             //       ),
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/attempt_provider.dart';
// import '../providers/quiz_provider.dart';
// import '../providers/class_selection_provider.dart';
// import '../providers/subject_provider.dart';
// import '../view/quiz_screen.dart';

// class StartTestDialog extends StatelessWidget {
//   final String testTitle;
//   final int credits;
//   final String testId;
//   final String level;

//   const StartTestDialog({
//     super.key,
//     required this.testId,
//     required this.testTitle,
//     required this.credits,
//     required this.level,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Close button
//             Align(
//               alignment: Alignment.topRight,
//               child: GestureDetector(
//                 onTap: () => Navigator.of(context).pop(), // just close
//                 child: Container(
//                   width: 28,
//                   height: 28,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF2F2F2),
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.grey.shade400),
//                   ),
//                   child: const Icon(Icons.close, size: 18, color: Colors.black),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               "Do you really want to start this test?",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//             Text(
//               "$testTitle will take $credits credits.",
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 14, color: Colors.black87),
//             ),
//             const SizedBox(height: 24),

//             // Start Test Button
//             Container(
//               width: 160,
//               height: 44,
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xFF8C59FF), Color(0xFF492699)],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TextButton(
//                 onPressed: () async {
//                   final subject = context
//                       .read<SubjectProvider>()
//                       .selectedSubject;
//                   final className = context
//                       .read<ClassSelectionProvider>()
//                       .selectedClass;

//                   if (subject == null || className == null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text("Please select subject and class first"),
//                       ),
//                     );
//                     return;
//                   }

//                   // Step 1: Start Attempt API
//                   final attemptProvider = context.read<AttemptProvider>();
//                   final success = await attemptProvider.startAttempt(testId);

//                   if (!success) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                           attemptProvider.errorMessage ??
//                               "Failed to start attempt",
//                         ),
//                       ),
//                     );
//                     return;
//                   }

//                   // Step 2: Fetch Questions API
//                   final quizProvider = context.read<QuizProvider>();
//                   final gotQuestions = await quizProvider.fetchQuestions(
//                     subject,
//                     className,
//                     level, // or level, depending on what you passed into the dialog
//                   );

//                   if (!gotQuestions) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                           quizProvider.errorMessage ?? "No test found",
//                         ),
//                       ),
//                     );
//                     return;
//                   }

//                   // Step 3: Navigate to Quiz Screen with attemptId + questions
//                   Navigator.of(context).pop();
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => QuizScreen(
//                         attemptId: attemptProvider.attemptId!,
//                         questions: quizProvider.questions,
//                       ),
//                     ),
//                   );
//                 },

//                 //                 onPressed: () async {
//                 //                   // ✅ Step 1: get selected subject and class
//                 //                   final subject = context
//                 //                       .read<SubjectProvider>()
//                 //                       .selectedSubject;
//                 //                   final className = context
//                 //                       .read<ClassSelectionProvider>()
//                 //                       .selectedClass;

//                 //                   if (subject == null || className == null) {
//                 //                     ScaffoldMessenger.of(context).showSnackBar(
//                 //                       const SnackBar(
//                 //                         content: Text("Please select subject and class first"),
//                 //                       ),
//                 //                     );
//                 //                     return;
//                 //                   }

//                 //                   // ✅ Step 2: call startAttempt API
//                 //                   final attemptProvider = context.read<AttemptProvider>();
//                 //                   final success = await attemptProvider.startAttempt(testId);

//                 //                   if (!success) {
//                 //                     ScaffoldMessenger.of(context).showSnackBar(
//                 //                       SnackBar(
//                 //                         content: Text(
//                 //                           attemptProvider.errorMessage ??
//                 //                               "Failed to start attempt",
//                 //                         ),
//                 //                       ),
//                 //                     );
//                 //                     return;
//                 //                   }

//                 //                   // ✅ Step 3: fetch questions
//                 //                   final quizProvider = context.read<QuizProvider>();
//                 //                   final gotQuestions = await quizProvider.fetchQuestions(testId);

//                 //                   // final gotQuestions = await quizProvider.fetchQuestions(
//                 //                   //   subject,
//                 //                   //   className,
//                 //                   //   testTitle,
//                 //                   // );

//                 //                   if (!gotQuestions) {
//                 //                     ScaffoldMessenger.of(context).showSnackBar(
//                 //                       SnackBar(
//                 //                         content: Text(
//                 //                           quizProvider.errorMessage ?? "No test found",
//                 //                         ),
//                 //                       ),
//                 //                     );
//                 //                     return;
//                 //                   }

//                 //                   // ✅ Step 4: navigate to quiz screen
//                 //                   Navigator.of(context).pop(); // close dialog
//                 //                   Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (_) => QuizScreen(
//                 //       attemptId: attemptProvider.attemptId!,
//                 //       questions: quizProvider.questions, // pass fetched questions
//                 //     ),
//                 //   ),
//                 // );

//                 //                   // Navigator.push(
//                 //                   //   context,
//                 //                   //   MaterialPageRoute(builder: (_) => const QuizScreen()),
//                 //                   // );
//                 //                 },
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 child: const Text(
//                   "Start Test",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:mdcat/providers/attempt_provider.dart';
// import 'package:provider/provider.dart';
// import '../providers/quiz_provider.dart';
// import '../providers/class_selection_provider.dart';
// import '../providers/subject_provider.dart';
// import '../view/quiz_screen.dart';

// class StartTestDialog extends StatelessWidget {
//   final String testTitle;
//   final int credits;
//   final String testId;
//   final String level;

//   const StartTestDialog({
//     super.key,
//     required this.testId,
//     required this.testTitle,
//     required this.credits,
//     required this.level,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Close button
//             Align(
//               alignment: Alignment.topRight,
//               child: GestureDetector(
//                 onTap: () => Navigator.of(context).pop(),
//                 child: Container(
//                   width: 28,
//                   height: 28,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF2F2F2),
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.grey.shade400),
//                   ),
//                   child: const Icon(Icons.close, size: 18, color: Colors.black),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8),

//             // Title
//             const Text(
//               "Do you really want to start this level?",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),

//             Text(
//               "$testTitle (Level: $level) will take $credits credits.",
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 14, color: Colors.black87),
//             ),
//             const SizedBox(height: 24),

//             // Start Level Button
//             Container(
//               width: 160,
//               height: 44,
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xFF8C59FF), Color(0xFF492699)],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TextButton(
//                 onPressed: () async {
//                   final subject = context
//                       .read<SubjectProvider>()
//                       .selectedSubject;
//                   final className = context
//                       .read<ClassSelectionProvider>()
//                       .selectedClass;

//                   if (subject == null || className == null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text("Please select subject and class first"),
//                       ),
//                     );
//                     return;
//                   }

//                   final attemptProvider = context.read<AttemptProvider>();
//                   final quizProvider = context.read<QuizProvider>();

//                   // Step 1: Start Attempt API
//                   final attemptSuccess = await attemptProvider.startAttempt(
//                     testId,
//                   );
//                   if (!attemptSuccess) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                           attemptProvider.errorMessage ??
//                               "Failed to start attempt",
//                         ),
//                       ),
//                     );
//                     return;
//                   }

//                   // Step 2: Fetch Questions API
//                   final gotQuestions = await quizProvider.fetchQuestions(
//                     subject,
//                     className,
//                     level,
//                   );

//                   if (!gotQuestions) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                           quizProvider.errorMessage ?? "No questions found",
//                         ),
//                       ),
//                     );
//                     return;
//                   }

//                   // Step 3: Navigate to Quiz Screen
//                   Navigator.of(context).pop();
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => QuizScreen(
//                         attemptId: attemptProvider
//                             .attemptId!, // ✅ from AttemptProvider
//                         questions: quizProvider.questions,
//                       ),
//                     ),
//                   );
//                 },

//                 // onPressed: () async {
//                 //   final subject = context
//                 //       .read<SubjectProvider>()
//                 //       .selectedSubject;
//                 //   final className = context
//                 //       .read<ClassSelectionProvider>()
//                 //       .selectedClass;

//                 //   if (subject == null || className == null) {
//                 //     ScaffoldMessenger.of(context).showSnackBar(
//                 //       const SnackBar(
//                 //         content: Text("Please select subject and class first"),
//                 //       ),
//                 //     );
//                 //     return;
//                 //   }

//                 //   final quizProvider = context.read<QuizProvider>();

//                 //   // Step 1: Start Attempt API
//                 //   final attemptSuccess = await quizProvider.startAttempt(
//                 //     testId,
//                 //   );
//                 //   if (!attemptSuccess) {
//                 //     ScaffoldMessenger.of(context).showSnackBar(
//                 //       SnackBar(
//                 //         content: Text(
//                 //           quizProvider.errorMessage ??
//                 //               "Failed to start attempt",
//                 //         ),
//                 //       ),
//                 //     );
//                 //     return;
//                 //   }

//                 //   // Step 2: Fetch Questions API
//                 //   final gotQuestions = await quizProvider.fetchQuestions(
//                 //     subject,
//                 //     className,
//                 //     level,
//                 //   );

//                 //   if (!gotQuestions) {
//                 //     ScaffoldMessenger.of(context).showSnackBar(
//                 //       SnackBar(
//                 //         content: Text(
//                 //           quizProvider.errorMessage ?? "No questions found",
//                 //         ),
//                 //       ),
//                 //     );
//                 //     return;
//                 //   }

//                 //   // Step 3: Navigate to Quiz Screen
//                 //   Navigator.of(context).pop();
//                 //   Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //       builder: (_) => QuizScreen(
//                 //         attemptId: quizProvider.attemptId!,
//                 //         questions: quizProvider.questions,
//                 //       ),
//                 //     ),
//                 //   );
//                 // },
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 child: const Text(
//                   "Start Level",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:mdcat/providers/quiz_provider.dart';
// import 'package:mdcat/services/token_storage.dart';
// import 'package:provider/provider.dart';

// class StartTestDialog extends StatelessWidget {
//   final String testId;
//   final String subject;
//   final String className;
//   final String level;

//   const StartTestDialog({
//     super.key,
//     required this.testId,
//     required this.subject,
//     required this.className,
//     required this.level,
//   });

//   Future<void> _startAttempt(BuildContext context) async {
//     final quizProvider = context.read<QuizProvider>();
//     final token = await TokenStorage.getToken();

//     if (token == null || token.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("No token found. Please login again.")),
//       );
//       return;
//     }

//     try {
//       // 🔹 1. Start Attempt
//       final startUrl = Uri.parse("http://47.130.103.135/api/student/attempt/start");
//       final startRes = await http.post(
//         startUrl,
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $token", // ✅ Fixed
//         },
//         body: jsonEncode({"testId": testId}),
//       );

//       debugPrint("Start Attempt Response: ${startRes.statusCode} ${startRes.body}");

//       if (startRes.statusCode == 201) {
//         final data = jsonDecode(startRes.body);
//         final attemptId = data["attemptId"];

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               "✅ ${data["message"]}\nAttempt ID: $attemptId\nRemaining Coins: ${data["remainingCoins"]}",
//             ),
//           ),
//         );

//         // 🔹 2. Fetch Questions after attempt starts
//         final success = await quizProvider.fetchQuestions(subject, className, level);
//         if (success && context.mounted) {
//           Navigator.pop(context); // Close dialog
//           // Navigate to quiz screen here if you want
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(quizProvider.errorMessage ?? "Failed to fetch questions")),
//           );
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("❌ Failed to start attempt: ${startRes.body}")),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error starting attempt: $e")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text("Start Test"),
//       content: const Text("Do you want to start this test?"),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: const Text("Cancel"),
//         ),
//         ElevatedButton(
//           onPressed: () => _startAttempt(context),
//           child: const Text("Start"),
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:mdcat/view/quiz_screen.dart';
// import 'package:provider/provider.dart';
// import 'package:mdcat/providers/attempt_provider.dart';
// import 'package:mdcat/providers/quiz_provider.dart';

// class StartTestDialog extends StatelessWidget {
//   final String testId;
//   final String testTitle;
//   final int credits;
//   final String level;
//   final String subject;
//   final String className;

//   const StartTestDialog({
//     super.key,
//     required this.testId,
//     required this.testTitle,
//     required this.credits,
//     required this.level,
//     required this.subject,
//     required this.className,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       title: Text("Start Test"),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             "Test: $testTitle",
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8),
//           Text("Level: $level"),
//           Text("Subject: $subject"),
//           Text("Class: $className"),
//           Text("Credits Required: $credits"),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: const Text("Cancel"),
//         ),
//         ElevatedButton(
//           onPressed: () async {
//             final attemptProvider = context.read<AttemptProvider>();
//             final quizProvider = context.read<QuizProvider>();

//             final attemptSuccess = await attemptProvider.attemptTest(testId);
//             if (!attemptSuccess) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text("Failed to start test. Please try again."),
//                 ),
//               );
//               return;
//             }

//             // Use actual returned attemptId
//             final attemptId = attemptProvider.attemptId;

//             // Fetch questions
//             final fetchSuccess = await quizProvider.fetchQuestions(
//               subject,
//               className,
//               level,
//             );

//             if (fetchSuccess && context.mounted) {
//               Navigator.pop(context); // Close dialog
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => QuizScreen(
//                     attemptId: attemptId!, // ✅ actual attempt ID
//                     questions: quizProvider.questions, // ✅ fetched questions
//                   ),
//                 ),
//               );
//             } else {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text("No questions found for this test."),
//                 ),
//               );
//             }

//             // child: const Text("Start");
//           },
//           child: const Text("Start"),
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:mdcat/view/quiz_screen.dart';
// import 'package:provider/provider.dart';
// import 'package:mdcat/providers/attempt_provider.dart';
// import 'package:mdcat/providers/quiz_provider.dart';

// class StartTestDialog extends StatelessWidget {
//   final String testId;
//   final String testTitle;
//   final int credits;
//   final String level;
//   final String subject;
//   final String className;

//   const StartTestDialog({
//     super.key,
//     required this.testId,
//     required this.testTitle,
//     required this.credits,
//     required this.level,
//     required this.subject,
//     required this.className,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       title: Text("Start Test"),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             "Test: $testTitle",
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8),
//           Text("Level: $level"),
//           Text("Subject: $subject"),
//           Text("Class: $className"),
//           Text("Credits Required: $credits"),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: const Text("Cancel"),
//         ),
//         ElevatedButton(
//           onPressed: () async {
//             final attemptProvider = context.read<AttemptProvider>();
//             final quizProvider = context.read<QuizProvider>();

//             // ✅ Step 1: Attempt the test
//             final attemptSuccess = await attemptProvider.attemptTest(testId);
//             if (!attemptSuccess) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(attemptProvider.errorMessage ??
//                       "Failed to start test. Please try again."),
//                 ),
//               );
//               return;
//             }

//             final attemptId = attemptProvider.attemptId;
//             if (attemptId == null) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text("Invalid attempt ID."),
//                 ),
//               );
//               return;
//             }

//             // ✅ Step 2: Fetch questions with correct order of arguments
//             final fetchSuccess = await quizProvider.fetchQuestions(
//               level,   // Level title
//               subject, // Selected subject
//               className, // Selected class
//             );

//             if (fetchSuccess && context.mounted) {
//               Navigator.pop(context); // Close dialog
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => QuizScreen(
//                     attemptId: attemptId,
//                     questions: quizProvider.questions,
//                   ),
//                 ),
//               );
//             } else {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text("No questions found for this test."),
//                 ),
//               );
//             }
//           },
//           child: const Text("Start"),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
// import 'package:mdcat/view/physics_screen.dart';
import 'package:mdcat/view/quiz_screen.dart';
import 'package:provider/provider.dart';
import 'package:mdcat/providers/attempt_provider.dart';
import 'package:mdcat/providers/quiz_provider.dart';

class StartTestDialog extends StatelessWidget {
  final String testId;
  final String testTitle;
  final int credits;
  final String level;
  final String subject;
  final String className;

  const StartTestDialog({
    super.key,
    required this.testId,
    required this.testTitle,
    required this.credits,
    required this.level,
    required this.subject,
    required this.className,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Text("Start Test"),
      content: Consumer2<AttemptProvider, QuizProvider>(
        builder: (context, attemptProvider, quizProvider, child) {
          // Show loading indicator if API is in progress
          if (attemptProvider.isLoading || quizProvider.isLoading) {
            return SizedBox(
              height: 80,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 12),
                    Text("Preparing your test..."),
                  ],
                ),
              ),
            );
          }

          // Normal content when not loading
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Test: $testTitle",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text("Level: $level"),
              Text("Subject: $subject"),
              Text("Class: $className"),
              Text("Credits Required: $credits"),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        Consumer2<AttemptProvider, QuizProvider>(
          builder: (context, attemptProvider, quizProvider, child) {
            return ElevatedButton(
              onPressed: attemptProvider.isLoading || quizProvider.isLoading
                  ? null
                  : () async {
                      // ✅ Step 1: Fetch questions using filters
                      final fetchSuccess = await quizProvider.fetchQuestions(
                        level,
                        subject,
                        className,
                      );

                      if (!fetchSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              quizProvider.errorMessage ??
                                  "No questions found for this test.",
                            ),
                          ),
                        );
                        return;
                      }

                      // ✅ Step 2: Get dynamic testId from fetched test
                      final testIdFromApi = quizProvider.questions.isNotEmpty
                          ? quizProvider.questions[0].testId
                          : null;

                      // final testIdFromApi = quizProvider.questions.isNotEmpty
                      //     ? quizProvider
                      //           .questions[0]
                      //           .testId // you need to add testId in Question model
                      //     : null;

                      if (testIdFromApi == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Invalid test ID.")),
                        );
                        return;
                      }

                      // ✅ Step 3: Attempt the test
                      final attemptSuccess = await attemptProvider.attemptTest(
                        testIdFromApi,
                      );

                      if (!attemptSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              attemptProvider.errorMessage ??
                                  "Failed to start test. Please try again.",
                            ),
                          ),
                        );
                        return;
                      }

                      // ✅ Step 4: Navigate to QuizScreen
                      if (context.mounted) {
                        Navigator.pop(context); // Close dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              attemptId: attemptProvider.attemptId!,
                              questions: quizProvider.questions,
                            ),
                          ),
                        );
                      }
                    },
              child: const Text("Start"),
            );
          },
        ),
      ],
    );
  }
}
