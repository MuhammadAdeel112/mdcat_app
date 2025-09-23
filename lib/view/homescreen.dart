// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:mdcat/view/level_screen.dart';
// // import 'package:mdcat/view/profile_screen.dart';
// // import 'package:mdcat/view/quiz_screen.dart';
// // import 'package:mdcat/view/demo_quizscreen.dart';
// // import 'package:mdcat/view/demo_quizscreen.dart';
// import 'package:mdcat/widgets/category_card.dart';
// import 'package:mdcat/widgets/class_selection_dialogue.dart';
// import 'package:mdcat/widgets/demo-test_dialogue.dart';
// // import 'package:mdcat/widgets/demo-test_dialogue.dart';
// import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';
// // import 'package:mdcat/widgets/demo-test_dialogue.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// // final ValueNotifier<int> _bottomIndex = ValueNotifier<int>(0);
// final ValueNotifier<String> _searchFilter = ValueNotifier<String>("All");
// final ValueNotifier<int> _notifCount = ValueNotifier<int>(3);

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F7F9),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ======= Top Greeting + Search + Encircled Bell =======
//               // ======= Top Greeting + Search + Encircled Bell with Noise =======
//               Container(
//                 height: 185,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   gradient: const LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,

//                     colors: [
//                       Color.fromRGBO(124, 81, 219, 1), // top color
//                       Color.fromRGBO(188, 157, 246, 1), // bottom color
//                     ],
//                     stops: [0.0, 1.0],
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     // Noise overlay (monotone effect)
//                     Positioned.fill(
//                       child: Opacity(
//                         opacity: 0.08, // subtle effect
//                         child: Image.asset(
//                           "assets/images/noise.webp", // <--- add your noise texture image here
//                           fit: BoxFit.cover,
//                           repeat: ImageRepeat.repeat,
//                         ),
//                       ),
//                     ),

//                     // Encircled Bell
//                     Positioned(
//                       right: 12,
//                       top: 12,
//                       child: NotificationBell(countListenable: _notifCount),
//                     ),

//                     // Content (Hello + Search bar)
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Hello,\nAhmed !",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 22,
//                               height: 1.2,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           const Spacer(),
//                           // 🔍 Search bar...
//                           Container(
//                             height: 46,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(40),
//                             ),
//                             padding: const EdgeInsets.symmetric(horizontal: 14),
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.search,
//                                   color: Color(0xFFB7B7B7), // updated color
//                                 ),
//                                 const SizedBox(width: 8),
//                                 const Expanded(
//                                   child: TextField(
//                                     decoration: InputDecoration(
//                                       hintText: "Search",
//                                       hintStyle: TextStyle(
//                                         color: Color(
//                                           0xFFB7B7B7,
//                                         ), // updated color
//                                       ),
//                                       border: InputBorder.none,
//                                     ),
//                                   ),
//                                 ),
//                                 ValueListenableBuilder<String>(
//                                   valueListenable: _searchFilter,
//                                   builder: (context, value, _) {
//                                     return DropdownButton<String>(
//                                       value: value,
//                                       underline: const SizedBox(),
//                                       icon: const Icon(
//                                         Icons.keyboard_arrow_down_sharp,
//                                         color: Color(
//                                           0xFFB7B7B7,
//                                         ), // updated color
//                                       ),
//                                       items:
//                                           const [
//                                                 "All",
//                                                 "Physics",
//                                                 "Biology",
//                                                 "Math",
//                                                 "Chemistry",
//                                                 "English",
//                                               ]
//                                               .map(
//                                                 (e) => DropdownMenuItem(
//                                                   value: e,
//                                                   child: Text(
//                                                     e,
//                                                     style: const TextStyle(
//                                                       color: Color(
//                                                         0xFFB7B7B7,
//                                                       ), // updated color
//                                                     ),
//                                                   ),
//                                                 ),
//                                               )
//                                               .toList(),
//                                       onChanged: (v) {
//                                         if (v != null) _searchFilter.value = v;
//                                       },
//                                     );
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 18),

//               const Text(
//                 "Explore categories",
//                 style: TextStyle(
//                   color: Color(0xFF1F1F1F),
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               const SizedBox(height: 12),

