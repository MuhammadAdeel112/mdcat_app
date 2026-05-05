// import 'package:flutter/material.dart';

// class CustomHeader extends StatelessWidget {
//   final String title;
//   final String counterText;
//   final String? timerText;
//   final Widget? rightWidget; // if you want to replace the right side icon/text

//   const CustomHeader({
//     Key? key,
//     required this.title,
//     required this.counterText,
//     this.timerText,
//     this.rightWidget,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//       decoration: BoxDecoration(
//         image: const DecorationImage(
//           image: AssetImage("assets/images/demo background.png"),
//           fit: BoxFit.cover,
//         ),
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(16),
//           bottomRight: Radius.circular(16),
//         ),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               InkWell(
//                 onTap: () => Navigator.of(context).pop(),
//                 child: const Icon(
//                   Icons.arrow_back,
//                   size: 20,
//                   color: Colors.white,
//                 ),
//               ),
//               const Spacer(),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//               ),
//               const Spacer(),
//               rightWidget ??
//                   const Icon(Icons.more_vert, color: Colors.transparent),
//             ],
//           ),
//           const SizedBox(height: 12),

//           // Counter & Timer
//           SizedBox(
//             height: 40,
//             width: double.infinity,
//             child: Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Text(
//                     counterText,
//                     style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 if (timerText != null)
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const Icon(
//                           Icons.access_time,
//                           size: 16,
//                           color: Colors.black,
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           timerText!,
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 13,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final String counterText;
  final String? timerText;
  final Widget? rightWidget;
  final VoidCallback? onBack; // ✅ NEW: custom back navigation callback

  const CustomHeader({
    Key? key,
    required this.title,
    required this.counterText,
    this.timerText,
    this.rightWidget,
    this.onBack, // ✅ you can override navigation from each screen
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/demo background.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Back Button Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap:
                    onBack ??
                    () => Navigator.of(context).pop(), // ✅ fallback to pop
                child: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              rightWidget ??
                  const Icon(Icons.more_vert, color: Colors.transparent),
            ],
          ),

          const SizedBox(height: 10), // 🔽 Title slightly below back button
          /// 🔹 Title (centered horizontally but slightly below back arrow)
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// 🔹 Counter & Timer Row
          SizedBox(
            height: 40,
            width: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    counterText,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                if (timerText != null)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          timerText!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
