import 'package:flutter/material.dart';
import 'package:mdcat/providers/category_provider_home.dart';
import 'package:mdcat/providers/class_selection_provider.dart';
import 'package:mdcat/providers/home_provider.dart';
import 'package:mdcat/providers/quiz_provider.dart';
import 'package:mdcat/providers/subject_provider.dart';
// import 'package:mdcat/view/demo_test_dialogue.dart';
// import 'package:mdcat/view/demo_test_dialogue.dart';
import 'package:mdcat/view/notification_screen.dart';
import 'package:mdcat/view/quiz_screen.dart';
import 'package:mdcat/widgets/demo-test_dialogue.dart';
// import 'package:mdcat/widgets/demo-test_dialogue.dart';
// import 'package:mdcat/widgets/demo-test_dialogue.dart';
import 'package:provider/provider.dart';
import 'package:mdcat/view/level_screen.dart';
import 'package:mdcat/widgets/category_card.dart';
import 'package:mdcat/widgets/class_selection_dialogue.dart';
// import 'package:mdcat/widgets/demo-test_dialogue.dart';
import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'home_provider.dart';
// import 'category_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<CategoryProvider>();
      if (provider.categories.isEmpty) {
        provider.fetchSubjects();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    final categoryProvider = context.watch<CategoryProvider>();
    final categories = categoryProvider.categories;
    final filteredCategories = categories.where((cat) {
      final matchesFilter =
          homeProvider.searchFilter == "All" ||
          cat.title.toLowerCase() == homeProvider.searchFilter.toLowerCase();

      final matchesQuery = cat.title.toLowerCase().contains(
        homeProvider.searchQuery.trim().toLowerCase(),
      );

      return matchesFilter && matchesQuery;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ======= Top Greeting + Search + Encircled Bell =======
              // ======= Top Greeting + Search + Encircled Bell with Noise =======
              Container(
                height: 185,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(124, 81, 219, 1), // top color
                      Color.fromRGBO(188, 157, 246, 1), // bottom color
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
                child: Stack(
                  children: [
                    // Noise overlay (monotone effect)
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.08, // subtle effect
                        child: Image.asset(
                          "assets/images/noise.webp",
                          fit: BoxFit.cover,
                          repeat: ImageRepeat.repeat,
                        ),
                      ),
                    ),
                    // Encircled Bell
                    Positioned(
                      right: 12,
                      top: 12,
                      // child: NotificationBell(countListenable: homeProvider),
                      child: const NotificationBell(),
                    ),
                    // Content (Hello + Search bar)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder<String>(
                            future: SharedPreferences.getInstance().then(
                              (prefs) => prefs.getString('user_name') ?? 'User',
                            ),
                            builder: (context, snapshot) {
                              final name = snapshot.data ?? 'User';
                              return Text(
                                "Hello,\n$name !",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  height: 1.2,
                                  fontWeight: FontWeight.w700,
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 10),

                          // ===== Coin Display =====
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(
                                0.2,
                              ), // semi-transparent background
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.monetization_on,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  "120",
                                  // "${homeProvider.coins}", // replace with actual coins value
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Spacer(),
                          // 🔍 Search bar...
                          Container(
                            height: 46,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  color: Color(0xFFB7B7B7),
                                ),
                                const SizedBox(width: 8),

                                //
                                Expanded(
                                  child: TextField(
                                    onChanged: (value) =>
                                        homeProvider.setSearchQuery(value),
                                    decoration: const InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        color: Color(0xFFB7B7B7),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                // In your search TextField
                                // const Expanded(
                                //   child: TextField(
                                //     decoration: InputDecoration(
                                //       hintText: "Search",
                                //       hintStyle: TextStyle(
                                //         color: Color(0xFFB7B7B7),
                                //       ),
                                //       border: InputBorder.none,
                                //     ),
                                //   ),
                                // ),
                                DropdownButton<String>(
                                  value: homeProvider.searchFilter,
                                  underline: const SizedBox(),
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Color(0xFFB7B7B7),
                                  ),
                                  items:
                                      const [
                                            "All",
                                            "Physics",
                                            "Biology",
                                            "Maths",
                                            "Chemistry",
                                            "English",
                                          ]
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Color(0xFFB7B7B7),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                  onChanged: (v) {
                                    if (v != null)
                                      homeProvider.setSearchFilter(v);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Explore categories",
                    style: TextStyle(
                      color: Color(0xFF1F1F1F),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const DemoTestDialog(),
                      );
                    },
                    child: const Text(
                      "Demo Test",
                      style: TextStyle(
                        color: Color(0xFF8C59FF),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // ======= Categories Grid =======
              // 🔹 Filter categories based on dropdown and search text
              if (categoryProvider.isLoading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(40.0),
                    child: CircularProgressIndicator(color: Color(0xFF8C59FF)),
                  ),
                )
              else if (categoryProvider.errorMessage != null)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      categoryProvider.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                )
              else
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.25,
                // children: categories.map((Category cat) {
                children: filteredCategories.map((Category cat) {
                  return CategoryCard(
                    image: cat.image,
                    title: cat.title,
                    subtitle: cat.subtitle,
                    color: cat.color,
                    onTap: cat.isEnabled
                        ? () async {
                            final screenContext = context;
                            // if (cat.title == "Mockup Test") {
                            //
                            //
                            //
                            //
                            //   final subject = "Maths"; // DB mein jo subject hai woh likhو
                            //   final className = "12";  // DB mein jo class hai
                            //   final level = "Level 1"; // DB mein jo level hai
                            //
                            //   showDialog(
                            //     context: context,
                            //     barrierDismissible: false,
                            //     builder: (_) => const Center(child: CircularProgressIndicator()),
                            //   );
                            //
                            //   final quizProvider = context.read<QuizProvider>();
                            //   final success = await quizProvider.fetchQuestions(
                            //     subject: subject,
                            //     className: className,
                            //     level: level,
                            //   );
                            //
                            //   Navigator.pop(context);
                            //
                            //   if (success) {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (_) => QuizScreen(
                            //           attemptId: "demo_${DateTime.now().millisecondsSinceEpoch}",
                            //           questions: quizProvider.questions,
                            //         ),
                            //       ),
                            //     );
                            //   } else {
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //       SnackBar(
                            //         content: Text(quizProvider.errorMessage ?? "Failed to fetch questions"),
                            //       ),
                            //     );
                            //   }
                            // }
                            if (cat.title == "Mockup Test") {
                              final subject =
                                  cat.title; // e.g., "Mockup" as the subject

                              final className = context
                                  .read<ClassSelectionProvider>()
                                  .selectedClass; // optional
                              final level =
                                  null; // or any default value if needed

                              // Show loading dialog
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );

                              // Fetch questions
                              final quizProvider = context.read<QuizProvider>();
                              final success = await quizProvider.fetchQuestions(
                                subject: subject,
                                className: className, // can be null
                                level: level, // can be null
                              );

                              Navigator.pop(context); // close loading dialog
                              if (success) {
                                quizProvider.resetQuiz(); // ✅ pehle reset karo
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => QuizScreen(
                                      attemptId: "demo_${DateTime.now().millisecondsSinceEpoch}", // demo ke liye fake ID
                                      questions: quizProvider.questions,
                                    ),
                                  ),
                                );
                              }

                              // if (success) {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (_) => QuizScreen(
                              //         attemptId:
                              //             "demo_${DateTime.now().millisecondsSinceEpoch}",
                              //         questions: quizProvider.questions,
                              //       ),
                              //     ),
                              //   );
                              // }
                              else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      quizProvider.errorMessage ??
                                          "Failed to fetch questions",
                                    ),
                                  ),
                                );
                              }
                            }
                            else {
                              // 🔹 Save selected subject (Physics, Biology, etc.)
                              context.read<SubjectProvider>().selectSubject(
                                cat.title,
                              );

                              // 🔹 Ask for class selection
                              final result = await showDialog(
                                context: screenContext,
                                builder: (context) =>
                                    const ClassSelectionDialog(),
                              );

                              // 🔹 If user chooses "continue", navigate to LevelsScreen
                              if (result == "continue") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => LevelsScreen(
                                      subject: context
                                          .read<SubjectProvider>()
                                          .selectedSubject!,
                                      className: context
                                          .read<ClassSelectionProvider>()
                                          .selectedClass!,
                                    ),
                                  ),
                                );
                              }
                            }
                          }
                        : null,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      // ======= Bottom Navigation (ValueNotifier) =======
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }
}

// ======= Encircled Bell Widget with Badge (Provider-driven) =======

class NotificationBell extends StatelessWidget {
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {
        final count = homeProvider.notifCount;

        return GestureDetector(
          onTap: () {
            homeProvider.resetNotifCount();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NotificationsScreen()),
            );
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(150, 223, 217, 217),
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x22000000),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
              if (count > 0)
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF4D67),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      count > 99 ? '99+' : '$count',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
