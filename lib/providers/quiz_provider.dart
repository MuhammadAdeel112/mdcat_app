// // //normal flow +revisit flow

// // import 'package:flutter/material.dart';

// // class QuizProvider extends ChangeNotifier {
// //   int currentIndex = 0;
// //   int revisitIndex = 0; // 👈 for skipped questions
// //   bool inRevisitMode = false;

// //   // sample questions
// //   final List<Question> questions = [
// //     Question(
// //       text:
// //           "In front of you, a large combine harvester wants to turn right. What is right?",
// //       options: [
// //         "In front of you , a large combine.",
// //         "In front of you , a large combine.",
// //         "In front of you , a large combine.",
// //         "In front of you , a large combine.",
// //       ],
// //     ),
// //     Question(
// //       text: "What does a red traffic light mean?",
// //       options: ["Stop", "Go", "Speed up", "Turn right"],
// //     ),
// //     Question(
// //       text: "Which sign indicates a school zone?",
// //       options: [
// //         "Stop sign",
// //         "Pedestrian sign",
// //         "Children crossing sign",
// //         "Hospital sign",
// //       ],
// //     ),
// //   ];

// //   /// selected options per question
// //   final Map<int, Set<int>> selectedOptions = {};

// //   /// Track skipped question indexes
// //   final List<int> skippedIndexes = [];

// //   void toggleOption(int qIndex, int optionIndex) {
// //     final currentSet = selectedOptions[qIndex] ?? <int>{};
// //     if (currentSet.contains(optionIndex)) {
// //       currentSet.remove(optionIndex);
// //     } else {
// //       currentSet.add(optionIndex);
// //     }
// //     selectedOptions[qIndex] = currentSet;
// //     notifyListeners();
// //   }

// //   bool isSelected(int qIndex, int optionIndex) {
// //     return selectedOptions[qIndex]?.contains(optionIndex) ?? false;
// //   }

// //   void nextQuestion() {
// //     if (!inRevisitMode) {
// //       if (currentIndex < questions.length - 1) {
// //         currentIndex++;
// //       } else if (skippedIndexes.isNotEmpty) {
// //         // Switch to revisit skipped
// //         inRevisitMode = true;
// //         revisitIndex = 0;
// //       }
// //     } else {
// //       if (revisitIndex < skippedIndexes.length - 1) {
// //         revisitIndex++;
// //       } else {
// //         // quiz finished
// //       }
// //     }
// //     notifyListeners();
// //   }

// //   void skipQuestion() {
// //     if (!inRevisitMode) {
// //       skippedIndexes.add(currentIndex);
// //       nextQuestion();
// //     } else {
// //       nextQuestion(); // in revisit mode, skip acts like next
// //     }
// //   }

// //   Question get currentQuestion {
// //     if (!inRevisitMode) {
// //       return questions[currentIndex];
// //     } else {
// //       return questions[skippedIndexes[revisitIndex]];
// //     }
// //   }

// //   /// for bottom counter text
// //   String get counterText {
// //     if (!inRevisitMode) {
// //       return "# ${currentIndex + 1} / ${questions.length}";
// //     } else {
// //       return "# ${revisitIndex + 1} / ${skippedIndexes.length}";
// //     }
// //   }

// //   double progress() {
// //     if (!inRevisitMode) {
// //       return (currentIndex + 1) / questions.length;
// //     } else {
// //       return (revisitIndex + 1) / skippedIndexes.length;
// //     }
// //   }
// // }

// // class Question {
// //   final String text;
// //   final List<String> options;
// //   Question({required this.text, required this.options});
// // }
// // import 'package:flutter/material.dart';
// // import 'package:mdcat/models/answer_option_model.dart';
// // import 'package:mdcat/models/question_model.dart';

// // class QuizProvider extends ChangeNotifier {
// //   int currentIndex = 0;
// //   int revisitIndex = 0; // for skipped questions
// //   bool inRevisitMode = false;

// //   // pause state
// //   bool _paused = false;
// //   bool get paused => _paused;
// //   final List<Question> questions = [
// //     Question(
// //       id: 1,
// //       text:
// //           "In front of you, a large combine harvester wants to turn right. What is right?",
// //       options: [
// //         AnswerOption(
// //           label: "A",
// //           text: "In front of you, a large combine.",
// //           isCorrect: true,
// //         ),
// //         AnswerOption(
// //           label: "B",
// //           text: "In front of you, a large combine.",
// //           isCorrect: false,
// //         ),
// //         AnswerOption(
// //           label: "C",
// //           text: "In front of you, a large combine.",
// //           isCorrect: false,
// //         ),
// //         AnswerOption(
// //           label: "D",
// //           text: "In front of you, a large combine.",
// //           isCorrect: false,
// //         ),
// //       ],
// //     ),
// //     Question(
// //       id: 2,
// //       text: "What does a red traffic light mean?",
// //       options: [
// //         AnswerOption(label: "A", text: "Stop", isCorrect: true),
// //         AnswerOption(label: "B", text: "Go", isCorrect: false),
// //         AnswerOption(label: "C", text: "Speed up", isCorrect: false),
// //         AnswerOption(label: "D", text: "Turn right", isCorrect: false),
// //       ],
// //     ),
// //     Question(
// //       id: 3,
// //       text: "Which sign indicates a school zone?",
// //       options: [
// //         AnswerOption(label: "A", text: "Stop sign", isCorrect: false),
// //         AnswerOption(label: "B", text: "Pedestrian sign", isCorrect: false),
// //         AnswerOption(
// //           label: "C",
// //           text: "Children crossing sign",
// //           isCorrect: true,
// //         ),
// //         AnswerOption(label: "D", text: "Hospital sign", isCorrect: false),
// //       ],
// //     ),
// //   ];

// //   final Map<int, Set<int>> selectedOptions = {};
// //   final List<int> skippedIndexes = [];

// //   void toggleOption(int qIndex, int optionIndex) {
// //     final currentSet = selectedOptions[qIndex] ?? <int>{};
// //     if (currentSet.contains(optionIndex)) {
// //       currentSet.remove(optionIndex);
// //     } else {
// //       currentSet.add(optionIndex);
// //     }
// //     selectedOptions[qIndex] = currentSet;
// //     notifyListeners();
// //   }

