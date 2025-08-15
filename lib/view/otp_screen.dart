import 'package:flutter/material.dart';
import 'package:mdcat/constants/constants.dart';
import 'package:mdcat/widgets/gradient_button.dart';

// class OTPVerificationScreen extends StatelessWidget {
//   const OTPVerificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _topGradientWithBack(context),
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: AppPadding.horizontal,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 20),
//                     const Text(
//                       "Enter Confirmation Code",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 22,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     const Text(
//                       "Please Enter that six (6) digit code to example@gmail.com, and continue that was sent to your email address",
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.black54,
//                         height: 1.4,
//                       ),
//                     ),
//                     const SizedBox(height: 25),
//                     // OTP Fields Row
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: List.generate(6, (index) {
//                         return SizedBox(
//                           width: 45,
//                           height: 50,
//                           child: TextField(
//                             keyboardType: TextInputType.number,
//                             textAlign: TextAlign.center,
//                             maxLength: 1,
//                             decoration: InputDecoration(
//                               counterText: "",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: const BorderSide(
//                                   color: Color(0x99793FFF),
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: const BorderSide(
//                                   color: Color(0x99793FFF),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                     const SizedBox(height: 15),
//                     const Text(
//                       "You can Request a new OTP after 15 Second",
//                       style: TextStyle(fontSize: 14, color: Colors.black54),
//                     ),
//                     const SizedBox(
//                       height: 50,
//                     ), // spacing to scroll above keyboard
//                   ],
//                 ),
//               ),
//             ),
//             // Fixed Verify Button
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: AppPadding.horizontal,
//                 vertical: 20,
//               ),
//               child: Column(
//                 children: [
//                   GradientButton(
//                     text: "Verify",
//                     onPressed: () {
//                       // TODO: Implement verify logic
//                     },
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Don’t get a code? ",
//                         style: TextStyle(fontSize: 14),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           // TODO: Implement resend logic
//                         },
//                         child: const Text(
//                           "Resend",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Color(0xFF793FFF),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
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

// class OTPVerificationScreen extends StatefulWidget {
//   const OTPVerificationScreen({super.key});

//   @override
//   State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
// }

// class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
//   final List<TextEditingController> _controllers = List.generate(
//     6,
//     (_) => TextEditingController(),
//   );

//   @override
//   void dispose() {
//     for (var c in _controllers) {
//       c.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _topGradientWithBack(context),
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: AppPadding.horizontal,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 20),
//                     const Text(
//                       "Enter Confirmation Code",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 22,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     const Text(
//                       "Please Enter that six (6) digit code to example@gmail.com, and continue that was sent to your email address",
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.black54,
//                         height: 1.4,
//                       ),
//                     ),
//                     const SizedBox(height: 25),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: List.generate(6, (index) {
//                         return SizedBox(
//                           width: 45,
//                           height: 50,
//                           child: TextField(
//                             controller: _controllers[index],
//                             keyboardType: TextInputType.number,
//                             textAlign: TextAlign.center,
//                             maxLength: 1,
//                             onChanged: (value) {
//                               setState(() {}); // update UI when value changes
//                               if (value.isNotEmpty && index < 5) {
//                                 FocusScope.of(
//                                   context,
//                                 ).nextFocus(); // move to next box
//                               }
//                             },
//                             decoration: InputDecoration(
//                               counterText: "",
//                               filled: _controllers[index].text.isNotEmpty,
//                               fillColor: _controllers[index].text.isNotEmpty
//                                   ? const Color(0x99793FFF)
//                                   : Colors.white,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: const BorderSide(
//                                   color: Color(0x99793FFF),
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: const BorderSide(
//                                   color: Color(0x99793FFF),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                     const SizedBox(height: 15),
//                     const Text(
//                       "You can Request a new OTP after 15 Second",
//                       style: TextStyle(fontSize: 14, color: Colors.black54),
//                     ),
//                     const SizedBox(height: 50),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: AppPadding.horizontal,
//                 vertical: 20,
//               ),
//               child: Column(
//                 children: [
//                   GradientButton(
//                     text: "Verify",
//                     onPressed: () {
//                       // TODO: Implement verify logic
//                     },
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Don’t get a code? ",
//                         style: TextStyle(fontSize: 14),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           // TODO: Implement resend logic
//                         },
//                         child: const Text(
//                           "Resend",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Color(0xFF793FFF),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
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
//               child: const Icon(Icons.arrow_back_ios, size: 18),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            _topGradientWithBack(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.horizontal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Enter Confirmation Code",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Please Enter that six (6) digit code to example@gmail.com, and continue that was sent to your email address",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          width: 45,
                          height: 50,
                          child: TextField(
                            controller: _controllers[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            onChanged: (value) {
                              setState(
                                () {},
                              ); // update border color when filled
                              if (value.isNotEmpty && index < 5) {
                                FocusScope.of(
                                  context,
                                ).nextFocus(); // move to next box
                              }
                            },
                            decoration: InputDecoration(
                              counterText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: _controllers[index].text.isNotEmpty
                                      ? const Color(
                                          0xFF793FFF,
                                        ) // purple for filled
                                      : const Color(
                                          0xFFB3B3B3,
                                        ), // gray for empty
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: _controllers[index].text.isNotEmpty
                                      ? const Color(0xFF793FFF)
                                      : const Color(0xFFB3B3B3),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: _controllers[index].text.isNotEmpty
                                      ? const Color(0xFF793FFF)
                                      : const Color(0xFFB3B3B3),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: List.generate(6, (index) {
                    //     return SizedBox(
                    //       width: 45,
                    //       height: 50,
                    //       child: TextField(
                    //         controller: _controllers[index],
                    //         keyboardType: TextInputType.number,
                    //         textAlign: TextAlign.center,
                    //         maxLength: 1,
                    //         onChanged: (value) {
                    //           setState(() {}); // refresh to change border color
                    //           if (value.isNotEmpty && index < 5) {
                    //             FocusScope.of(context).nextFocus();
                    //           }
                    //         },
                    //         decoration: InputDecoration(
                    //           counterText: "",
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(8),
                    //             borderSide: BorderSide(
                    //               color: _controllers[index].text.isNotEmpty
                    //                   ? const Color(0xFF793FFF) // purple
                    //                   : const Color(0x99793FFF), // gray
                    //             ),
                    //           ),
                    //           enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(8),
                    //             borderSide: BorderSide(
                    //               color: _controllers[index].text.isNotEmpty
                    //                   ? const Color(0xFF793FFF)
                    //                   : const Color(0x99793FFF),
                    //             ),
                    //           ),
                    //           focusedBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(8),
                    //             borderSide: BorderSide(
                    //               color: _controllers[index].text.isNotEmpty
                    //                   ? const Color(0xFF793FFF)
                    //                   : const Color(0x99793FFF),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     );
                    //   }),
                    // ),
                    const SizedBox(height: 15),
                    const Text(
                      "You can Request a new OTP after 15 Second",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.horizontal,
                vertical: 20,
              ),
              child: Column(
                children: [
                  GradientButton(
                    text: "Verify",
                    onPressed: () {
                      // TODO: Implement verify logic
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t get a code? ",
                        style: TextStyle(fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: Implement resend logic
                        },
                        child: const Text(
                          "Resend",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF793FFF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
              child: const Icon(Icons.arrow_back_ios, size: 18),
            ),
          ),
        ),
      ),
    );
  }
}
