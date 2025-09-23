// import 'package:flutter/material.dart';
// import 'package:mdcat/models/level_model.dart';
// import 'package:mdcat/providers/class_selection_provider.dart';
// import 'package:mdcat/providers/levels_provider.dart';
// import 'package:mdcat/providers/quiz_provider.dart';
// import 'package:mdcat/providers/subject_provider.dart';
// // import 'package:mdcat/view/physics_screen.dart';
// import 'package:mdcat/view/quiz_screen.dart';
// import 'package:mdcat/widgets/custom_background.dart';
// import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';
// import 'package:provider/provider.dart';
// // import '../viewmodel/levels_viewmodel.dart';
// // import '../model/level_model.dart';

// class LevelsScreen extends StatelessWidget {
//   const LevelsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final levels = context.watch<LevelsViewModel>().levels;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       bottomNavigationBar: const AppBottomNav(currentIndex: 0),
//       body: Column(
//         children: [
//           CustomHeader(title: "Physics  Levels", counterText: ""),

//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisExtent: 140,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//               ),
//               itemCount: levels.length,
//               itemBuilder: (context, index) {
//                 final level = levels[index];
//                 final provider = context.read<LevelsViewModel>();
//                 return _buildLevelCard(level, index + 1, provider, context);
//               },

//               // itemBuilder: (context, index) {
//               //   final level = levels[index];
//               //   return _buildLevelCard(level, index + 1);
//               // },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLevelCard(
//     LevelModel level,
//     int position,
//     LevelsViewModel provider,
//     BuildContext context,
//   ) {
//     String getOrdinal(int number) {
//       if (number >= 11 && number <= 13) return "${number}th";
//       switch (number % 10) {
//         case 1:
//           return "${number}st";
//         case 2:
//           return "${number}nd";
//         case 3:
//           return "${number}rd";
//         default:
//           return "${number}th";
//       }
//     }

//     return GestureDetector(
//       onTap: () async {
//   final subject = context.read<SubjectProvider>().selectedSubject;
//   final className = context.read<ClassSelectionProvider>().selectedClass;
//   final levelId = level.id; // from your LevelModel

//   if (subject == null || className == null) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Please select subject and class first")),
//     );
//     return;
//   }

//   final quizProvider = context.read<QuizProvider>();

//   // Show loader while fetching
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (_) => const Center(child: CircularProgressIndicator()),
//   );

//   final success = await quizProvider.fetchQuestions(subject, className, levelId);

//   Navigator.pop(context); // close loader

//   if (success) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const QuizScreen()),
//     );
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(quizProvider.errorMessage ?? "Failed to load quiz")),
//     );
//   }
// },

//       // onTap: () {
//       //   if (level.isUnlocked) {
//       //     if (position == 1) {
//       //       // Check if it's Level 1
//       //       Navigator.push(
//       //         context,
//       //         MaterialPageRoute(
//       //           builder: (context) =>
//       //               const PhysicsScreen(), // Replace with your new screen
//       //         ),
//       //       );
//       //     } else {
//       //       ScaffoldMessenger.of(context).showSnackBar(
//       //         SnackBar(content: Text("Opening ${level.title}...")),
//       //       );
//       //     }
//       //   } else {
//       //     final success = provider.unlockLevel(level.id);
//       //     ScaffoldMessenger.of(context).showSnackBar(
//       //       SnackBar(
//       //         content: Text(
//       //           success
//       //               ? "${level.title} unlocked!"
//       //               : "Not enough credits to unlock ${level.title}.",
//       //         ),
//       //       ),
//       //     );
//       //   }
//       // },