// //   bool isSelected(int qIndex, int optionIndex) {
// //     return selectedOptions[qIndex]?.contains(optionIndex) ?? false;
// //   }

// //   void nextQuestion() {
// //     if (!inRevisitMode) {
// //       if (currentIndex < questions.length - 1) {
// //         currentIndex++;
// //       } else if (skippedIndexes.isNotEmpty) {
// //         inRevisitMode = true;
// //         revisitIndex = 0;
// //       }
// //     } else {
// //       if (revisitIndex < skippedIndexes.length - 1) {
// //         revisitIndex++;
// //       } else {
// //         // quiz finished
// //       }
// //     }
// //     notifyListeners();
// //   }

// //   void skipQuestion() {
// //     if (!inRevisitMode) {
// //       skippedIndexes.add(currentIndex);
// //       nextQuestion();
// //     } else {
// //       nextQuestion(); // in revisit mode, skip acts like next
// //     }
// //   }

// //   Question get currentQuestion {
// //     if (!inRevisitMode) {
// //       return questions[currentIndex];
// //     } else {
// //       return questions[skippedIndexes[revisitIndex]];
// //     }
// //   }

// //   String get counterText {
// //     if (!inRevisitMode) {
// //       return "# ${currentIndex + 1} / ${questions.length}";
// //     } else {
// //       return "# ${revisitIndex + 1} / ${skippedIndexes.length}";
// //     }
// //   }

// //   double progress() {
// //     if (!inRevisitMode) {
// //       return (currentIndex + 1) / questions.length;
// //     } else {
// //       return (revisitIndex + 1) / skippedIndexes.length;
// //     }
// //   }

// //   /// --- Pause / Resume Methods ---
// //   void pauseQuiz() {
// //     _paused = true;
// //     notifyListeners();
// //   }

// //   void resumeQuiz() {
// //     _paused = false;
// //     notifyListeners();
// //   }
// // }
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:mdcat/models/question_model.dart';

// // class QuizProvider extends ChangeNotifier {
// //   bool isLoading = false;
// //   String? errorMessage;

// //   // Quiz state
// //   List<Question> questions = [];
// //   int currentIndex = 0;
// //   int revisitIndex = 0;
// //   bool inRevisitMode = false;
// //   // inside QuizProvider
// // void skipQuestion() {
// //   if (!skippedIndexes.contains(currentIndex)) {
// //     skippedIndexes.add(currentIndex);
// //   }

// //   // Move to next question if available
// //   if (currentIndex < questions.length - 1) {
// //     currentIndex++;
// //   } else {
// //     // If at end, maybe loop back or just stay
// //     inRevisitMode = true;
// //     revisitIndex = 0; // start revisiting skipped ones
// //   }

// //   notifyListeners();
// // }

// //   // Track skipped + selected options
// //   List<int> skippedIndexes = [];
// //   Map<int, String> selectedOptions = {};

// //   /// Fetch questions from API
// //   Future<bool> fetchQuestions(
// //     String subject,
// //     String className,
// //     int levelId,
// //   ) async {
// //     isLoading = true;
// //     errorMessage = null;
// //     notifyListeners();

// //     try {
// //       final url = Uri.parse("https://your-api.com/quiz"); // 👈 replace later
// //       final response = await http.post(
// //         url,
// //         headers: {"Content-Type": "application/json"},
// //         body: jsonEncode({
// //           "subject": subject,
// //           "class": className,
// //           "level": levelId,
// //         }),
// //       );

// //       if (response.statusCode == 200) {
// //         final data = jsonDecode(response.body);

// //         // Adjust key names according to your API
// //         final List<Question> loadedQuestions =
// //             (data["questions"] as List).map((q) {
// //           return Question.fromJson(q);
// //         }).toList();

// //         questions
// //           ..clear()
// //           ..addAll(loadedQuestions);

// //         // Reset state
// //         currentIndex = 0;
// //         revisitIndex = 0;
// //         inRevisitMode = false;
// //         skippedIndexes.clear();
// //         selectedOptions.clear();

// //         isLoading = false;
// //         notifyListeners();
// //         return true;
// //       } else {
// //         errorMessage = "Server error: ${response.statusCode}";
// //       }
// //     } catch (e) {
// //       errorMessage = "Failed to fetch quiz: $e";
// //     }

// //     isLoading = false;
// //     notifyListeners();
// //     return false;
// //   }

// //   // Example helper: move to next question
// //   void nextQuestion() {
// //     if (currentIndex < questions.length - 1) {
// //       currentIndex++;
// //       notifyListeners();
// //     }
// //   }
// // }
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:mdcat/models/question_model.dart';
// // import 'package:mdcat/models/answer_option_model.dart';

// // class QuizProvider extends ChangeNotifier {
// //   bool isLoading = false;
// //   String? errorMessage;

// //   // Quiz state
// //   List<Question> questions = [];
// //   int currentIndex = 0;
// //   int revisitIndex = 0;
// //   bool inRevisitMode = false;
// //   bool isPaused = false;

// //   // Track skipped + selected options
// //   List<int> skippedIndexes = [];
// //   Map<int, String> selectedOptions = {};

// //   /// Fetch questions from API
// //   Future<bool> fetchQuestions(
// //     String subject,
// //     String className,
// //     int levelId,
// //   ) async {
// //     isLoading = true;
// //     errorMessage = null;
// //     notifyListeners();

// //     try {
// //       final url = Uri.parse("https://your-api.com/quiz"); // 👈 replace with real URL
// //       final response = await http.post(
// //         url,
// //         headers: {"Content-Type": "application/json"},
// //         body: jsonEncode({
// //           "subject": subject,
// //           "class": className,
// //           "level": levelId,
// //         }),
// //       );

// //       if (response.statusCode == 200) {
// //         final data = jsonDecode(response.body);

// //         // Adjust key names according to your API
// //         final List<Question> loadedQuestions =
// //             (data["questions"] as List).map((q) {
// //           return Question.fromJson(q);
// //         }).toList();

// //         questions
// //           ..clear()
// //           ..addAll(loadedQuestions);

