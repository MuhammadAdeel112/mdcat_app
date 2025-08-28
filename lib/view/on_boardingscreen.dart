// import 'package:flutter/material.dart';
// import 'package:mdcat/view/2on_boarding_screen.dart';

// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           /// Background Circles
//           Positioned(
//             left: -50,
//             top: 100,
//             child: _buildCircle(100, Colors.blue.shade200),
//           ),
//           Positioned(
//             right: -60,
//             top: 40,
//             child: _buildCircle(140, Colors.deepOrange.shade200),
//           ),

//           Positioned(
//             left: 100,
//             top: 280,
//             child: _buildCircle(
//               80,
//               // Colors.blue.shade300,
//               Color(0xFF35E1D0),
//             ), // big blue near girl
//           ),
//           Positioned(
//             right: 40,
//             bottom: 375,
//             child: _buildCircle(20, Colors.blue.shade300),
//           ),
//           Positioned(
//             left: 40,
//             top: 220,
//             child: _buildCircle(20, Colors.red.shade200),
//           ),

//           /// Main Content
//           SafeArea(
//             child: Column(
//               children: [
//                 const Spacer(),

//                 /// Girl with Laptop (replace with your asset)
//                 Center(
//                   child: Image.asset(
//                     "assets/images/onboarding1.png",
//                     height: 346,
//                   ),
//                 ),

//                 const SizedBox(height: 40),

//                 /// Title
//                 const Text(
//                   "MDCAT",
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF6C4DFF),
//                   ),
//                 ),

//                 const SizedBox(height: 12),

//                 /// Subtitle
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 24.0),
//                   child: Text(
//                     "Lorem ipsum dolor sit amet consectetur. Quam varius tortor aliquam habitant.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 14, color: Colors.black54),
//                   ),
//                 ),

//                 const Spacer(),
//                 // Gradient Button
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => OnBoardingScreen2(),
//                         ),
//                       );
//                       // navigate
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 55,
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                           colors: [
//                             Color(0xFF793FFF), // dark purple
//                             Color(0xFF35E1D0), // teal (middle)
//                             Color(0xFF492699), // deep purple (end)
//                           ],
//                           stops: [
//                             0.0731,
//                             1.0128,
//                             1.0463,
//                           ], // your exact gradient stops
//                         ),
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           "Get Started",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 40),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Circle Builder
//   Widget _buildCircle(double size, Color color) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.8),
//         shape: BoxShape.circle,
//       ),
//     );
//   }
// }