//       child: Stack(
//         children: [
//           // Main card
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: Colors.white,
//               border: Border.all(
//                 color: level.isUnlocked ? Color(0xFFCCCCCC) : Colors.red,
//                 width: 1.0,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 6,
//                   offset: const Offset(2, 2),
//                 ),
//               ],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Image.asset(
//                         "assets/images/ribbon.png",
//                         height: 55,
//                         fit: BoxFit.cover,
//                       ),
//                       Align(
//                         child: Transform.translate(
//                           offset: const Offset(0, -13),
//                           child: Text(
//                             getOrdinal(position),
//                             style: const TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                   Text(
//                     level.title,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     "${level.mcqs} MCQs",
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Color(0xFF727272),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // 🔒 Lock overlay when locked
//           if (!level.isUnlocked)
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Colors.white.withOpacity(0.7),
//               ),
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(Icons.lock, size: 32, color: Colors.grey),
//                     const SizedBox(height: 8),
//                     Text(
//                       "Unlock\n${level.price} credits",
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:mdcat/models/level_model.dart';
// import 'package:mdcat/providers/class_selection_provider.dart';
// import 'package:mdcat/providers/levels_provider.dart';
// import 'package:mdcat/providers/quiz_provider.dart';
// import 'package:mdcat/providers/subject_provider.dart';
// import 'package:mdcat/view/quiz_screen.dart';
// import 'package:provider/provider.dart';

// class LevelsScreen extends StatelessWidget {
//   const LevelsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final levels = context.watch<LevelsViewModel>().levels;

//     return Scaffold(
//       appBar: AppBar(title: const Text("Levels")),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(16),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisExtent: 140,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//         ),
//         itemCount: levels.length,
//         itemBuilder: (context, index) {
//           final level = levels[index];
//           final provider = context.read<LevelsViewModel>();
//           return _buildLevelCard(level, index + 1, provider, context);
//         },
//       ),
//     );
//   }

//   Widget _buildLevelCard(
//     LevelModel level,
//     int position,
//     LevelsViewModel provider,
//     BuildContext context,
//   ) {
//     return GestureDetector(
//       onTap: () async {
//         final subject = context.read<SubjectProvider>().selectedSubject;
//         final className = context.read<ClassSelectionProvider>().selectedClass;
//         final levelId = level.id;

//         if (subject == null || className == null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text("Please select subject and class first"),
//             ),
//           );
//           return;
//         }

//         final quizProvider = context.read<QuizProvider>();

//         // Show loader
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (_) => const Center(child: CircularProgressIndicator()),
//         );
//         final success = await quizProvider.fetchQuestions(
//           subject,
//           className,
//           level.title, // ✅ This matches the API requirement
//         );

//         // final success = await quizProvider.fetchQuestions(
//         //   subject,
//         //   className,
//         //   levelId.toString(), // cast to String
//         // );

//         // final success = await quizProvider.fetchQuestions(
//         //   subject,
//         //   className,
//         //   levelId,
//         // );

//         Navigator.pop(context); // close loader

// ignore_for_file: unused_local_variable

//         if (success) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => const QuizScreen()),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(quizProvider.errorMessage ?? "Failed to load quiz"),
//             ),
//           );
//         }
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//           border: Border.all(
//             color: level.isUnlocked ? Colors.grey : Colors.red,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             "${level.title}\n${level.mcqs} MCQs",
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:mdcat/models/level_model.dart';
// import 'package:mdcat/providers/attempt_provider.dart';
// import 'package:mdcat/providers/class_selection_provider.dart';
// import 'package:mdcat/providers/levels_provider.dart';
// import 'package:mdcat/providers/quiz_provider.dart';
// import 'package:mdcat/providers/subject_provider.dart';
// import 'package:mdcat/view/quiz_screen.dart';
// import 'package:mdcat/widgets/start_test_dialogue.dart';
// import 'package:provider/provider.dart';

// class LevelsScreen extends StatelessWidget {
//   const LevelsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final levels = context.watch<LevelsViewModel>().levels;

//     return Scaffold(
//       appBar: AppBar(title: const Text("Levels")),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(16),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisExtent: 140,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//         ),
//         itemCount: levels.length,
//         itemBuilder: (context, index) {
//           final level = levels[index];
//           final provider = context.read<LevelsViewModel>();
//           return _buildLevelCard(level, index + 1, provider, context);
//         },
//       ),
//     );
//   }