// //         // Reset state
// //         currentIndex = 0;
// //         revisitIndex = 0;
// //         inRevisitMode = false;
// //         skippedIndexes.clear();
// //         selectedOptions.clear();
// //         isPaused = false;

// //         isLoading = false;
// //         notifyListeners();
// //         return true;
// //       } else {
// //         errorMessage = "Server error: ${response.statusCode}";
// //       }
// //     } catch (e) {
// //       errorMessage = "Failed to fetch quiz: $e";
// //     }

// //     isLoading = false;
// //     notifyListeners();
// //     return false;
// //   }

// //   /// Move to next question
// //   void nextQuestion() {
// //     if (currentIndex < questions.length - 1) {
// //       currentIndex++;
// //       notifyListeners();
// //     }
// //   }

// //   /// Skip current question
// //   void skipQuestion() {
// //     if (!skippedIndexes.contains(currentIndex)) {
// //       skippedIndexes.add(currentIndex);
// //     }

// //     // Move to next question if available
// //     if (currentIndex < questions.length - 1) {
// //       currentIndex++;
// //     } else {
// //       // If at end, enter revisit mode
// //       inRevisitMode = true;
// //       revisitIndex = 0;
// //     }

// //     notifyListeners();
// //   }

// //   /// Pause the quiz
// //   void pauseQuiz() {
// //     isPaused = true;
// //     notifyListeners();
// //   }

// //   /// Resume the quiz
// //   void resumeQuiz() {
// //     isPaused = false;
// //     notifyListeners();
// //   }
// // }

// // // ======================= Question Model Update =======================
// // // Add fromJson factory method to your Question model for API parsing
// // extension QuestionParsing on Question {
// //   static Question fromJson(Map<String, dynamic> json) {
// //     return Question(
// //       id: json["id"] ?? 0,
// //       text: json["text"] ?? "",
// //       options: (json["options"] as List<dynamic>?)
// //               ?.map((o) => AnswerOption(
// //                     label: o["label"] ?? "",
// //                     text: o["text"] ?? "",
// //                     isCorrect: o["isCorrect"] ?? false,
// //                   ))
// //               .toList() ??
// //           [],
// //     );
// //   }
// // }
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:mdcat/models/question_model.dart';
// // import 'package:mdcat/models/answer_option_model.dart';

// // class QuizProvider extends ChangeNotifier {
// //   bool isLoading = false;
// //   String? errorMessage;

// //   // Quiz state
// //   List<Question> questions = [];
// //   int currentIndex = 0;
// //   int revisitIndex = 0;
// //   bool inRevisitMode = false;
// //   bool isPaused = false;

// //   // Track skipped + selected options
// //   List<int> skippedIndexes = [];
// //   Map<int, String> selectedOptions = {};

// //   /// Fetch questions from API
// //   Future<bool> fetchQuestions(String subject, String className, int levelId) async {
// //   isLoading = true;
// //   notifyListeners();

// //   try {
// //     final url = Uri.parse("http://47.130.103.135/api/student/filter-tests");
// //     final response = await http.post(
// //       url,
// //       headers: {
// //         "Content-Type": "application/json",
// //         "Authorization": "Bearer YOUR_TOKEN_HERE",
// //       },
// //       body: jsonEncode({
// //         "subject": subject,
// //         "class": className,
// //         "level": "Level $levelId",
// //       }),
// //     );

// //     if (response.statusCode == 200) {
// //       final data = jsonDecode(response.body);
// //       final tests = data["tests"] as List<dynamic>? ?? [];

// //       if (tests.isNotEmpty) {
// //         final questionsData = tests[0]["questions"] as List<dynamic>;
// //         questions = questionsData.map((q) => Question.fromJson(q)).toList();
// //         currentIndex = 0;
// //         skippedIndexes.clear();
// //         selectedOptions.clear();
// //         isLoading = false;
// //         notifyListeners();
// //         return true;
// //       } else {
// //         errorMessage = "No tests found";
// //       }
// //     } else {
// //       errorMessage = "Server Error: ${response.statusCode}";
// //     }
// //   } catch (e) {
// //     errorMessage = "Error: $e";
// //   }

// //   isLoading = false;
// //   notifyListeners();
// //   return false;
// // }

// //   // Future<bool> fetchQuestions(
// //   //   String subject,
// //   //   String className,
// //   //   int levelId,
// //   // ) async {
// //   //   isLoading = true;
// //   //   errorMessage = null;
// //   //   notifyListeners();

// //   //   try {
// //   //     final url = Uri.parse(
// //   //       "https://your-api.com/quiz",
// //   //     ); // Replace with real API
// //   //     final response = await http.post(
// //   //       url,
// //   //       headers: {"Content-Type": "application/json"},
// //   //       body: jsonEncode({
// //   //         "subject": subject,
// //   //         "class": className,
// //   //         "level": levelId,
// //   //       }),
// //   //     );

// //   //     if (response.statusCode == 200) {
// //   //       final data = jsonDecode(response.body);

// //   //       // Parse questions
// //   //       final List<Question> loadedQuestions = (data["questions"] as List).map((
// //   //         q,
// //   //       ) {
// //   //         return Question.fromJson(q);
// //   //       }).toList();

// //   //       questions
// //   //         ..clear()
// //   //         ..addAll(loadedQuestions);

// //   //       // Reset state
// //   //       currentIndex = 0;
// //   //       revisitIndex = 0;
// //   //       inRevisitMode = false;
// //   //       skippedIndexes.clear();
// //   //       selectedOptions.clear();
// //   //       isPaused = false;

// //   //       isLoading = false;
// //   //       notifyListeners();
// //   //       return true;
// //   //     } else {
// //   //       errorMessage = "Server error: ${response.statusCode}";
// //   //     }
// //   //   } catch (e) {
// //   //     errorMessage = "Failed to fetch quiz: $e";
// //   //   }

// //   //   isLoading = false;
// //   //   notifyListeners();
// //   //   return false;
// //   // }

// //   /// Move to next question
// //   void nextQuestion() {
// //     if (currentIndex < questions.length - 1) {
// //       currentIndex++;
// //       notifyListeners();
// //     }
// //   }

// //   /// Skip current question
// //   void skipQuestion() {
// //     if (!skippedIndexes.contains(currentIndex)) {
// //       skippedIndexes.add(currentIndex);
// //     }

