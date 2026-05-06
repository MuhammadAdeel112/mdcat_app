import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/level_model.dart';
import '../providers/class_selection_provider.dart';
import '../providers/subject_provider.dart';
import '../providers/levels_provider.dart';
import '../widgets/start_test_dialogue.dart';

class LevelsScreen extends StatefulWidget {
  final String subject;
  final String className;

  const LevelsScreen({
    super.key,
    required this.subject,
    required this.className,
  });

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  String _selectedFilter = 'All'; // Can be 'All', 'Free', or 'Paid'
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LevelsViewModel>().fetchLevels(widget.subject, widget.className);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LevelsViewModel>();
    final allLevels = viewModel.levels;

    // Apply filter
    final levels = allLevels.where((level) {
      if (_selectedFilter == 'Free') return level.isFree;
      if (_selectedFilter == 'Paid') return !level.isFree;
      return true; // 'All'
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Levels")),
      body: Column(
        children: [
          // Filter Chips Row
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFilterChip('All'),
                const SizedBox(width: 12),
                _buildFilterChip('Free'),
                const SizedBox(width: 12),
                _buildFilterChip('Paid'),
              ],
            ),
          ),
          
          Expanded(
            child: viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : viewModel.errorMessage != null
                    ? Center(child: Text(viewModel.errorMessage!))
                    : levels.isEmpty
                        ? const Center(child: Text("No tests found for this filter"))
                        : GridView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 180,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: levels.length,
                            itemBuilder: (context, index) {
                              final level = levels[index];
                              return _buildLevelCard(level, context);
                            },
                          ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF492699) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF492699) : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
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
            isFree: level.isFree, // ✅ Pass isFree flag
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
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (level.level.isNotEmpty) ...[
                      Text(
                        level.level, // Chapter name
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                    Text(
                      "${level.mcqs} MCQs",
                      style: const TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${level.testDuration} Mins",
                      style: const TextStyle(fontSize: 13, color: Colors.blueGrey),
                    ),
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
            // FREE / PAID Badge
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: level.isFree
                      ? Colors.green.withOpacity(0.1)
                      : Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: level.isFree ? Colors.green : Colors.orange,
                    width: 1,
                  ),
                ),
                child: Text(
                  level.isFree ? "Free" : "Paid",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: level.isFree ? Colors.green : Colors.orange,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