//   Widget _buildLevelCard(
//     LevelModel level,
//     int position,
//     LevelsViewModel provider,
//     BuildContext context,
//   ) {
//     return GestureDetector(
//       onTap: () async {
//   final subject = context.read<SubjectProvider>().selectedSubject;
//   final className = context.read<ClassSelectionProvider>().selectedClass;

//   if (subject == null || className == null) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Please select subject and class first")),
//     );
//     return;
//   }

//   // Show confirmation dialog and await user confirmation
//   final confirm = await showDialog<bool>(
//     context: context,
//     builder: (_) => StartTestDialog(
//       testId: level.id.toString(),       // ✅ convert int to string
//       testTitle: level.title,
//        credits: level.credits,            // get from LevelModel if available
//       onConfirm: () => Navigator.of(context).pop(true), // close dialog
//     ),
//   );

//   if (confirm != true) return; // user cancelled

//   // Start attempt
//   final attemptProvider = Provider.of<AttemptProvider>(context, listen: false);
//   final success = await attemptProvider.startAttempt(level.id.toString());

//   if (!success) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(attemptProvider.errorMessage ?? "Failed to start attempt")),
//     );
//     return;
//   }

//   // Fetch questions
//   final quizProvider = context.read<QuizProvider>();
//   final gotQuestions = await quizProvider.fetchQuestions(subject, className, level.title);

//   if (!gotQuestions) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(quizProvider.errorMessage ?? "No test found")),
//     );
//     return;
//   }

//   // Navigate to quiz screen
//   Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen()));
// },

//       // onTap: () async {
//       //   final subject = context.read<SubjectProvider>().selectedSubject;
//       //   final className = context.read<ClassSelectionProvider>().selectedClass;
//       //   final levelId = level.id;

//       //   if (subject == null || className == null) {
//       //     ScaffoldMessenger.of(context).showSnackBar(
//       //       const SnackBar(
//       //         content: Text("Please select subject and class first"),
//       //       ),
//       //     );
//       //     return;
//       //   }

//       //   // Show confirmation dialog
//       //   showDialog(
//       //     context: context,
//       //     builder: (_) {
//       //       return StartTestDialog(
//       //         testId: level.id as String, // ✅ Cast dynamic to String
//       //         testTitle: level.title, // optional, for showing title
//       //         credits: 5, // optional, make it dynamic later
//       //         onConfirm: () async {
//       //           Navigator.pop(context); // close dialog first

//       //           final attemptProvider = Provider.of<AttemptProvider>(
//       //             context,
//       //             listen: false,
//       //           );

//       //           final success = await attemptProvider.startAttempt(
//       //             level.id as String,
//       //           );

//       //           if (success) {
//       //             // ✅ Now call fetchQuestions AFTER starting attempt
//       //             final quizProvider = context.read<QuizProvider>();

//       //             final gotQuestions = await quizProvider.fetchQuestions(
//       //               subject,
//       //               className,
//       //               level.title,
//       //             );

//       //             if (gotQuestions) {
//       //               Navigator.push(
//       //                 context,
//       //                 MaterialPageRoute(builder: (_) => const QuizScreen()),
//       //               );
//       //             } else {
//       //               ScaffoldMessenger.of(context).showSnackBar(
//       //                 SnackBar(
//       //                   content: Text(
//       //                     quizProvider.errorMessage ?? "No test found",
//       //                   ),
//       //                 ),
//       //               );
//       //             }
//       //           } else {
//       //             ScaffoldMessenger.of(context).showSnackBar(
//       //               SnackBar(
//       //                 content: Text(
//       //                   attemptProvider.errorMessage ??
//       //                       "Failed to start attempt",
//       //                 ),
//       //               ),
//       //             );
//       //           }
//       //         },
//       //       );
//       //     },
//       //   );
//       // },

