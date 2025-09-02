import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:mdcat/view/profile_screen.dart';
// import 'package:mdcat/view/quiz_screen.dart';
// import 'package:mdcat/view/demo_quizscreen.dart';
// import 'package:mdcat/view/demo_quizscreen.dart';
import 'package:mdcat/widgets/category_card.dart';
import 'package:mdcat/widgets/class_selection_dialogue.dart';
import 'package:mdcat/widgets/demo-test_dialogue.dart';
import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';
// import 'package:mdcat/widgets/demo-test_dialogue.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// final ValueNotifier<int> _bottomIndex = ValueNotifier<int>(0);
final ValueNotifier<String> _searchFilter = ValueNotifier<String>("All");
final ValueNotifier<int> _notifCount = ValueNotifier<int>(3);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          "assets/images/noise.webp", // <--- add your noise texture image here
                          fit: BoxFit.cover,
                          repeat: ImageRepeat.repeat,
                        ),
                      ),
                    ),

                    // Encircled Bell
                    Positioned(
                      right: 12,
                      top: 12,
                      child: NotificationBell(countListenable: _notifCount),
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
                                  color: Color(0xFFB7B7B7), // updated color
                                ),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        color: Color(
                                          0xFFB7B7B7,
                                        ), // updated color
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                ValueListenableBuilder<String>(
                                  valueListenable: _searchFilter,
                                  builder: (context, value, _) {
                                    return DropdownButton<String>(
                                      value: value,
                                      underline: const SizedBox(),
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        color: Color(
                                          0xFFB7B7B7,
                                        ), // updated color
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
                                                      color: Color(
                                                        0xFFB7B7B7,
                                                      ), // updated color
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                      onChanged: (v) {
                                        if (v != null) _searchFilter.value = v;
                                      },
                                    );
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

                // childAspectRatio: 1.10,
                childAspectRatio: 1.25,
                children: [
                  CategoryCard(
                    image: "assets/images/physics.png",
                    title: "Physics",
                    subtitle: "15 Levels",
                    color: const Color(0xFFFAFCFF),
                    onTap: () async {
                      final screenContext = context;

                      // First dialog
                      final result = await showDialog(
                        context: screenContext,
                        builder: (context) => const ClassSelectionDialog(),
                      );

                      // Only proceed if user pressed Continue
                      if (result == "continue") {
                        // Second dialog
                        await showDialog(
                          context: screenContext,
                          builder: (context) => const DemoTestDialog(),
                        );
                      }
                    },
                  ),

                  //
                  const CategoryCard(
                    image: "assets/images/biology.png",
                    title: "Biology",
                    subtitle: "15 Levels",
                    color: Color(0xFFFCFFFA),
                  ),
                  const CategoryCard(
                    image: "assets/images/math.png",
                    title: "Math",
                    subtitle: "20 Levels",
                    color: Color(0xFFFFFCFA),
                  ),
                  const CategoryCard(
                    image: "assets/images/chemistry.png",
                    title: "Chemistry",
                    subtitle: "15 Levels",
                    color: Color(0xFFFAFFFD),
                  ),
                  const CategoryCard(
                    image: "assets/images/english.png",
                    title: "English",
                    subtitle: "20 Levels",
                    color: Color(0xFFFAFCFF),
                  ),
                  const CategoryCard(
                    image: "assets/images/mockup.png",
                    title: "Mockup Test",
                    subtitle: "20 MCQs",
                    color: Color(0xFFFFFCFA),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // ======= Bottom Navigation (ValueNotifier) =======
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
      // bottomNavigationBar: ValueListenableBuilder<int>(
      //   valueListenable: _bottomIndex,
      //   builder: (context, index, _) {
      //     return ClipRRect(
      //       borderRadius: const BorderRadius.only(
      //         topLeft: Radius.circular(24),
      //         topRight: Radius.circular(24),
      //       ),
      //       child: BottomNavigationBar(
      //         backgroundColor: Colors.white,
      //         currentIndex: index,
      //         onTap: (i) {
      //           if (i == 3) {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (_) => const ProfilePage()),
      //             );
      //           } else {
      //             _bottomIndex.value = i;
      //           }
      //         },
      //         selectedItemColor: const Color(0xFF6F46F0),
      //         unselectedItemColor: const Color(0xFF9DA3AE),
      //         type: BottomNavigationBarType.fixed,
      //         items: const [
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.home_rounded),
      //             label: "Home",
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.account_balance_wallet_rounded),
      //             label: "Wallet",
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.bar_chart_rounded),
      //             label: "Score",
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.person_rounded),
      //             label: "Profile",
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),

      // bottomNavigationBar: ValueListenableBuilder<int>(
      //   valueListenable: _bottomIndex,
      //   builder: (context, index, _) {
      //     return ClipRRect(
      //       borderRadius: const BorderRadius.only(
      //         topLeft: Radius.circular(24),
      //         topRight: Radius.circular(24),
      //       ),
      //       child: BottomNavigationBar(
      //         backgroundColor: Colors.white,
      //         currentIndex: index,
      //         onTap: (i) => _bottomIndex.value = i,
      //         selectedItemColor: const Color(0xFF6F46F0),
      //         unselectedItemColor: const Color(0xFF9DA3AE),
      //         type: BottomNavigationBarType.fixed,
      //         items: const [
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.home_rounded),
      //             label: "Home",
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.account_balance_wallet_rounded),
      //             label: "Wallet",
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.bar_chart_rounded),

      //             label: "Score",
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.person_rounded),
      //             label: "Profile",
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

// ======= Encircled Bell Widget with Badge (ValueNotifier-driven) =======
class NotificationBell extends StatelessWidget {
  final ValueListenable<int> countListenable;
  const NotificationBell({super.key, required this.countListenable});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Example interaction: clear notifications on tap (no setState)
        if (countListenable is ValueNotifier<int>) {
          (countListenable as ValueNotifier<int>).value = 0;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Notifications opened'),
            duration: Duration(milliseconds: 900),
          ),
        );
      },
      child: ValueListenableBuilder<int>(
        valueListenable: countListenable,
        builder: (context, count, _) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              // Encircled container
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                    150,
                    223,
                    217,
                    217,
                  ), // lighter grey with alpha
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
          );
        },
      ),
    );
  }
}
