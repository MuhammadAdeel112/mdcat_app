import 'package:flutter/material.dart';
import 'package:mdcat/models/answer_option_model.dart';
// import '../models/answer_option.dart';

class ResultOptionTile extends StatelessWidget {
  final AnswerOption option;
  final int index;

  const ResultOptionTile({
    super.key,
    required this.option,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // --- Card styling ---
    Color cardBorderColor = Colors.grey.shade400;
    Color cardFillColor = Colors.white;

    // --- Checkbox styling ---
    Color boxBorderColor = Colors.grey;
    Color boxFillColor = Colors.white;
    Widget? icon;

    // ✅ Case 1: User selected the correct option
    if (option.isSelected && option.isCorrect) {
      cardBorderColor = Colors.grey;
      cardFillColor = const Color(0x524D8AF0);

      boxBorderColor = Colors.white;
      boxFillColor = Colors.purple;
      icon = const Icon(Icons.check, color: Colors.white, size: 16);
    }
    // ❌ Case 2: User selected a wrong option
    else if (option.isSelected && !option.isCorrect) {
      cardBorderColor = Colors.red;
      cardFillColor = Colors.red.shade100;

      boxBorderColor = Colors.red;
      boxFillColor = Colors.red;
      icon = const Icon(Icons.close, color: Colors.white, size: 16);
    }
    // ✅ Case 3: Not selected but correct answer
    else if (!option.isSelected && option.isCorrect) {
      cardBorderColor = Colors.grey;
      cardFillColor = const Color(0x524D8AF0);

      boxBorderColor = Colors.white;
      boxFillColor = Color(0xFF8C59FF);
      icon = const Icon(Icons.check, color: Colors.white, size: 16);
    }

    // ❍ Case 4: Neutral option → stays grey/white

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: cardBorderColor, width: 1),
        color: cardFillColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Small square box (checkbox)
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: boxFillColor,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: boxBorderColor, width: 1),
            ),
            child: icon,
          ),

          const SizedBox(width: 10),

          /// Bold A., B., C., D.
          Text(
            "${String.fromCharCode(65 + index)}.",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),

          const SizedBox(width: 8),

          /// Option text
          Expanded(
            child: Text(
              option.text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