//         // showDialog(
//         //   context: context,
//         //   builder: (_) {
//         //     return StartTestDialog(
//         //       testId: level.id, // pass level/testId dynamically
//         //       onConfirm: () async {
//         //         Navigator.pop(context); // close dialog first

//         //         final attemptProvider =
//         //             Provider.of<AttemptProvider>(context, listen: false);

//         //         final success = await attemptProvider.startAttempt(level.id);

//         //         if (success) {
//         //           // ✅ Now call fetchQuestions AFTER starting attempt
//         //           final quizProvider = context.read<QuizProvider>();

//         //           final gotQuestions = await quizProvider.fetchQuestions(
//         //             subject,
//         //             className,
//         //             level.title,
//         //           );

//         //           if (gotQuestions) {
//         //             Navigator.push(
//         //               context,
//         //               MaterialPageRoute(builder: (_) => const QuizScreen()),
//         //             );
//         //           } else {
//         //             ScaffoldMessenger.of(context).showSnackBar(
//         //               SnackBar(
//         //                 content: Text(quizProvider.errorMessage ?? "No test found"),
//         //               ),
//         //             );
//         //           }
//         //         } else {
//         //           ScaffoldMessenger.of(context).showSnackBar(
//         //             SnackBar(
//         //               content: Text(
//         //                 attemptProvider.errorMessage ?? "Failed to start attempt",
//         //               ),
//         //             ),
//         //           );
//         //         }
//         //       },
//         //     );
//         //   },
//         // );

//       // onTap: () async {
//       //   // Show custom confirmation dialog
//       //   final confirm = await showDialog<bool>(
//       //     context: context,
//       //     builder: (_) => StartTestDialog(
//       //       testTitle: level.title,
//       //       credits: 5, // you can make this dynamic if needed
//       //     ),
//       //   );

//       //   if (confirm != true) return; // User cancelled

//       //   final subject = context.read<SubjectProvider>().selectedSubject;
//       //   final className = context.read<ClassSelectionProvider>().selectedClass;
//       //   final quizProvider = context.read<QuizProvider>();

//       //   if (subject == null || className == null) {
//       //     ScaffoldMessenger.of(context).showSnackBar(
//       //       const SnackBar(
//       //         content: Text("Please select subject and class first"),
//       //       ),
//       //     );
//       //     return;
//       //   }

//       //   // Show loader while fetching
//       //   showDialog(
//       //     context: context,
//       //     barrierDismissible: false,
//       //     builder: (_) => const Center(child: CircularProgressIndicator()),
//       //   );

//       //   final success = await quizProvider.fetchQuestions(
//       //     subject,
//       //     className,
//       //     level.title,
//       //   );

//       //   Navigator.pop(context); // close loader

//       //   if (success) {
//       //     Navigator.push(
//       //       context,
//       //       MaterialPageRoute(builder: (_) => const QuizScreen()),
//       //     );
//       //   } else {
//       //     ScaffoldMessenger.of(context).showSnackBar(
//       //       SnackBar(
//       //         content: Text(quizProvider.errorMessage ?? "Failed to load quiz"),
//       //       ),
//       //     );
//       //   }
//       // },

//       // onTap: () async {
//       //   final subject = context.read<SubjectProvider>().selectedSubject;
//       //   final className = context.read<ClassSelectionProvider>().selectedClass;

//       //   if (subject == null || className == null) {
//       //     ScaffoldMessenger.of(context).showSnackBar(
//       //       const SnackBar(
//       //         content: Text("Please select subject and class first"),
//       //       ),
//       //     );
//       //     return;
//       //   }

//       //   final quizProvider = context.read<QuizProvider>();

//       //   // Show loader
//       //   showDialog(
//       //     context: context,
//       //     barrierDismissible: false,
//       //     builder: (_) => const Center(child: CircularProgressIndicator()),
//       //   );

