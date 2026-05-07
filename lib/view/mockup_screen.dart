import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/level_model.dart';
import '../providers/mockup_provider.dart';
import '../widgets/start_test_dialogue.dart';

class MockupScreen extends StatefulWidget {
  const MockupScreen({super.key});

  @override
  State<MockupScreen> createState() => _MockupScreenState();
}

class _MockupScreenState extends State<MockupScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MockupProvider>().fetchMockups();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MockupProvider>();
    final mockups = viewModel.mockups;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F9),
      appBar: AppBar(
        title: const Text(
          "Mockup Tests",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF7C51DB)))
          : viewModel.errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, size: 60, color: Colors.red),
                      const SizedBox(height: 16),
                      Text(viewModel.errorMessage!),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => viewModel.fetchMockups(),
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                )
              : mockups.isEmpty
                  ? const Center(child: Text("No mockup tests available yet."))
                  : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 200,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: mockups.length,
                      itemBuilder: (context, index) {
                        final mockup = mockups[index];
                        return _buildMockupCard(mockup, context);
                      },
                    ),
    );
  }

  Widget _buildMockupCard(LevelModel mockup, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => StartTestDialog(
            testId: mockup.id,
            testTitle: mockup.title,
            credits: mockup.price,
            level: mockup.level,
            subject: "Mockup", // Since it's a full mockup
            className: "Full Syllabus",
            isFree: mockup.isFree,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Icon Background
            Positioned(
              right: -10,
              bottom: -10,
              child: Opacity(
                opacity: 0.1,
                child: Icon(Icons.rocket_launch, size: 80, color: Color(0xFF7C51DB)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7C51DB).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.quiz, color: Color(0xFF7C51DB), size: 24),
                  ),
                  const Spacer(),
                  Text(
                    mockup.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1F1F),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${mockup.mcqs} Questions",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.timer_outlined, size: 14, color: Colors.grey.shade600),
                      const SizedBox(width: 4),
                      Text(
                        "${mockup.testDuration} Mins",
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Price or Free label
                  Text(
                    mockup.isFree ? "FREE" : "${mockup.price} Credits",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: mockup.isFree ? Colors.green : const Color(0xFF7C51DB),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
