// // import 'package:flutter/material.dart';

// // class TopGradientWithBack extends StatelessWidget {
// //   final VoidCallback? onBack;

// //   const TopGradientWithBack({this.onBack, super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       // height: 100,
// //       height: MediaQuery.of(context).padding.top + 120,
// //       decoration: const BoxDecoration(
// //         gradient: LinearGradient(
// //           begin: Alignment.topCenter,
// //           end: Alignment.bottomCenter,
// //           colors: [Color(0xFFEDE2FF), Colors.white],
// //         ),
// //       ),
// //       child: Align(
// //         alignment: Alignment.centerLeft,
// //         child: Padding(
// //           padding: const EdgeInsets.only(left: 16),
// //           child: GestureDetector(
// //             onTap: onBack ?? () => Navigator.pop(context),
// //             child: Container(
// //               width: 36,
// //               height: 36,
// //               decoration: const BoxDecoration(
// //                 color: Color(0xFFE7DBFA),
// //                 shape: BoxShape.circle,
// //               ),
// //               child: const Icon(Icons.arrow_back_ios, size: 18),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:mdcat/view/homescreen.dart'; // ✅ make sure this import exists

// class TopGradientWithBack extends StatelessWidget {
//   final String? title;
//   final bool navigateHomeOnBack;

//   const TopGradientWithBack({
//     super.key,
//     this.title,
//     this.navigateHomeOnBack = false, // 👈 defaults to normal pop
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).padding.top + 140, // ⬆ slightly taller
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [Color(0xFFEDE2FF), Colors.white],
//         ),
//       ),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           // ✅ Centered Title
//           if (title != null)
//             Positioned(
//               bottom: 35, // 👈 nicely centered vertically
//               child: Text(
//                 title!,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF4B3A67),
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),

//           // ✅ Back Button (slightly above title)
//           Positioned(
//             top: MediaQuery.of(context).padding.top + 20,
//             left: 16,
//             child: GestureDetector(
//               onTap: () {
//                 if (navigateHomeOnBack) {
//                   Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(builder: (_) => const HomeScreen()),
//                     (route) => false,
//                   );
//                 } else {
//                   Navigator.pop(context);
//                 }
//               },
//               child: Container(
//                 width: 36,
//                 height: 36,
//                 decoration: const BoxDecoration(
//                   color: Color(0xFFE7DBFA),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(Icons.arrow_back_ios, size: 18),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class TopGradientWithBack extends StatelessWidget {
  final VoidCallback? onBack;

  const TopGradientWithBack({this.onBack, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.top + 120,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFEDE2FF), Colors.white],
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: onBack ?? () => Navigator.pop(context),
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Color(0xFFE7DBFA),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back_ios, size: 18),
            ),
          ),
        ),
      ),
    );
  }
}