//       //   // ✅ Send "Level 1" instead of just "1"
//       //   final success = await quizProvider.fetchQuestions(
//       //     subject,
//       //     className,
//       //     level.title, // <-- API requires this
//       //   );

//       //   Navigator.pop(context); // close loader

//       //   if (success) {
//       //     Navigator.push(
//       //       context,
//       //       MaterialPageRoute(builder: (_) => const QuizScreen()),
//       //     );
//       //   } else {
//       //     ScaffoldMessenger.of(context).showSnackBar(
//       //       SnackBar(
//       //         content: Text(quizProvider.errorMessage ?? "Failed to load quiz"),
//       //       ),
//       //     );
//       //   }
//       // },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//           border: Border.all(
//             color: level.isUnlocked ? Colors.grey : Colors.red,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             "${level.title}\n${level.mcqs} MCQs",
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:mdcat/models/level_model.dart';
// import 'package:mdcat/providers/attempt_provider.dart';
// import 'package:mdcat/providers/class_selection_provider.dart';
// import 'package:mdcat/providers/levels_provider.dart';
// import 'package:mdcat/providers/quiz_provider.dart';
// import 'package:mdcat/providers/subject_provider.dart';
// import 'package:mdcat/view/quiz_screen.dart';
// import 'package:mdcat/widgets/start_test_dialogue.dart';
// import 'package:provider/provider.dart';

// class LevelsScreen extends StatelessWidget {
//   const LevelsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final levels = context.watch<LevelsViewModel>().levels;

//     return Scaffold(
//       appBar: AppBar(title: const Text("Levels")),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(16),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisExtent: 140,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//         ),
//         itemCount: levels.length,
//         itemBuilder: (context, index) {
//           final level = levels[index];
//           final provider = context.read<LevelsViewModel>();
//           return _buildLevelCard(level, provider, context);
//         },
//       ),
//     );
//   }

//   Widget _buildLevelCard(LevelModel level, LevelsViewModel provider, BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         final subject = context.read<SubjectProvider>().selectedSubject;
//         final className = context.read<ClassSelectionProvider>().selectedClass;

//         if (subject == null || className == null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("Please select subject and class first")),
//           );
//           return;
//         }

//         // Show confirmation dialog
//         final confirm = await showDialog<bool>(
//           context: context,
//           builder: (_) => StartTestDialog(
//             testId: level.id.toString(),
//             testTitle: level.title,
//             credits: level.credits ?? 5,
//             onConfirm: () => Navigator.of(context).pop(true),
//           ),
//         );

//         if (confirm != true) return; // user cancelled

//         // Start attempt
//         final attemptProvider = context.read<AttemptProvider>();
//         final success = await attemptProvider.startAttempt(level.id.toString());

//         if (!success) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(attemptProvider.errorMessage ?? "Failed to start attempt")),
//           );
//           return;
//         }

//         // Fetch questions
//         final quizProvider = context.read<QuizProvider>();
//         final gotQuestions = await quizProvider.fetchQuestions(subject, className, level.title);

//         if (!gotQuestions) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(quizProvider.errorMessage ?? "No test found")),
//           );
//           return;
//         }

//         // Navigate to quiz screen
//         Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen()));
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//           border: Border.all(color: level.isUnlocked ? Colors.grey : Colors.red),
//         ),
//         child: Center(
//           child: Text(
//             "${level.title}\n${level.mcqs} MCQs",
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/level_model.dart';
// import '../providers/attempt_provider.dart';
// import '../providers/class_selection_provider.dart';
// import '../providers/levels_provider.dart';
// import '../providers/quiz_provider.dart';
// import '../providers/subject_provider.dart';
// import '../view/quiz_screen.dart';
// import '../widgets/start_test_dialogue.dart';

// class LevelsScreen extends StatelessWidget {
//   const LevelsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final levels = context.watch<LevelsViewModel>().levels;