// //     // Move to next question if available
// //     if (currentIndex < questions.length - 1) {
// //       currentIndex++;
// //     } else {
// //       // If at end, enter revisit mode
// //       inRevisitMode = true;
// //       revisitIndex = 0;
// //     }

// //     notifyListeners();
// //   }

// //   /// Pause the quiz
// //   void pauseQuiz() {
// //     isPaused = true;
// //     notifyListeners();
// //   }

// //   /// Resume the quiz
// //   void resumeQuiz() {
// //     isPaused = false;
// //     notifyListeners();
// //   }

// //   /// Check if an option is selected
// //   bool isSelected(int questionIndex, int optionIndex) {
// //     return selectedOptions[questionIndex] ==
// //         questions[questionIndex].options[optionIndex].label;
// //   }

// //   /// Select/toggle an option
// //   void toggleOption(int questionIndex, int optionIndex) {
// //     final option = questions[questionIndex].options[optionIndex];

// //     // Update selected option
// //     selectedOptions[questionIndex] = option.label;

// //     // Update isSelected flag for UI
// //     for (var o in questions[questionIndex].options) {
// //       o.isSelected = (o.label == option.label);
// //     }

// //     notifyListeners();
// //   }
// // }

// // // ======================= Question Model Update =======================
// // // Add fromJson factory method to your Question model for API parsing
// // extension QuestionParsing on Question {
// //   static Question fromJson(Map<String, dynamic> json) {
// //     return Question(
// //       id: json["id"] ?? 0,
// //       text: json["text"] ?? "",
// //       options:
// //           (json["options"] as List<dynamic>?)
// //               ?.map(
// //                 (o) => AnswerOption(
// //                   label: o["label"] ?? "",
// //                   text: o["text"] ?? "",
// //                   isCorrect: o["isCorrect"] ?? false,
// //                 ),
// //               )
// //               .toList() ??
// //           [],
// //     );
// //   }
// // }

// ///real api integration code

// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:mdcat/models/answer_option_model.dart';
// // import 'package:mdcat/models/question_model.dart';
// // // import 'package:mdcat/models/answer_option_model.dart';

// // class QuizProvider extends ChangeNotifier {
// //   bool isLoading = false;
// //   String? errorMessage;

// //   // Quiz state
// //   List<Question> questions = [];
// //   int currentIndex = 0;
// //   int revisitIndex = 0;
// //   bool inRevisitMode = false;
// //   bool isPaused = false;

// //   // Track skipped + selected options
// //   List<int> skippedIndexes = [];
// //   Map<int, String> selectedOptions = {};

// //   /// Fetch questions from real API
// // Future<bool> fetchQuestions(
// //   String subject,
// //   String className,
// //   int levelId,
// // ) async {
// //   isLoading = true;
// //   errorMessage = null;
// //   notifyListeners();

// //   try {
// //     final url = Uri.parse("http://47.130.103.135/api/student/filter-tests");

// //     // Build the request body exactly as the API expects
// //     final body = jsonEncode({
// //       "level": "Level $levelId",   // convert integer → "Level 1"
// //       "subject": subject,
// //       "class": "$className",       // ensure it's a string
// //     });

// //     // Include all required headers
// //     final headers = {
// //       "Cache-Control": "no-cache",
// //       "Postman-Token": "<calculated when request is sent>",
// //       "Content-Type": "application/json",
// //       "Accept": "*/*",
// //       "Accept-Encoding": "gzip, deflate, br",
// //       "Connection": "keep-alive",
// //       "Authorization":
// //           "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4OWMzMjczYTI4M2Q4OTVhYmE5OGY4YyIsInJvbGUiOiJzdHVkZW50IiwiaWF0IjoxNzU3NDg0MDc0LCJleHAiOjE3NTgwODg4NzR9.Ea_avM_jQTM8zBB4r4MGW7_uW0pdnxxr1_-uztJ77Yo"
// //     };

// //     final response = await http.post(url, headers: headers, body: body);

// //     if (response.statusCode == 200) {
// //       final data = jsonDecode(response.body);

// //       if (data["count"] == 0) {
// //         errorMessage = "No test found for selected subject/class/level";
// //         isLoading = false;
// //         notifyListeners();
// //         return false;
// //       }

// //       final tests = data["tests"] as List<dynamic>;
// //       final questionsList = tests[0]["questions"] as List<dynamic>;

// //       // Map API response to your Question model
// //       questions = questionsList.map((q) {
// //         final options = q["options"] as List<dynamic>;
// //         final correctIndex = (q["correctOption"] ?? 1) - 1; // API is 1-based
// //         return Question(
// //           id: q["_id"].hashCode, // generate a unique id
// //           text: q["question"] ?? "",
// //           options: List.generate(options.length, (i) {
// //             return AnswerOption(
// //               label: String.fromCharCode(65 + i) + ".", // A., B., C., D.
// //               text: options[i] ?? "",
// //               isCorrect: i == correctIndex,
// //             );
// //           }),
// //         );
// //       }).toList();

// //       // Reset state
// //       currentIndex = 0;
// //       revisitIndex = 0;
// //       inRevisitMode = false;
// //       skippedIndexes.clear();
// //       selectedOptions.clear();
// //       isPaused = false;

// //       isLoading = false;
// //       notifyListeners();
// //       return true;
// //     } else {
// //       errorMessage = "Server error: ${response.statusCode}";
// //     }
// //   } catch (e) {
// //     errorMessage = "Failed to fetch quiz: $e";
// //   }

// //   isLoading = false;
// //   notifyListeners();
// //   return false;
// // }

// //   // Future<bool> fetchQuestions(
// //   //   String subject,
// //   //   String className,
// //   //   String level,
// //   // ) async {
// //   //   isLoading = true;
// //   //   errorMessage = null;
// //   //   notifyListeners();

// //   //   try {
// //   //     final url = Uri.parse("http://47.130.103.135/api/student/filter-tests");

