// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/quiz_provider.dart';

// class OptionTile extends StatelessWidget {
//   final int qIndex;
//   final int index;
//   final String label;
//   final String text;

//   const OptionTile({
//     super.key,
//     required this.qIndex,
//     required this.index,
//     required this.label,
//     required this.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final qp = Provider.of<QuizProvider>(context);
//     final selected = qp.isSelected(qIndex, index);

//     return GestureDetector(
//       onTap: () => qp.toggleOption(qIndex, index),
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 6),
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(
//             color: selected ? Colors.purple : Colors.grey.shade400,
//             width: 1,
//           ),
//           color: Colors.white, // stays white (like screenshot)
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // ✅ Custom square checkbox
//             Container(
//               width: 20,
//               height: 20,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4),
//                 border: Border.all(
//                   color: selected ? Colors.purple : Colors.grey,
//                   width: 1.5,
//                 ),
//                 color: selected ? Colors.purple : Colors.transparent,
//               ),
//               child: selected
//                   ? const Icon(Icons.check, size: 16, color: Colors.white)
//                   : null,
//             ),
//             const SizedBox(width: 12),

//             // ✅ Label + Text in same line
//             Expanded(
//               child: Text(
//                 "$label $text",
//                 style: const TextStyle(fontSize: 14, color: Colors.black87),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
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
    final selected = qp.isSelected(qIndex, index);

    return GestureDetector(
      onTap: () => qp.toggleOption(qIndex, index),
      child: Container(
        width: 357, // fixed width (from spec)
        height: 53, // fixed height (from spec)
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? Color(0xFF8C59FF) : Colors.grey.shade400,
            width: 1, // border-width (from spec)
          ),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ✅ Custom square checkbox
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: selected ? Color(0xFF8C59FF) : Colors.grey,
                  width: 1.5,
                ),
                color: selected ? Color(0xFF8C59FF) : Colors.transparent,
              ),
              child: selected
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 12),

            // ✅ Label + Text
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: "Lexend", // 👈 applied only here
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                  letterSpacing: 0,
                  color: Colors.black87,
                ),
              ),

              // child: Text(
              //   "$label $text",
              //   style: TextStyle(
              //     fontSize: 14,
              //     fontWeight: FontWeight.w500,
              //     color: selected ? Colors.purple : Colors.black87,
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