//     return Scaffold(
//       appBar: AppBar(title: const Text("Levels")),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(16),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisExtent: 140,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//         ),
//         itemCount: levels.length,
//         itemBuilder: (context, index) {
//           final level = levels[index];
//           return _buildLevelCard(level, context);
//         },
//       ),
//     );
//   }

//   Widget _buildLevelCard(LevelModel level, BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         final subject = context.read<SubjectProvider>().selectedSubject;
//         final className = context.read<ClassSelectionProvider>().selectedClass;

//         if (subject == null || className == null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text("Please select subject and class first"),
//             ),
//           );
//           return;
//         }

//         // Show confirmation dialog
//         final confirm = await showDialog<bool>(
//           context: context,
//           builder: (_) => StartTestDialog(
//             testId: level.id.toString(),
//             testTitle: level.title,
//             credits: level.price, // ✅ use price from your model
//             onConfirm: () => Navigator.of(context).pop(true),
//           ),
//         );

//         if (confirm != true) return; // user cancelled

//         // Start attempt
//         final attemptProvider = Provider.of<AttemptProvider>(
//           context,
//           listen: false,
//         );
//         final success = await attemptProvider.startAttempt(level.id.toString());

//         if (!success) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(
//                 attemptProvider.errorMessage ?? "Failed to start attempt",
//               ),
//             ),
//           );
//           return;
//         }

//         // Fetch questions
//         final quizProvider = context.read<QuizProvider>();
//         final gotQuestions = await quizProvider.fetchQuestions(
//           subject,
//           className,
//           level.title,
//         );

//         if (!gotQuestions) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(quizProvider.errorMessage ?? "No test found"),
//             ),
//           );
//           return;
//         }

//         // Navigate to quiz screen
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const QuizScreen()),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//           border: Border.all(
//             color: level.isUnlocked ? Colors.grey : Colors.red,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             "${level.title}\n${level.mcqs} MCQs",
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/level_model.dart';
// import '../providers/attempt_provider.dart';
// import '../providers/class_selection_provider.dart';
// // import '../providers/levels_provider.dart';
// import '../providers/quiz_provider.dart';
// import '../providers/subject_provider.dart';
// import '../view/quiz_screen.dart';
// import '../widgets/start_test_dialogue.dart';

// class LevelsScreen extends StatelessWidget {
//   const LevelsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final levels = context.watch<LevelsViewModel>().levels;

//     return Scaffold(
//       appBar: AppBar(title: const Text("Levels")),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(16),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisExtent: 140,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//         ),
//         itemCount: levels.length,
//         itemBuilder: (context, index) {
//           final level = levels[index];
//           return _buildLevelCard(level, context);
//         },
//       ),
//     );
//   }

//   Widget _buildLevelCard(LevelModel level, BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         // 1️⃣ Get selected subject and class
//         final subject = context.read<SubjectProvider>().selectedSubject;
//         final className = context.read<ClassSelectionProvider>().selectedClass;

//         if (subject == null || className == null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text("Please select subject and class first"),
//             ),
//           );
//           return;
//         }

//         // 2️⃣ Show confirmation dialog and wait for user's decision
//         final confirm = await showDialog(
//           context: context,
//           builder: (_) => StartTestDialog(
//             testId: level.id.toString(),
//             testTitle: level.title,
//             credits: level.price,
//           ),
//         );

//         // final confirm = await showDialog<bool>(
//         //   context: context,
//         //   builder: (_) => StartTestDialog(
//         //     testId: level.id.toString(),
//         //     testTitle: level.title,
//         //     credits: level.price,
//         //     onConfirm: () => Navigator.of(context).pop(true), // close dialog
//         //   ),
//         // );

//         if (confirm != true) return; // user cancelled

//         // 3️⃣ Start attempt
//         final attemptProvider = Provider.of<AttemptProvider>(
//           context,
//           listen: false,
//         );
//         final success = await attemptProvider.startAttempt(level.id.toString());

//         if (!success) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(
//                 attemptProvider.errorMessage ?? "Failed to start attempt",
//               ),
//             ),
//           );
//           return;
//         }