// //   //     final response = await http.post(
// //   //       url,
// //   //       headers: {
// //   //         "Cache-Control": "no-cache",
// //   //         "Content-Type": "application/json",
// //   //         "Accept": "*/*",
// //   //         "Accept-Encoding": "gzip, deflate, br",
// //   //         "Connection": "keep-alive",
// //   //         "Authorization":
// //   //             "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4OWMzMjczYTI4M2Q4OTVhYmE5OGY4YyIsInJvbGUiOiJzdHVkZW50IiwiaWF0IjoxNzU3NDg0MDc0LCJleHAiOjE3NTgwODg4NzR9.Ea_avM_jQTM8zBB4r4MGW7_uW0pdnxxr1_-uztJ77Yo",
// //   //         "User-Agent": "PostmanRuntime/7.46.0",
// //   //         "Host": "47.130.103.135",
// //   //         "Postman-Token": "<calculated when request is sent>",
// //   //         // "Content-Length": "<calculated when request is sent>",
// //   //       },
// //   //       body: jsonEncode({
// //   //         "level": "Level $level", // converts 1 → "Level 1"
// //   //         "subject": subject, // as is
// //   //         "class": "$className", // converts 11 → "11"
// //   //       }),

// //   //       // body: jsonEncode({
// //   //       //   "level": level,
// //   //       //   "subject": subject,
// //   //       //   "class": className,
// //   //       // }),
// //   //     );

// //   //     if (response.statusCode == 200) {
// //   //       final data = jsonDecode(response.body);

// //   //       if (data["count"] != null && data["count"] > 0) {
// //   //         final tests = data["tests"] as List<dynamic>;
// //   //         final firstTest = tests[0]; // Get first test

// //   //         final List<Question> loadedQuestions =
// //   //             (firstTest["questions"] as List<dynamic>).map((q) {
// //   //               return Question.fromJson(q);
// //   //             }).toList();

// //   //         questions
// //   //           ..clear()
// //   //           ..addAll(loadedQuestions);

// //   //         // Reset state
// //   //         currentIndex = 0;
// //   //         revisitIndex = 0;
// //   //         inRevisitMode = false;
// //   //         skippedIndexes.clear();
// //   //         selectedOptions.clear();
// //   //         isPaused = false;

// //   //         isLoading = false;
// //   //         notifyListeners();
// //   //         return true;
// //   //       } else {
// //   //         errorMessage = "No tests found for selected subject/class/level";
// //   //       }
// //   //     } else {
// //   //       errorMessage = "Server error: ${response.statusCode}";
// //   //     }
// //   //   } catch (e) {
// //   //     errorMessage = "Failed to fetch quiz: $e";
// //   //   }

// //   //   isLoading = false;
// //   //   notifyListeners();
// //   //   return false;
// //   // }

// //   /// Move to next question
// //   void nextQuestion() {
// //     if (currentIndex < questions.length - 1) {
// //       currentIndex++;
// //       notifyListeners();
// //     }
// //   }

// //   /// Skip current question
// //   void skipQuestion() {
// //     if (!skippedIndexes.contains(currentIndex)) {
// //       skippedIndexes.add(currentIndex);
// //     }

// //     // Move to next question if available
// //     if (currentIndex < questions.length - 1) {
// //       currentIndex++;
// //     } else {
// //       // If at end, enter revisit mode
// //       inRevisitMode = true;
// //       revisitIndex = 0;
// //     }

// //     notifyListeners();
// //   }

// //   /// Pause the quiz
// //   void pauseQuiz() {
// //     isPaused = true;
// //     notifyListeners();
// //   }

// //   /// Resume the quiz
// //   void resumeQuiz() {
// //     isPaused = false;
// //     notifyListeners();
// //   }

// //   /// Toggle option selection
// //   void toggleOption(int questionIndex, int optionIndex) {
// //     final question = questions[questionIndex];
// //     final selectedLabel = question.options[optionIndex].label;

// //     // Deselect all other options for single choice
// //     for (var opt in question.options) {
// //       opt.isSelected = false;
// //     }

// //     // Toggle selected option
// //     question.options[optionIndex].isSelected = true;
// //     selectedOptions[questionIndex] = selectedLabel;

// //     notifyListeners();
// //   }

// //   /// Check if option is selected
// //   bool isSelected(int questionIndex, int optionIndex) {
// //     final question = questions[questionIndex];
// //     return question.options[optionIndex].isSelected;
// //   }
// // }
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:mdcat/models/question_model.dart';
// // // import 'package:mdcat/models/answer_option_model.dart';

// // class QuizProvider extends ChangeNotifier {
// //   bool isLoading = false;
// //   String? errorMessage;
// //   bool isPaused = false;

// //   // Quiz state
// //   List<Question> questions = [];
// //   int currentIndex = 0;
// //   int revisitIndex = 0;
// //   bool inRevisitMode = false;

// //   // Track skipped questions
// //   List<int> skippedIndexes = [];
// //   // Track selected options: key = questionIndex, value = optionLabel
// //   Map<int, String> selectedOptions = {};

// //   /// Fetch questions from API
// //   Future<bool> fetchQuestions(
// //       String subject, String className, String level) async {
// //     isLoading = true;
// //     errorMessage = null;
// //     notifyListeners();

// //     try {
// //       final url = Uri.parse("http://47.130.103.135/api/student/filter-tests");
// //       final response = await http.post(
// //         url,
// //         headers: {
// //           "Content-Type": "application/json",
// //           "Authorization":
// //               "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4OWMzMjczYTI4M2Q4OTVhYmE5OGY4YyIsInJvbGUiOiJzdHVkZW50IiwiaWF0IjoxNzU3NDg0MDc0LCJleHAiOjE3NTgwODg4NzR9.Ea_avM_jQTM8zBB4r4MGW7_uW0pdnxxr1_-uztJ77Yo",
// //         },
// //         body: jsonEncode({
// //           "level": level,
// //           "subject": subject,
// //           "class": className,
// //         }),
// //       );

// //       if (response.statusCode == 200) {
// //         final data = jsonDecode(response.body);

// //         if (data["count"] == 0 || data["tests"].isEmpty) {
// //           errorMessage = "No test found for selected subject/class/level";
// //           isLoading = false;
// //           notifyListeners();
// //           return false;
// //         }

// //         // Extract questions from the first test
// //         final List<dynamic> questionsList = data["tests"][0]["questions"];

// //         questions = questionsList.map((q) => Question.fromApi(q)).toList();

