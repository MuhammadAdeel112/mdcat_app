import 'package:flutter/material.dart';
import 'package:mdcat/models/level_model.dart';
import 'package:mdcat/providers/levels_provider.dart';
import 'package:mdcat/view/physics_screen.dart';
import 'package:mdcat/widgets/custom_background.dart';
import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';
import 'package:provider/provider.dart';
// import '../viewmodel/levels_viewmodel.dart';
// import '../model/level_model.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final levels = context.watch<LevelsViewModel>().levels;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
      body: Column(
        children: [
          CustomHeader(title: "Physics  Levels", counterText: ""),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 140,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: levels.length,
              itemBuilder: (context, index) {
                final level = levels[index];
                final provider = context.read<LevelsViewModel>();
                return _buildLevelCard(level, index + 1, provider, context);
              },

              // itemBuilder: (context, index) {
              //   final level = levels[index];
              //   return _buildLevelCard(level, index + 1);
              // },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelCard(
    LevelModel level,
    int position,
    LevelsViewModel provider,
    BuildContext context,
  ) {
    String getOrdinal(int number) {
      if (number >= 11 && number <= 13) return "${number}th";
      switch (number % 10) {
        case 1:
          return "${number}st";
        case 2:
          return "${number}nd";
        case 3:
          return "${number}rd";
        default:
          return "${number}th";
      }
    }

    return GestureDetector(
      onTap: () {
        if (level.isUnlocked) {
          if (position == 1) {
            // Check if it's Level 1
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const PhysicsScreen(), // Replace with your new screen
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Opening ${level.title}...")),
            );
          }
        } else {
          final success = provider.unlockLevel(level.id);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                success
                    ? "${level.title} unlocked!"
                    : "Not enough credits to unlock ${level.title}.",
              ),
            ),
          );
        }
      },

      // onTap: () {
      //   if (level.isUnlocked) {
      //     // ✅ Navigate to MCQ screen
      //     ScaffoldMessenger.of(
      //       context,
      //     ).showSnackBar(SnackBar(content: Text("Opening ${level.title}...")));
      //   } else {
      //     final success = provider.unlockLevel(level.id);
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         content: Text(
      //           success
      //               ? "${level.title} unlocked!"
      //               : "Not enough credits to unlock ${level.title}.",
      //         ),
      //       ),
      //     );
      //   }
      // },
      child: Stack(
        children: [
          // Main card
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(
                color: level.isUnlocked ? Color(0xFFCCCCCC) : Colors.red,
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/images/ribbon.png",
                        height: 55,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        child: Transform.translate(
                          offset: const Offset(0, -13),
                          child: Text(
                            getOrdinal(position),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    level.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${level.mcqs} MCQs",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF727272),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🔒 Lock overlay when locked
          if (!level.isUnlocked)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white.withOpacity(0.7),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.lock, size: 32, color: Colors.grey),
                    const SizedBox(height: 8),
                    Text(
                      "Unlock\n${level.price} credits",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
