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

        // Save selected level
        context.read<LevelsViewModel>().selectLevel(level);

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