// //         // Reset quiz state
// //         currentIndex = 0;
// //         revisitIndex = 0;
// //         inRevisitMode = false;
// //         skippedIndexes.clear();
// //         selectedOptions.clear();
// //         isPaused = false;

// //         isLoading = false;
// //         notifyListeners();
// //         return true;
// //       } else {
// //         errorMessage = "Server error: ${response.statusCode}";
// //       }
// //     } catch (e) {
// //       errorMessage = "Failed to fetch quiz: $e";
// //     }

// //     isLoading = false;
// //     notifyListeners();
// //     return false;
// //   }

// //   /// Move to next question
// //   void nextQuestion() {
// //     if (currentIndex < questions.length - 1) {
// //       currentIndex++;
// //       notifyListeners();
// //     }
// //   }

// //   /// Skip current question
// //   void skipQuestion() {
// //     if (!skippedIndexes.contains(currentIndex)) {
// //       skippedIndexes.add(currentIndex);
// //     }

// //     if (currentIndex < questions.length - 1) {
// //       currentIndex++;
// //     } else {
// //       inRevisitMode = true;
// //       revisitIndex = 0;
// //     }

// //     notifyListeners();
// //   }

// //   /// Pause quiz
// //   void pauseQuiz() {
// //     isPaused = true;
// //     notifyListeners();
// //   }

// //   /// Resume quiz
// //   void resumeQuiz() {
// //     isPaused = false;
// //     notifyListeners();
// //   }

// //   /// Toggle option selection for a question
// //   void toggleOption(int questionIndex, int optionIndex) {
// //     final question = questions[questionIndex];
// //     for (var i = 0; i < question.options.length; i++) {
// //       question.options[i].isSelected = (i == optionIndex);
// //     }
// //     selectedOptions[questionIndex] =
// //         question.options[optionIndex].label; // Track selected label
// //     notifyListeners();
// //   }

// //   /// Check if option is selected
// //   bool isSelected(int questionIndex, int optionIndex) {
// //     final question = questions[questionIndex];
// //     return question.options[optionIndex].isSelected;
// //   }
// // }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:mdcat/services/token_storage.dart';

// import 'package:mdcat/models/question_model.dart';

// class QuizProvider extends ChangeNotifier {
//   bool isLoading = false;
//   String? errorMessage;
//   bool isPaused = false;

//   // Quiz state
//   List<Question> questions = [];
//   int currentIndex = 0;
//   int revisitIndex = 0;
//   bool inRevisitMode = false;

//   // Track skipped questions
//   List<int> skippedIndexes = [];
//   // Track selected options: key = questionIndex, value = optionLabel
//   Map<int, String> selectedOptions = {};

//   Future<bool> fetchQuestions(
//     String subject,
//     String className,
//     String level,
//   ) async {
//     isLoading = true;
//     errorMessage = null;
//     notifyListeners();

//     try {
//       final url = Uri.parse("http://47.130.103.135/api/student/filter-tests");

//       final body = {
//         "level": level.trim(),
//         "subject": subject.trim(),
//         "class": className.toString().trim(),
//       };

//       debugPrint("🔹 Sending Body: ${jsonEncode(body)}");

//       // ✅ Get token from TokenStorage
//       final token = await TokenStorage.getToken();
//       if (token == null || token.isEmpty) {
//         errorMessage = "No token found. Please login again.";
//         isLoading = false;
//         notifyListeners();
//         return false;
//       }

//       final response = await http.post(
//         url,
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $token", // ✅ use saved token
//         },
//         body: jsonEncode(body),
//       );