//               // ======= Categories Grid =======
//               GridView.count(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 12,

//                 // childAspectRatio: 1.10,
//                 childAspectRatio: 1.25,
//                 children: [
//                   CategoryCard(
//                     image: "assets/images/physics.png",
//                     title: "Physics",
//                     subtitle: "15 Levels",
//                     color: const Color(0xFFFAFCFF),
//                     onTap: () async {
//                       final screenContext = context;

//                       // Show Class Selection Dialog
//                       final result = await showDialog(
//                         context: screenContext,
//                         builder: (context) => const ClassSelectionDialog(),
//                       );

//                       // If user pressed Continue -> navigate to LevelsScreen
//                       if (result == "continue") {
//                         Navigator.push(
//                           screenContext,
//                           MaterialPageRoute(
//                             builder: (_) => LevelsScreen(
//                               // 👈 pass subject name if needed
//                             ),
//                           ),
//                         );
//                       }
//                     },
//                   ),

//                   // CategoryCard(
//                   //   image: "assets/images/physics.png",
//                   //   title: "Physics",
//                   //   subtitle: "15 Levels",
//                   //   color: const Color(0xFFFAFCFF),
//                   //   onTap: () async {
//                   //     final screenContext = context;

//                   //     // First dialog
//                   //     final result = await showDialog(
//                   //       context: screenContext,
//                   //       builder: (context) => const ClassSelectionDialog(),
//                   //     );

//                   //     // Only proceed if user pressed Continue
//                   //     if (result == "continue") {
//                   //       // Second dialog
//                   //       await showDialog(
//                   //         context: screenContext,
//                   //         builder: (context) => const DemoTestDialog(),
//                   //       );
//                   //     }
//                   //   },
//                   // ),

//                   //
//                   const CategoryCard(
//                     image: "assets/images/biology.png",
//                     title: "Biology",
//                     subtitle: "15 Levels",
//                     color: Color(0xFFFCFFFA),
//                   ),
//                   const CategoryCard(
//                     image: "assets/images/math.png",
//                     title: "Math",
//                     subtitle: "20 Levels",
//                     color: Color(0xFFFFFCFA),
//                   ),
//                   const CategoryCard(
//                     image: "assets/images/chemistry.png",
//                     title: "Chemistry",
//                     subtitle: "15 Levels",
//                     color: Color(0xFFFAFFFD),
//                   ),
//                   const CategoryCard(
//                     image: "assets/images/english.png",
//                     title: "English",
//                     subtitle: "20 Levels",
//                     color: Color(0xFFFAFCFF),
//                   ),
//                   CategoryCard(
//                     image: "assets/images/mockup.png",
//                     title: "Mockup Test",
//                     subtitle: "Full syllabus",
//                     color: const Color(0xFFFFF8F0),
//                     onTap: () async {
//                       final screenContext = context;

//                       // Show only Demo Test Dialog
//                       await showDialog(
//                         context: screenContext,
//                         builder: (context) => const DemoTestDialog(),
//                       );
//                     },
//                   ),

//                   // const CategoryCard(
//                   //   image: "assets/images/mockup.png",
//                   //   title: "Mockup Test",
//                   //   subtitle: "20 MCQs",
//                   //   color: Color(0xFFFFFCFA),
//                   // ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),

//       // ======= Bottom Navigation (ValueNotifier) =======
//       bottomNavigationBar: const AppBottomNav(currentIndex: 0),
//     );
//   }
// }

