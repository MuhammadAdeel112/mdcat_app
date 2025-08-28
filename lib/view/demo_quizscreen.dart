import 'package:flutter/material.dart';

class DemoQuizscreen extends StatelessWidget {
  const DemoQuizscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First "Demo Test" title
            const Text(
              'Demo Test',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Second "Demo Test" title
            const Text('Demo Test', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 24),
            // Question text
            const Text(
              '1. In front of you, a large combine\nhow wants to turn right/what is right?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // "Choose Correct Answers" text
            const Text(
              'Choose Correct Answers',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            // Options
            for (int i = 0; i < 4; i++)
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  '${String.fromCharCode(65 + i)}. In front of you, a large combine.',
                  style: const TextStyle(fontSize: 16),
                ),
                value: false,
                onChanged: (bool? value) {},
              ),
            const SizedBox(height: 24),
            // Show Answers button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Show Answers'),
              ),
            ),
            const Spacer(),
            // Bottom buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(onPressed: () {}, child: const Text('Skip')),
                ElevatedButton(onPressed: () {}, child: const Text('Next →')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
