// import 'package:flutter/material.dart';

// class OnBoardingScreen2 extends StatelessWidget {
//   const OnBoardingScreen2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 20),

//             // Top Text
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Column(
//                 children: [
//                   const Text(
//                     "Lorem ipsum dolor sit amet consectetur.",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.black87,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 8),
//                   GestureDetector(
//                     onTap: () {},
//                     child: const Text(
//                       "Quam varius tortor aliquam habitant.",
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.blue,
//                         decoration: TextDecoration.underline,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Main Big Image
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 40),
//               height: 250,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.blue, width: 2),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.asset(
//                   "assets/images/onboarding 2.png", // ✅ Asset image
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 30),

//             // Small Thumbnails
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 buildSmallImage("assets/images/onboarding 2.1.png"),
//                 const SizedBox(width: 12),
//                 buildSmallImage("assets/images/onboarding 2.2.png"),
//                 const SizedBox(width: 12),
//                 buildSmallImage("assets/images/onboarding 2.3.png"),
//               ],
//             ),

//             const SizedBox(height: 20),

//             // Pagination Dots
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [buildDot(true), buildDot(false), buildDot(false)],
//             ),

//             const Spacer(),

//             // Next Button
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//               child: Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   gradient: const LinearGradient(
//                     colors: [Color(0xFF8A2BE2), Color(0xFF00CED1)],
//                   ),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "Next",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildSmallImage(String path) {
//     return Container(
//       height: 80,
//       width: 70,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 5,
//             spreadRadius: 1,
//             offset: Offset(2, 2),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(12),
//         child: Image.asset(path, fit: BoxFit.cover), // ✅ Changed here
//       ),
//     );
//   }

//   Widget buildDot(bool isActive) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 4),
//       width: isActive ? 12 : 8,
//       height: isActive ? 12 : 8,
//       decoration: BoxDecoration(
//         color: isActive ? Colors.blue : Colors.grey,
//         shape: BoxShape.circle,
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:mdcat/view/3on_boardingscreen.dart';
// import 'package:mdcat/widgets/topgardientwithback.dart';

// class OnBoardingScreen2 extends StatelessWidget {
//   const OnBoardingScreen2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ✅ Top Gradient With Back
//             TopGradientWithBack(),

//             // 🔹 Reduce the space between arrow & text ONLY here
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
//             // Main Big Image
//             Transform.translate(
//               offset: const Offset(-10, -25),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 1), // small gap only
//                 child: Container(
//                   width: 282,
//                   height: 368,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white, width: 2),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.asset(
//                       "assets/images/onboarding 2.png",
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // Small Thumbnails
//             Transform.translate(
//               offset: const Offset(0, -60),
//               child: SizedBox(
//                 height: 200, // enough space for thumbnails
//                 child: Stack(
//                   children: [
//                     // First image
//                     Positioned(
//                       top: 0, // relative inside SizedBox
//                       left: 20,
//                       child: buildSmallImage(
//                         "assets/images/onboarding 2.1.png",
//                       ),
//                     ),
//                     // Second image
//                     Positioned(
//                       top: 0,
//                       left: 137,
//                       child: buildSmallImage(
//                         "assets/images/onboarding 2.2.png",
//                       ),
//                     ),
//                     // Third image
//                     Positioned(
//                       top: 0,
//                       left: 254,
//                       child: buildSmallImage(
//                         "assets/images/omboarding 2.3.png",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             Transform.translate(
//               offset: const Offset(0, -40),
//               // Pagination Dots
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [buildDot(false), buildDot(true), buildDot(false)],
//               ),
//             ),
//             // const Spacer(),

//             // Next Button
//             Transform.translate(
//               offset: const Offset(0, -20),

//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => OnboardingScreen3(),
//                       ),
//                     );
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
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildSmallImage(String path) {
//     return Container(
//       width: 100,
//       height: 166,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 5,
//             spreadRadius: 1,
//             offset: Offset(2, 2),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(14),
//         child: Image.asset(path, fit: BoxFit.cover),
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