//         // 4️⃣ Fetch questions
//         final quizProvider = context.read<QuizProvider>();
//         final gotQuestions = await quizProvider.fetchQuestions(
//           subject,
//           className,
//           level.title,
//         );

//         if (!gotQuestions) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(quizProvider.errorMessage ?? "No test found"),
//             ),
//           );
//           return;
//         }

//         // 5️⃣ Navigate to quiz screen
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const QuizScreen()),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//           border: Border.all(
//             color: level.isUnlocked ? Colors.grey : Colors.red,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             "${level.title}\n${level.mcqs} MCQs",
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/level_model.dart';
// import '../providers/attempt_provider.dart';
// import '../providers/class_selection_provider.dart';
// import '../providers/levels_provider.dart';
// import '../providers/quiz_provider.dart';
// import '../providers/subject_provider.dart';
// import '../view/quiz_screen.dart';
// import '../widgets/start_test_dialogue.dart';

// class LevelsScreen extends StatelessWidget {
//   const LevelsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final levels = context.watch<LevelsViewModel>().levels;

//     return Scaffold(
//       appBar: AppBar(title: const Text("Levels")),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(16),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisExtent: 140,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//         ),
//         itemCount: levels.length,
//         itemBuilder: (context, index) {
//           final level = levels[index];
//           return _buildLevelCard(level, context);
//         },
//       ),
//     );
//   }

//   Widget _buildLevelCard(LevelModel level, BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         // 1️⃣ Check if subject and class are selected
//         final subject = context.read<SubjectProvider>().selectedSubject;
//         final className = context.read<ClassSelectionProvider>().selectedClass;

//         if (subject == null || className == null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text("Please select subject and class first"),
//             ),
//           );
//           return;
//         }

//         // 2️⃣ Show confirmation dialog
//         final confirm = await showDialog<bool>(
//           context: context,
//           barrierDismissible: false,
//           builder: (_) => StartTestDialog(
//             testId: level.id, // ✅ Use actual ID string
//             testTitle: level.title,
//             credits: level.price,
//             onConfirm: () async {
//               final attemptProvider = Provider.of<AttemptProvider>(
//                 context,
//                 listen: false,
//               );
//               final success = await attemptProvider.startAttempt(level.id);

//               if (success) {
//                 Navigator.of(context).pop(true); // Close dialog
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(
//                       attemptProvider.errorMessage ?? "Failed to start attempt",
//                     ),
//                   ),
//                 );
//               }
//             },
//           ),
//         );

//         if (confirm != true) return; // User cancelled

//         // 3️⃣ Fetch questions
//         final quizProvider = context.read<QuizProvider>();
//         final gotQuestions = await quizProvider.fetchQuestions(
//           subject,
//           className,
//           level.title,
//         );

//         if (!gotQuestions) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(quizProvider.errorMessage ?? "No test found"),
//             ),
//           );
//           return;
//         }

//         // 4️⃣ Navigate to quiz screen
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const QuizScreen()),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//           border: Border.all(
//             color: level.isUnlocked ? Colors.grey : Colors.red,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             "${level.title}\n${level.mcqs} MCQs",
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/level_model.dart';
// import '../providers/class_selection_provider.dart';
// import '../providers/levels_provider.dart';
// import '../providers/subject_provider.dart';
// import '../widgets/start_test_dialogue.dart';

// class LevelsScreen extends StatelessWidget {
//   const LevelsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final levels = context.watch<LevelsViewModel>().levels;
//     // final levels = context.watch<LevelsViewModel>().levels;
//     final viewModel = context.watch<LevelsViewModel>();
//     final levels = viewModel.levels;

//     return Scaffold(
//       appBar: AppBar(title: const Text("Levels")),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(16),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisExtent: 140,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//         ),
//         itemCount: levels.length,
//         itemBuilder: (context, index) {
//           final level = levels[index];
//           return _buildLevelCard(level, context);
//         },
//       ),
//     );
//   }

