import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class OptionTile extends StatelessWidget {
  final int qIndex;
  final int index;
  final String label;
  final String text;

  const OptionTile({
    super.key,
    required this.qIndex,
    required this.index,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final qp = Provider.of<QuizProvider>(context);
    final isSelected = qp.isSelected(qIndex, index);

    return GestureDetector(
      onTap: () => qp.toggleOption(qIndex, index),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.purple : Colors.grey.shade400,
            width: 1,
          ),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Small square box
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: isSelected ? Colors.purple : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isSelected ? Colors.purple : Colors.grey.shade400,
                  width: 1,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),

            const SizedBox(width: 10),

            /// Bold A., B., C.
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),

            const SizedBox(width: 8),

            /// Option text
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