//       debugPrint("🔹 Response Status: ${response.statusCode}");
//       debugPrint("🔹 Response Body: ${response.body}");

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         if (data["count"] == 0 || data["tests"].isEmpty) {
//           errorMessage = "No test found for selected subject/class/level";
//           isLoading = false;
//           notifyListeners();
//           return false;
//         }

//         // Extract questions from the first test
//         final List<dynamic> questionsList = data["tests"][0]["questions"];

//         questions = questionsList.map((q) => Question.fromApi(q)).toList();

//         // Reset quiz state
//         currentIndex = 0;
//         revisitIndex = 0;
//         inRevisitMode = false;
//         skippedIndexes.clear();
//         selectedOptions.clear();
//         isPaused = false;

//         isLoading = false;
//         notifyListeners();
//         return true;
//       } else {
//         errorMessage = "Server error: ${response.statusCode}";
//       }
//     } catch (e) {
//       errorMessage = "Failed to fetch quiz: $e";
//     }

//     isLoading = false;
//     notifyListeners();
//     return false;
//   }

//   /// Fetch questions from API
//   // Future<bool> fetchQuestions(
//   //   String subject,
//   //   String className,
//   //   String level,
//   // ) async {
//   //   isLoading = true;
//   //   errorMessage = null;
//   //   notifyListeners();

//   //   try {
//   //     final url = Uri.parse("http://47.130.103.135/api/student/filter-tests");

//   //     final body = {
//   //       "level": level.trim(),
//   //       "subject": subject.trim(),
//   //       "class": className.toString().trim(),
//   //     };

//   //     debugPrint("🔹 Sending Body: ${jsonEncode(body)}");

//   //     final response = await http.post(
//   //       url,
//   //       headers: {
//   //         "Content-Type": "application/json",
//   //         "Authorization":
//   //             "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4OWMzMjczYTI4M2Q4OTVhYmE5OGY4YyIsInJvbGUiOiJzdHVkZW50IiwiaWF0IjoxNzU3NDg0MDc0LCJleHAiOjE3NTgwODg4NzR9.Ea_avM_jQTM8zBB4r4MGW7_uW0pdnxxr1_-uztJ77Yo",
//   //       },
//   //       body: jsonEncode(body),
//   //     );

//   //     debugPrint("🔹 Response Status: ${response.statusCode}");
//   //     debugPrint("🔹 Response Body: ${response.body}");

//   //     if (response.statusCode == 200) {
//   //       final data = jsonDecode(response.body);

//   //       if (data["count"] == 0 || data["tests"].isEmpty) {
//   //         errorMessage = "No test found for selected subject/class/level";
//   //         isLoading = false;
//   //         notifyListeners();
//   //         return false;
//   //       }

//   //       // Extract questions from the first test
//   //       final List<dynamic> questionsList = data["tests"][0]["questions"];

//   //       questions = questionsList.map((q) => Question.fromApi(q)).toList();

//   //       // Reset quiz state
//   //       currentIndex = 0;
//   //       revisitIndex = 0;
//   //       inRevisitMode = false;
//   //       skippedIndexes.clear();
//   //       selectedOptions.clear();
//   //       isPaused = false;

//   //       isLoading = false;
//   //       notifyListeners();
//   //       return true;
//   //     } else {
//   //       errorMessage = "Server error: ${response.statusCode}";
//   //     }
//   //   } catch (e) {
//   //     errorMessage = "Failed to fetch quiz: $e";
//   //   }

//   //   isLoading = false;
//   //   notifyListeners();
//   //   return false;
//   // }

//   /// Move to next question
//   void nextQuestion() {
//     if (currentIndex < questions.length - 1) {
//       currentIndex++;
//       notifyListeners();
//     }
//   }

//   /// Skip current question
//   void skipQuestion() {
//     if (!skippedIndexes.contains(currentIndex)) {
//       skippedIndexes.add(currentIndex);
//     }

//     if (currentIndex < questions.length - 1) {
//       currentIndex++;
//     } else {
//       inRevisitMode = true;
//       revisitIndex = 0;
//     }

//     notifyListeners();
//   }

//   /// Pause quiz
//   void pauseQuiz() {
//     isPaused = true;
//     notifyListeners();
//   }

//   /// Resume quiz
//   void resumeQuiz() {
//     isPaused = false;
//     notifyListeners();
//   }

//   /// Toggle option selection for a question
//   void toggleOption(int questionIndex, int optionIndex) {
//     final question = questions[questionIndex];
//     for (var i = 0; i < question.options.length; i++) {
//       question.options[i].isSelected = (i == optionIndex);
//     }
//     selectedOptions[questionIndex] =
//         question.options[optionIndex].label; // Track selected label
//     notifyListeners();
//   }

//   /// Check if option is selected
//   bool isSelected(int questionIndex, int optionIndex) {
//     final question = questions[questionIndex];
//     return question.options[optionIndex].isSelected;
//   }
// }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:mdcat/services/token_storage.dart';

// import 'package:mdcat/models/question_model.dart';

// class QuizProvider extends ChangeNotifier {
//   bool isLoading = false;
//   String? errorMessage;
//   bool isPaused = false;

//   // Quiz state
//   List<Question> questions = [];
//   int currentIndex = 0;
//   int revisitIndex = 0;
//   bool inRevisitMode = false;

//   // Track skipped questions
//   List<int> skippedIndexes = [];
//   // Track selected options: key = questionIndex, value = optionLabel
//   Map<int, String> selectedOptions = {};

//   Future<bool> fetchQuestions(
//     String subject,
//     String className,
//     String level,
//   ) async {
//     isLoading = true;
//     errorMessage = null;
//     notifyListeners();

//     try {
//       final url = Uri.parse("http://47.130.103.135/api/student/filter-tests");

//       final body = {
//         "level": level.trim(),
//         "subject": subject.trim(),
//         "class": className.toString().trim(),
//       };

//       debugPrint("🔹 Sending Body: ${jsonEncode(body)}");

//       // ✅ Get token from TokenStorage
//       final token = await TokenStorage.getToken();
//       if (token == null || token.isEmpty) {
//         errorMessage = "No token found. Please login again.";
//         isLoading = false;
//         notifyListeners();
//         return false;
//       }

//       final response = await http.post(
//         url,
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": token, // ✅ use saved token here
//         },
//         body: jsonEncode(body),
//       );

//       debugPrint("🔹 Response Status: ${response.statusCode}");
//       debugPrint("🔹 Response Body: ${response.body}");

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         if (data["count"] == 0 || data["tests"].isEmpty) {
//           errorMessage = "No test found for selected subject/class/level";
//           isLoading = false;
//           notifyListeners();
//           return false;
//         }

//         // Extract questions from the first test
//         final List<dynamic> questionsList = data["tests"][0]["questions"];

//         questions = questionsList.map((q) => Question.fromApi(q)).toList();

//         // Reset quiz state
//         currentIndex = 0;
//         revisitIndex = 0;
//         inRevisitMode = false;
//         skippedIndexes.clear();
//         selectedOptions.clear();
//         isPaused = false;

//         isLoading = false;
//         notifyListeners();
//         return true;
//       } else {
//         errorMessage = "Server error: ${response.statusCode}";
//       }
//     } catch (e) {
//       errorMessage = "Failed to fetch quiz: $e";
//     }

//     isLoading = false;
//     notifyListeners();
//     return false;
//   }

//   /// Move to next question
//   void nextQuestion() {
//     if (currentIndex < questions.length - 1) {
//       currentIndex++;
//       notifyListeners();
//     }
//   }

//   /// Skip current question
//   void skipQuestion() {
//     if (!skippedIndexes.contains(currentIndex)) {
//       skippedIndexes.add(currentIndex);
//     }

//     if (currentIndex < questions.length - 1) {
//       currentIndex++;
//     } else {
//       inRevisitMode = true;
//       revisitIndex = 0;
//     }

//     notifyListeners();
//   }

//   /// Pause quiz
//   void pauseQuiz() {
//     isPaused = true;
//     notifyListeners();
//   }

//   /// Resume quiz
//   void resumeQuiz() {
//     isPaused = false;
//     notifyListeners();
//   }

//   /// Toggle option selection for a question
//   void toggleOption(int questionIndex, int optionIndex) {
//     final question = questions[questionIndex];
//     for (var i = 0; i < question.options.length; i++) {
//       question.options[i].isSelected = (i == optionIndex);
//     }
//     selectedOptions[questionIndex] =
//         question.options[optionIndex].label; // Track selected label
//     notifyListeners();
//   }

// ignore_for_file: unused_local_variable

//   /// Check if option is selected
//   bool isSelected(int questionIndex, int optionIndex) {
//     final question = questions[questionIndex];
//     return question.options[optionIndex].isSelected;
//   }
// }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// // import 'package:mdcat/services/token_storage.dart';
// import 'package:mdcat/models/question_model.dart';

// class QuizProvider extends ChangeNotifier {
//   bool isLoading = false;
//   String? errorMessage;
//   bool isPaused = false;

//   // Quiz state
//   List<Question> questions = [];
//   int currentIndex = 0;
//   int revisitIndex = 0;
//   bool inRevisitMode = false;

//   // Track skipped questions
//   List<int> skippedIndexes = [];
//   // Track selected options: key = questionIndex, value = optionLabel
//   Map<int, String> selectedOptions = {};

//   // 🔹 Attempt ID (after calling attempt-test API)
//   // String? attemptId;

//   /// 🔹 Step 2: Fetch Questions after attempt
//   Future<bool> fetchQuestions(
//     String level,
//     String subject,
//     String studentClass,
//   ) async {
//     try {
//       final response = await http.post(
//         Uri.parse("http://47.130.103.135/api/student/filter-tests"),
//         headers: {
//           "Authorization": "token",
//           "Content-Type": "application/json",
//         },
//         body: jsonEncode({
//           "level": level,
//           "subject": subject,
//           "class": studentClass,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         // store test data into your model/provider
//         return true;
//       }
//       return false;
//     } catch (e) {
//       debugPrint("Error in fetchQuestions: $e");
//       return false;
//     }
//   }

//   /// Move to next question
//   void nextQuestion() {
//     if (currentIndex < questions.length - 1) {
//       currentIndex++;
//       notifyListeners();
//     }
//   }

//   /// Skip current question
//   void skipQuestion() {
//     if (!skippedIndexes.contains(currentIndex)) {
//       skippedIndexes.add(currentIndex);
//     }

//     if (currentIndex < questions.length - 1) {
//       currentIndex++;
//     } else {
//       inRevisitMode = true;
//       revisitIndex = 0;
//     }

//     notifyListeners();
//   }

//   /// Pause quiz
//   void pauseQuiz() {
//     isPaused = true;
//     notifyListeners();
//   }

//   /// Resume quiz
//   void resumeQuiz() {
//     isPaused = false;
//     notifyListeners();
//   }

//   /// Toggle option selection for a question
//   void toggleOption(int questionIndex, int optionIndex) {
//     final question = questions[questionIndex];
//     for (var i = 0; i < question.options.length; i++) {
//       question.options[i].isSelected = (i == optionIndex);
//     }
//     selectedOptions[questionIndex] =
//         question.options[optionIndex].label; // Track selected label
//     notifyListeners();
//   }

//   /// Check if option is selected
//   bool isSelected(int questionIndex, int optionIndex) {
//     final question = questions[questionIndex];
//     return question.options[optionIndex].isSelected;
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mdcat/models/question_model.dart';
import 'package:mdcat/services/token_storage.dart';

class QuizProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  bool isPaused = false;

  // Quiz state
  List<Question> questions = [];
  int currentIndex = 0;
  int revisitIndex = 0;
  bool inRevisitMode = false;

  // Track skipped questions
  List<int> skippedIndexes = [];
  // Track selected options: key = questionIndex, value = optionLabel
  Map<int, String> selectedOptions = {};

  /// 🔹 Step 2: Fetch Questions after attempt
  Future<bool> fetchQuestions(
    String level,
    String subject,
    String studentClass,
  ) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final token = await TokenStorage.getToken();
      if (token == null || token.isEmpty) {
        errorMessage = "No token found. Please login again.";
        isLoading = false;
        notifyListeners();
        return false;
      }

      final response = await http.post(
        Uri.parse("http://47.130.103.135/api/student/filter-tests"),
        headers: {"Authorization": token, "Content-Type": "application/json"},
        body: jsonEncode({
          "level": level,
          "subject": subject,
          "class": studentClass,
        }),
      );

      debugPrint("🔹 fetchQuestions Status: ${response.statusCode}");
      debugPrint("🔹 fetchQuestions Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // ✅ Parse questions from API response
        if (data['tests'] != null &&
            data['tests'] is List &&
            data['tests'].isNotEmpty) {
          final test = data['tests'][0]; // take first test
          if (test['questions'] != null && test['questions'] is List) {
            questions = (test['questions'] as List)
                .map((q) => Question.fromApi(q))
                .toList();
            isLoading = false;
            notifyListeners();
            return questions.isNotEmpty;
          } else {
            errorMessage = "No questions found in this test.";
          }
        } else {
          errorMessage = "No tests found for given filter.";
        }

        // if (data['questions'] != null && data['questions'] is List) {
        //   questions = (data['questions'] as List)
        //       // .map((q) => Question.fromJson(q))
        //       .map((q) => Question.fromApi(q))
        //       .toList();
        //   isLoading = false;
        //   notifyListeners();
        //   return questions.isNotEmpty;
        // } else {
        //   errorMessage = "No questions found in the API response.";
        // }
      } else {
        errorMessage = "Server error: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage = "Failed to fetch questions: $e";
    }

    isLoading = false;
    notifyListeners();
    return false;
  }

  /// Move to next question
  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      currentIndex++;
      notifyListeners();
    }
  }

  /// Skip current question
  void skipQuestion() {
    if (!skippedIndexes.contains(currentIndex)) {
      skippedIndexes.add(currentIndex);
    }

    if (currentIndex < questions.length - 1) {
      currentIndex++;
    } else {
      inRevisitMode = true;
      revisitIndex = 0;
    }

    notifyListeners();
  }

  /// Pause quiz
  void pauseQuiz() {
    isPaused = true;
    notifyListeners();
  }

  /// Resume quiz
  void resumeQuiz() {
    isPaused = false;
    notifyListeners();
  }

  /// Toggle option selection for a question
  void toggleOption(int questionIndex, int optionIndex) {
    final question = questions[questionIndex];
    for (var i = 0; i < question.options.length; i++) {
      question.options[i].isSelected = (i == optionIndex);
    }
    selectedOptions[questionIndex] =
        question.options[optionIndex].label; // Track selected label
    notifyListeners();
  }

  /// Check if option is selected
  bool isSelected(int questionIndex, int optionIndex) {
    final question = questions[questionIndex];
    return question.options[optionIndex].isSelected;
  }
}
