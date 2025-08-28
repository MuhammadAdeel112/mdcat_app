// import 'package:flutter/material.dart';

// class OnboardingScreen3 extends StatelessWidget {
//   const OnboardingScreen3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFFDEBFF), Color(0xFFE6F3FF)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           children: [
//             const SizedBox(height: 60),

//             // Text box with arrow back
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.9),
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.05),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Icon(Icons.arrow_back_ios, size: 20, color: Colors.black87),
//                     const SizedBox(width: 8),
//                     const Expanded(
//                       child: Text(
//                         "Lorem ipsum dolor sit amet consectetur.\nQuam varius tortor aliquam habitant.",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black87,
//                           height: 1.4,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Main Image
//             Expanded(
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   // Purple X-shape background
//                   Positioned(
//                     child: Image.network(
//                       "https://i.ibb.co/t3FMYR8/x-shape.png", // <-- replace with your X shape asset
//                       width: 250,
//                       fit: BoxFit.contain,
//                     ),
//                   ),

//                   // Person image
//                   Positioned(
//                     child: Image.asset(
//                       "assets/images/onboarding3.png", // <-- replace with your person asset
//                       height: 300,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Page indicators
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(3, (index) {
//                 return Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 4),
//                   width: index == 1 ? 12 : 8,
//                   height: index == 1 ? 12 : 8,
//                   decoration: BoxDecoration(
//                     color: index == 1 ? Colors.black87 : Colors.grey.shade400,
//                     shape: BoxShape.circle,
//                   ),
//                 );
//               }),
//             ),

//             const SizedBox(height: 20),

//             // Next button
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               child: SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.zero,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: Ink(
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Color(0xFF9C27B0), Color(0xFF00BCD4)],
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                     ),
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: const Text(
//                         "Next",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:mdcat/widgets/topgardientwithback.dart';

// class OnboardingScreen3 extends StatelessWidget {
//   const OnboardingScreen3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ✅ Top gradient with back + text (same as previous
//             TopGradientWithBack(),
//             Transform.translate(
//               offset: const Offset(-10, -20), // move up by 20px
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: const Text(
//                   "Lorem ipsum dolor sit amet consectetur.\n Quam varius tortor aliquam habitant.",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xCC333333),
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),

//             // Main Image
//             Expanded(
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   // Person image
//                   Transform.translate(
//                     offset: const Offset(0, -60),
//                     child: Positioned(
//                       child: Image.asset(
//                         "assets/images/onboarding3.png", // <-- replace with your asset
//                         height: 400,
//                         // width: 243,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Page indicators
//             Transform.translate(
//               offset: const Offset(0, -5),
//               // Pagination Dots
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [buildDot(false), buildDot(false), buildDot(true)],
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Next button
//             Transform.translate(
//               offset: const Offset(0, -5),

//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     // navigate
//                   },
//                   child: Container(
//                     width: double.infinity,
//                     height: 55,
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                         colors: [
//                           Color(0xFF793FFF), // dark purple
//                           Color(0xFF35E1D0), // teal (middle)
//                           Color(0xFF492699), // deep purple (end)
//                         ],
//                         stops: [
//                           0.0731,
//                           1.0128,
//                           1.0463,
//                         ], // your exact gradient stops
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         "Next",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildDot(bool isActive) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 4),
//       width: isActive ? 9 : 8,
//       height: isActive ? 9 : 8,
//       decoration: BoxDecoration(
//         color: isActive ? Color(0xFF8C59FF) : Color(0xFFDFD2FF),
//         shape: BoxShape.circle,
//       ),
//     );
//   }
// }