// // ======= Encircled Bell Widget with Badge (ValueNotifier-driven) =======
// class NotificationBell extends StatelessWidget {
//   final ValueListenable<int> countListenable;
//   const NotificationBell({super.key, required this.countListenable});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Example interaction: clear notifications on tap (no setState)
//         if (countListenable is ValueNotifier<int>) {
//           (countListenable as ValueNotifier<int>).value = 0;
//         }
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Notifications opened'),
//             duration: Duration(milliseconds: 900),
//           ),
//         );
//       },
//       child: ValueListenableBuilder<int>(
//         valueListenable: countListenable,
//         builder: (context, count, _) {
//           return Stack(
//             clipBehavior: Clip.none,
//             children: [
//               // Encircled container
//               Container(
//                 width: 38,
//                 height: 38,
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(
//                     150,
//                     223,
//                     217,
//                     217,
//                   ), // lighter grey with alpha
//                   shape: BoxShape.circle,
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Color(0x22000000),
//                       blurRadius: 8,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),

//                 child: const Center(
//                   child: Icon(
//                     Icons.notifications,
//                     color: Colors.white,
//                     size: 22,
//                   ),
//                 ),
//               ),
//               if (count > 0)
//                 Positioned(
//                   right: -2,
//                   top: -2,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 5,
//                       vertical: 2,
//                     ),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFFF4D67),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       count > 99 ? '99+' : '$count',
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 10,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mdcat/providers/category_provider_home.dart';
import 'package:mdcat/providers/home_provider.dart';
import 'package:mdcat/providers/subject_provider.dart';
import 'package:provider/provider.dart';
import 'package:mdcat/view/level_screen.dart';
import 'package:mdcat/widgets/category_card.dart';
import 'package:mdcat/widgets/class_selection_dialogue.dart';
import 'package:mdcat/widgets/demo-test_dialogue.dart';
import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';
// import 'home_provider.dart';
// import 'category_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    final categories = context.watch<CategoryProvider>().categories;

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
                      child: NotificationBell(countListenable: homeProvider),
                    ),
                    // Content (Hello + Search bar)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hello,\nAhmed !",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              height: 1.2,
                              fontWeight: FontWeight.w700,
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
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        color: Color(0xFFB7B7B7),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
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
                                            "Math",
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
              const Text(
                "Explore categories",
                style: TextStyle(
                  color: Color(0xFF1F1F1F),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              // ======= Categories Grid =======
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.25,
                children: categories.map((Category cat) {
                  return CategoryCard(
                    image: cat.image,
                    title: cat.title,
                    subtitle: cat.subtitle,
                    color: cat.color,
                    onTap: cat.isEnabled
                        ? () async {
                            final screenContext = context;

                            if (cat.title == "Mockup Test") {
                              // 🔹 Handle Mockup Test as before
                              await showDialog(
                                context: screenContext,
                                builder: (context) => const DemoTestDialog(),
                              );
                            } else {
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
                                  screenContext,
                                  MaterialPageRoute(
                                    builder: (_) => const LevelsScreen(),
                                  ),
                                );
                              }
                            }
                          }
                        : null,
                  );

                  // return CategoryCard(
                  //   image: cat.image,
                  //   title: cat.title,
                  //   subtitle: cat.subtitle,
                  //   color: cat.color,
                  //   onTap: cat.isEnabled
                  //       ? () async {
                  //           if (cat.title == "Physics") {
                  //             final screenContext = context;
                  //             final result = await showDialog(
                  //               context: screenContext,
                  //               builder: (context) =>
                  //                   const ClassSelectionDialog(),
                  //             );
                  //             if (result == "continue") {
                  //               Navigator.push(
                  //                 screenContext,
                  //                 MaterialPageRoute(
                  //                   builder: (_) => LevelsScreen(),
                  //                 ),
                  //               );
                  //             }
                  //           } else if (cat.title == "Mockup Test") {
                  //             final screenContext = context;
                  //             await showDialog(
                  //               context: screenContext,
                  //               builder: (context) => const DemoTestDialog(),
                  //             );
                  //           }
                  //         }
                  //       : null,
                  // );
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
  final HomeProvider countListenable;
  const NotificationBell({super.key, required this.countListenable});

  @override
  Widget build(BuildContext context) {
    final homeProvider = countListenable;
    final count = homeProvider.notifCount;

    return GestureDetector(
      onTap: () {
        homeProvider.resetNotifCount();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Notifications opened'),
            duration: Duration(milliseconds: 900),
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Encircled container
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
              child: Icon(Icons.notifications, color: Colors.white, size: 22),
            ),
          ),
          if (count > 0)
            Positioned(
              right: -2,
              top: -2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
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
  }
}
