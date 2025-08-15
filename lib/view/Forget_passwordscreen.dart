import 'package:flutter/material.dart';
import 'package:mdcat/constants/constants.dart';
import 'package:mdcat/view/otp_screen.dart';
// import 'package:mdcat/widgets/custom_textfield.dart';
import 'package:mdcat/widgets/gradient_button.dart';

// class ForgotPasswordScreen extends StatelessWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _topGradientWithBack(context),

//             const SizedBox(height: 20),

//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//               child: Text(
//                 "Forgot Password?",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//               ),
//             ),

//             const SizedBox(height: 8),

//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//               child: Text(
//                 "Please enter the email address or phone number\nassociated with your account",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.black54,
//                   height: 1.4,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 25),

//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//               child: Text(
//                 "Email Address",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//             ),

//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//               child: CustomTextField(
//                 hint: "Mdcataacademy@gmail.com",
//                 icon: Icons.email_outlined,
//                 borderColor: Color(0xFF793FFF),
//                 iconColor: Color(0xFF793FFF),
//                 hintColor: Color(0xFF793FFF),
//               ),
//             ),

//             const Spacer(),

//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: AppPadding.horizontal,
//                 vertical: 25,
//               ),
//               child: GradientButton(
//                 text: "Send Code",
//                 onPressed: () {
//                   // TODO: Implement send code logic
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _topGradientWithBack(BuildContext context) {
//     return Container(
//       height: 100,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [Color(0xFFEDE2FF), Colors.white],
//         ),
//       ),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 16),
//           child: GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child: Container(
//               width: 36,
//               height: 36,
//               decoration: const BoxDecoration(
//                 color: Color(0xFFE7DBFA),
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                 child: Transform.translate(
//                   offset: const Offset(2, 0),
//                   child: const Icon(
//                     Icons.arrow_back_ios,
//                     size: 18,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:mdcat/constants/constants.dart';
// import 'package:mdcat/widgets/custom_textfield.dart';
// import 'package:mdcat/widgets/gradient_button.dart';

// class ForgotPasswordScreen extends StatelessWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _topGradientWithBack(context),

//             const SizedBox(height: 20),

//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//               child: Text(
//                 "Forgot Password?",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 22,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 8),

//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//               child: Text(
//                 "Please enter the email address or phone number\nassociated with your account",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.black54,
//                   height: 1.4,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 25),

//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//               child: Text(
//                 "Email Address",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             const Padding(
//   padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//   child: CustomTextField(
//     hint: "Mdcataacademy@gmail.com",
//     icon: null, // no icon
//     iconColor: Colors.transparent, // hide icon
//     borderColor: Color(0x99793FFF), // 60% opacity purple
//     hintColor: Color(0xFF333333),   // dark gray hint
//   ),
// ),

//             const Spacer(),

//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: AppPadding.horizontal,
//                 vertical: 25,
//               ),
//               child: GradientButton(
//                 text: "Send Code",
//                 onPressed: () {
//                   // TODO: Implement send code logic
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _topGradientWithBack(BuildContext context) {
//     return Container(
//       height: 100,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [Color(0xFFEDE2FF), Colors.white],
//         ),
//       ),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 16),
//           child: GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child: Container(
//               width: 36,
//               height: 36,
//               decoration: const BoxDecoration(
//                 color: Color(0xFFE7DBFA),
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                 child: Transform.translate(
//                   offset: const Offset(2, 0),
//                   child: const Icon(
//                     Icons.arrow_back_ios,
//                     size: 18,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:mdcat/constants/constants.dart';
// import 'package:mdcat/widgets/custom_textfield.dart';
// import 'package:mdcat/widgets/gradient_button.dart';

// class ForgotPasswordScreen extends StatelessWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _topGradientWithBack(context),

//             const SizedBox(height: 20),

//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//               child: Text(
//                 "Forgot Password?",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//               ),
//             ),

//             const SizedBox(height: 8),

//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//               child: Text(
//                 "Please enter the email address or phone number\nassociated with your account",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.black54,
//                   height: 1.4,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 25),

//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//               child: Text(
//                 "Email Address",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//             ),

//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//               child: CustomTextField(
//                 hint: "Mdcatacademy@gmail.com",
//                 icon: Icons
//                     .email, // still required, but will hide with transparent color
//                 iconColor: Colors.transparent,
//                 borderColor: Color(0x99793FFF), // 60% opacity purple
//                 hintColor: Color(0xFF333333), // dark gray hint
//               ),
//             ),

//             const Spacer(),

//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: AppPadding.horizontal,
//                 vertical: 25,
//               ),
//               child: GradientButton(
//                 text: "Send Code",
//                 onPressed: () {
//                   // TODO: Implement send code logic
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _topGradientWithBack(BuildContext context) {
//     return Container(
//       height: 100,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [Color(0xFFEDE2FF), Colors.white],
//         ),
//       ),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 16),
//           child: GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child: Container(
//               width: 36,
//               height: 36,
//               decoration: const BoxDecoration(
//                 color: Color(0xFFE7DBFA),
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                 child: Transform.translate(
//                   offset: const Offset(2, 0),
//                   child: const Icon(
//                     Icons.arrow_back_ios,
//                     size: 18,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:mdcat/constants/constants.dart';
// import 'package:mdcat/widgets/gradient_button.dart';

// class ForgotPasswordScreen extends StatelessWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _topGradientWithBack(context),

//             const SizedBox(height: 20),

//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//               child: Text(
//                 "Forgot Password?",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//               ),
//             ),

//             const SizedBox(height: 8),

//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//               child: Text(
//                 "Please enter the email address or phone number\nassociated with your account",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.black54,
//                   height: 1.4,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 25),

//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//               child: Text(
//                 "Email Address",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//             ),

//             // Standalone TextField
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: AppPadding.horizontal,
//                 vertical: 8,
//               ),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: "Mdcatacademy@gmail.com",
//                   hintStyle: const TextStyle(color: Color(0xFF333333)),
//                   contentPadding: const EdgeInsets.symmetric(
//                     vertical: 14,
//                     horizontal: 20, // a bit more for circular look
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Color(0x99793FFF)),
//                     borderRadius: BorderRadius.circular(30), // fully circular
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Color(0x99793FFF)),
//                     borderRadius: BorderRadius.circular(30), // fully circular
//                   ),
//                 ),
//               ),
//             ),

//             const Spacer(),

//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: AppPadding.horizontal,
//                 vertical: 25,
//               ),
//               child: GradientButton(
//                 text: "Send Code",
//                 onPressed: () {
//                   // TODO: Implement send code logic
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _topGradientWithBack(BuildContext context) {
//     return Container(
//       height: 100,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [Color(0xFFEDE2FF), Colors.white],
//         ),
//       ),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 16),
//           child: GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child: Container(
//               width: 36,
//               height: 36,
//               decoration: const BoxDecoration(
//                 color: Color(0xFFE7DBFA),
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                 child: Transform.translate(
//                   offset: const Offset(2, 0),
//                   child: const Icon(
//                     Icons.arrow_back_ios,
//                     size: 18,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, // prevents button moving
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _topGradientWithBack(context),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.horizontal,
                      ),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.horizontal,
                      ),
                      child: Text(
                        "Please enter the email address or phone number\nassociated with your account",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.horizontal,
                      ),
                      child: Text(
                        "Email Address",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.horizontal,
                        vertical: 8,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Mdcatacademy@gmail.com",
                          hintStyle: const TextStyle(color: Color(0xFF333333)),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 20,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x99793FFF),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x99793FFF),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Fixed button at bottom
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.horizontal,
                vertical: 25,
              ),
              child: GradientButton(
                text: "Send Code",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OTPVerificationScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topGradientWithBack(BuildContext context) {
    return Container(
      height: 100,
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
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Color(0xFFE7DBFA),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Transform.translate(
                  offset: const Offset(2, 0),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