//   Widget _buildLevelCard(LevelModel level, BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         // 1️⃣ Check if subject and class are selected
//         final subject = context.read<SubjectProvider>().selectedSubject;
//         final className = context.read<ClassSelectionProvider>().selectedClass;

//         if (subject == null || className == null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text("Please select subject and class first"),
//             ),
//           );
//           return;
//         }

//         // 2️⃣ Show confirmation dialog (no onConfirm anymore)
//         await showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (_) => StartTestDialog(
//             testId: level.id.toString(),
//             testTitle: level.title,
//             credits: level.price,
//             level: "Level 1", // 🔹 hardcoded for now
//             subject: "Physics", // 🔹 hardcoded for now
//             className: "11", // 🔹 hardcoded for now
//           ),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//           border: Border.all(
//             color: level.isUnlocked ? Colors.grey : Colors.red,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             "${level.title}\n${level.mcqs} MCQs",
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/level_model.dart';
// import '../providers/class_selection_provider.dart';
// import '../providers/levels_provider.dart';
// import '../providers/subject_provider.dart';
// import '../widgets/start_test_dialogue.dart';

// class LevelsScreen extends StatelessWidget {
//   const LevelsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = context.watch<LevelsViewModel>();
//     final levels = viewModel.levels;

//     return Scaffold(
//       appBar: AppBar(title: const Text("Levels")),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(16),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisExtent: 140,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//         ),
//         itemCount: levels.length,
//         itemBuilder: (context, index) {
//           final level = levels[index];
//           return _buildLevelCard(level, context);
//         },
//       ),
//     );
//   }

//   Widget _buildLevelCard(LevelModel level, BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         // ✅ Get selected subject and class from providers
//         final subject = context.read<SubjectProvider>().selectedSubject;
//         final className = context.read<ClassSelectionProvider>().selectedClass;

//         if (subject == null || className == null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text("Please select subject and class first"),
//             ),
//           );
//           return;
//         }

//         // ✅ Check if level is unlocked
//         if (!level.isUnlocked) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("This level is locked.")),
//           );
//           return;
//         }

//         // Show dialog with actual selected values
//         await showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (_) => StartTestDialog(
//             testId: level.id.toString(),
//             testTitle: level.title,
//             credits: level.price,
//             level: level.title,
//             subject: subject,
//             className: className,
//           ),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//           border: Border.all(
//             color: level.isUnlocked ? Colors.grey : Colors.red,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             "${level.title}\n${level.mcqs} MCQs",
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/level_model.dart';
import '../providers/class_selection_provider.dart';
import '../providers/subject_provider.dart';
import '../providers/levels_provider.dart';
import '../widgets/start_test_dialogue.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({
    super.key,
    required String subject,
    required String className,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LevelsViewModel>();
    final levels = viewModel.levels;

    return Scaffold(
      appBar: AppBar(title: const Text("Levels")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 140,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: levels.length,
        itemBuilder: (context, index) {
          final level = levels[index];
          return _buildLevelCard(level, context);
        },
      ),
    );
  }

  Widget _buildLevelCard(LevelModel level, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!level.isUnlocked) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("This level is locked.")),
          );
          return;
        }

        final subject = context.read<SubjectProvider>().selectedSubject;
        final className = context.read<ClassSelectionProvider>().selectedClass;

        if (subject == null || className == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please select subject and class first"),
            ),
          );
          return;
        }

        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => StartTestDialog(
            testId: level.id.toString(),
            testTitle: level.title,
            credits: level.price,
            level: level.level,
            subject: subject,
            className: className,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(
            color: level.isUnlocked ? Colors.grey : Colors.red,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                level.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text("${level.mcqs} MCQs"),
              const SizedBox(height: 8),
              Text(
                level.isUnlocked ? "Unlocked" : "Locked",
                style: TextStyle(
                  color: level.isUnlocked ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
