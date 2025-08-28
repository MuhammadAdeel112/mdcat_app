// import 'package:flutter/material.dart';
// import 'package:mdcat/constants/constants.dart';
// import 'package:mdcat/view/Forget_passwordscreen.dart';
// import 'package:mdcat/view/signupscreen.dart';
// import 'package:mdcat/widgets/custom_textfield.dart';
// import 'package:mdcat/widgets/gradient_button.dart';
// import 'package:mdcat/widgets/topgardientwithback.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             return SingleChildScrollView(
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(minHeight: constraints.maxHeight),
//                 child: IntrinsicHeight(
//                   child: Column(
//                     children: [
//                       TopGradientWithBack(
//                         onBack: () {
//                           // optional: custom back action
//                           Navigator.pop(context);
//                         },
//                       ),

//                       _tabSwitcher(
//                         leftText: "Sign In",
//                         rightText: "Sign Up",
//                         isLeftActive: true,
//                         onRightTap: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (_) => SignupScreen()),
//                           );
//                         },
//                       ),

//                       _spacer(),
//                       const SizedBox(height: 30),
//                       _label("Email"),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: AppPadding.horizontal,
//                         ),

//                         child: CustomTextField(
//                           hint: "Mdcataacademy@gmail.com",
//                           icon: Icons.email_outlined,
//                           borderColor: Color(0xFF793FFF),
//                           iconColor: Color(0xFF793FFF),
//                           hintColor: Color(0xFF793FFF),
//                         ),
//                       ),

//                       _spacer(),

//                       _label("Password"),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: CustomTextField(
//                           hint: "********",
//                           icon: Icons.lock_outline,
//                           obscure: true,
//                           borderColor: Color(0xFF793FFF), // Purple border
//                           iconColor: Color(0xFF0F1C2C), // Purple icon
//                           hintColor: Color(0xFF0F1C2C), // Dark grey hint
//                         ),
//                       ),

//                       // const   _rememberForgot(),
//                       RememberForgot(),
//                       const Spacer(),

//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: AppPadding.horizontal,
//                         ),
//                         child: GradientButton(
//                           text: "Sign In",
//                           onPressed: () {},
//                         ),
//                       ),

//                       const SizedBox(height: 25),
//                       const Text(
//                         "Or Sign in with",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 25),
//                       _socialRow(),

//                       const Spacer(),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _tabSwitcher({
//     required String leftText,
//     required String rightText,
//     required bool isLeftActive,
//     required VoidCallback onRightTap,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: AppPadding.horizontal,
//         right: AppPadding.horizontal,
//         top: 12, // space from arrow
//       ),
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//           border: Border.all(color: const Color(0xFF8352F1)),
//           borderRadius: BorderRadius.circular(13), // less circular
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Container(
//                 height: double.infinity,
//                 decoration: BoxDecoration(
//                   gradient: isLeftActive ? AppColors.signInGradient : null,
//                   borderRadius: BorderRadius.circular(13),
//                 ),
//                 child: Center(
//                   child: Text(
//                     leftText,
//                     style: TextStyle(
//                       color: isLeftActive ? Colors.white : Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: GestureDetector(
//                 onTap: onRightTap,
//                 child: Container(
//                   height: double.infinity,
//                   decoration: BoxDecoration(
//                     gradient: !isLeftActive ? AppColors.signInGradient : null,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Center(
//                     child: Text(
//                       rightText,
//                       style: TextStyle(
//                         color: !isLeftActive ? Colors.white : Colors.black,
//                         fontWeight: FontWeight.bold,
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

//   Widget _label(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Text(
//           text,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold, // makes it bold
//             fontSize: 16, // optional: makes it look nicer
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _spacer() => const SizedBox(height: AppPadding.fieldSpacing);
//   Widget _socialRow() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         _socialButton("Facebook", "assets/images/facebook.jpg", width: 167),
//         const SizedBox(width: 15),
//         _socialButton("Google", "assets/images/google.png", width: 167),
//       ],
//     );
//   }

//   Widget _socialButton(String text, String assetPath, {required double width}) {
//     return Container(
//       width: width,
//       height: 48,
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 41),
//       decoration: BoxDecoration(
//         color: const Color(0x1A793FFF), // #793FFF with 10% opacity
//         borderRadius: BorderRadius.circular(40),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Image.asset(assetPath, width: 20, height: 20, fit: BoxFit.contain),
//           Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }

// class RememberForgot extends StatelessWidget {
//   final ValueNotifier<bool> rememberMe = ValueNotifier<bool>(false);

//   RememberForgot({super.key});

//   void _toggle(bool? v) {
//     rememberMe.value = v ?? !rememberMe.value;
//   }

//   @override
//   Widget build(BuildContext context) {
//     const purple = Color(0xFF793FFF);

//     return Padding(
//       padding: const EdgeInsets.only(
//         left: AppPadding.horizontal - 10,
//         right: AppPadding.horizontal,
//         top: 5,
//         bottom: 5,
//       ),
//       child: Row(
//         children: [
//           ValueListenableBuilder<bool>(
//             valueListenable: rememberMe,
//             builder: (context, value, _) {
//               return Checkbox(
//                 value: value,
//                 onChanged: _toggle,
//                 checkColor: Colors.white,
//                 fillColor: MaterialStateProperty.all(purple),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               );
//             },
//           ),
//           GestureDetector(
//             onTap: () => _toggle(!rememberMe.value),
//             child: const Text(
//               "Remember me",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           const Spacer(),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
//               );
//             },
//             child: const Text(
//               "Forgot Password?",
//               style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:mdcat/constants/constants.dart';
// import 'package:mdcat/view/Forget_passwordscreen.dart';
// import 'package:mdcat/view/signupscreen.dart';
// import 'package:mdcat/widgets/custom_textfield.dart';
// import 'package:mdcat/widgets/gradient_button.dart';
// import 'package:mdcat/widgets/topgardientwithback.dart';

// import '../providers/login_provider.dart'; // 👈 new provider import

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => LoginProvider(), // 👈 attach provider
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               final provider = Provider.of<LoginProvider>(context); // 👈 provider instance
//               return SingleChildScrollView(
//                 child: ConstrainedBox(
//                   constraints: BoxConstraints(minHeight: constraints.maxHeight),
//                   child: IntrinsicHeight(
//                     child: Column(
//                       children: [
//                         TopGradientWithBack(
//                           onBack: () {
//                             Navigator.pop(context);
//                           },
//                         ),

//                         _tabSwitcher(
//                           leftText: "Sign In",
//                           rightText: "Sign Up",
//                           isLeftActive: true,
//                           onRightTap: () {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(builder: (_) => SignupScreen()),
//                             );
//                           },
//                         ),

//                         _spacer(),
//                         const SizedBox(height: 30),
//                         _label("Email"),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: AppPadding.horizontal,
//                           ),
//                           child: CustomTextField(
//                             hint: "Mdcataacademy@gmail.com",
//                             icon: Icons.email_outlined,
//                             borderColor: Color(0xFF793FFF),
//                             iconColor: Color(0xFF793FFF),
//                             hintColor: Color(0xFF793FFF),
//                             textEditingController: provider.emailController, // 👈 connected controller
//                           ),
//                         ),

//                         _spacer(),

//                         _label("Password"),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: CustomTextField(
//                             hint: "********",
//                             icon: Icons.lock_outline,
//                             obscure: true,
//                             borderColor: Color(0xFF793FFF),
//                             iconColor: Color(0xFF0F1C2C),
//                             hintColor: Color(0xFF0F1C2C),
//                             textEditingController: provider.passwordController, // 👈 connected controller
//                           ),
//                         ),

//                         RememberForgot(),
//                         const Spacer(),

//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: AppPadding.horizontal,
//                           ),

//                           child: GradientButton(
//                             text: "Sign In",
//                             onPressed: () {
//                               provider.login(context); // 👈 login method
//                             },
//                           ),
//                         ),

//                         const SizedBox(height: 25),
//                         const Text(
//                           "Or Sign in with",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 25),
//                         _socialRow(),

//                         const Spacer(),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _tabSwitcher({
//     required String leftText,
//     required String rightText,
//     required bool isLeftActive,
//     required VoidCallback onRightTap,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: AppPadding.horizontal,
//         right: AppPadding.horizontal,
//         top: 12,
//       ),
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//           border: Border.all(color: const Color(0xFF8352F1)),
//           borderRadius: BorderRadius.circular(13),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Container(
//                 height: double.infinity,
//                 decoration: BoxDecoration(
//                   gradient: isLeftActive ? AppColors.signInGradient : null,
//                   borderRadius: BorderRadius.circular(13),
//                 ),
//                 child: Center(
//                   child: Text(
//                     leftText,
//                     style: TextStyle(
//                       color: isLeftActive ? Colors.white : Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: GestureDetector(
//                 onTap: onRightTap,
//                 child: Container(
//                   height: double.infinity,
//                   decoration: BoxDecoration(
//                     gradient: !isLeftActive ? AppColors.signInGradient : null,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Center(
//                     child: Text(
//                       rightText,
//                       style: TextStyle(
//                         color: !isLeftActive ? Colors.white : Colors.black,
//                         fontWeight: FontWeight.bold,
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

//   Widget _label(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Text(
//           text,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _spacer() => const SizedBox(height: AppPadding.fieldSpacing);

//   Widget _socialRow() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         _socialButton("Facebook", "assets/images/facebook.jpg", width: 167),
//         const SizedBox(width: 15),
//         _socialButton("Google", "assets/images/google.png", width: 167),
//       ],
//     );
//   }

//   Widget _socialButton(String text, String assetPath, {required double width}) {
//     return Container(
//       width: width,
//       height: 48,
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 41),
//       decoration: BoxDecoration(
//         color: const Color(0x1A793FFF),
//         borderRadius: BorderRadius.circular(40),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Image.asset(assetPath, width: 20, height: 20, fit: BoxFit.contain),
//           Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }

// class RememberForgot extends StatelessWidget {
//   final ValueNotifier<bool> rememberMe = ValueNotifier<bool>(false);

//   RememberForgot({super.key});

//   void _toggle(bool? v) {
//     rememberMe.value = v ?? !rememberMe.value;
//   }

//   @override
//   Widget build(BuildContext context) {
//     const purple = Color(0xFF793FFF);

//     return Padding(
//       padding: const EdgeInsets.only(
//         left: AppPadding.horizontal - 10,
//         right: AppPadding.horizontal,
//         top: 5,
//         bottom: 5,
//       ),
//       child: Row(
//         children: [
//           ValueListenableBuilder<bool>(
//             valueListenable: rememberMe,
//             builder: (context, value, _) {
//               return Checkbox(
//                 value: value,
//                 onChanged: _toggle,
//                 checkColor: Colors.white,
//                 fillColor: MaterialStateProperty.all(purple),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               );
//             },
//           ),
//           GestureDetector(
//             onTap: () => _toggle(!rememberMe.value),
//             child: const Text(
//               "Remember me",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           const Spacer(),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
//               );
//             },
//             child: const Text(
//               "Forgot Password?",
//               style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mdcat/widgets/gradient_button.dart';
import 'package:provider/provider.dart';
import 'package:mdcat/constants/constants.dart';
import 'package:mdcat/view/Forget_passwordscreen.dart';
import 'package:mdcat/view/signupscreen.dart';
import 'package:mdcat/widgets/custom_textfield.dart';
// import 'package:mdcat/widgets/gradient_button.dart';
import 'package:mdcat/widgets/topgardientwithback.dart';

import '../providers/login_provider.dart'; // 👈 new provider import

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(), // 👈 attach provider
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final provider = Provider.of<LoginProvider>(
                context,
              ); // 👈 provider instance
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        TopGradientWithBack(
                          onBack: () {
                            Navigator.pop(context);
                          },
                        ),

                        _tabSwitcher(
                          leftText: "Sign In",
                          rightText: "Sign Up",
                          isLeftActive: true,
                          onRightTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => SignupScreen()),
                            );
                          },
                        ),

                        _spacer(),
                        const SizedBox(height: 30),
                        _label("Email"),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.horizontal,
                          ),
                          child: CustomTextField(
                            hint: "Mdcataacademy@gmail.com",
                            icon: Icons.email_outlined,
                            borderColor: Color(0xFF793FFF),
                            iconColor: Color(0xFF793FFF),
                            hintColor: Color(0xFF793FFF),
                            textEditingController: provider
                                .emailController, // 👈 connected controller
                          ),
                        ),

                        _spacer(),

                        _label("Password"),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextField(
                            hint: "********",
                            icon: Icons.lock_outline,
                            obscure: true,
                            borderColor: Color(0xFF793FFF),
                            iconColor: Color(0xFF0F1C2C),
                            hintColor: Color(0xFF0F1C2C),
                            textEditingController: provider
                                .passwordController, // 👈 connected controller
                          ),
                        ),

                        RememberForgot(),
                        const Spacer(),

                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //     horizontal: AppPadding.horizontal,
                        //   ),
                        //   child: ElevatedButton(
                        //     onPressed: provider.isLoading
                        //         ? null
                        //         : () {
                        //             provider.login(context);
                        //           },
                        //     style: ElevatedButton.styleFrom(
                        //       backgroundColor: const Color(0xFF8C59FF),
                        //       padding: const EdgeInsets.symmetric(vertical: 14),
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //     ),
                        //     child: provider.isLoading
                        //         ? const SizedBox(
                        //             height: 20,
                        //             width: 20,
                        //             child: CircularProgressIndicator(
                        //               color: Colors.white,
                        //               strokeWidth: 2,
                        //             ),
                        //           )
                        //         : const Text(
                        //             "Sign In",
                        //             style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.horizontal,
                          ),
                          child: GradientButton(
                            text: "Sign In",
                            onPressed: () {
                              provider.login(context); // 👈 login method
                            },
                          ),
                        ),
                        const SizedBox(height: 25),

                        // const Text(
                        //   "Or Sign in with",
                        //   style: TextStyle(fontWeight: FontWeight.bold),
                        // ),
                        // const SizedBox(height: 25),
                        // _socialRow(),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _tabSwitcher({
    required String leftText,
    required String rightText,
    required bool isLeftActive,
    required VoidCallback onRightTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppPadding.horizontal,
        right: AppPadding.horizontal,
        top: 12,
      ),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF8352F1)),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: isLeftActive ? AppColors.signInGradient : null,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Center(
                  child: Text(
                    leftText,
                    style: TextStyle(
                      color: isLeftActive ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: onRightTap,
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: !isLeftActive ? AppColors.signInGradient : null,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      rightText,
                      style: TextStyle(
                        color: !isLeftActive ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  Widget _spacer() => const SizedBox(height: AppPadding.fieldSpacing);

  // Widget _socialRow() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       _socialButton("Facebook", "assets/images/facebook.jpg", width: 167),
  //       const SizedBox(width: 15),
  //       _socialButton("Google", "assets/images/google.png", width: 167),
  //     ],
  //   );
  // }

  // Widget _socialButton(String text, String assetPath, {required double width}) {
  //   return Container(
  //     width: width,
  //     height: 48,
  //     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 41),
  //     decoration: BoxDecoration(
  //       color: const Color(0x1A793FFF),
  //       borderRadius: BorderRadius.circular(40),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Image.asset(assetPath, width: 20, height: 20, fit: BoxFit.contain),
  //         Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
  //       ],
  //     ),
  //   );
  // }
}

//with provider
class RememberForgot extends StatelessWidget {
  const RememberForgot({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context); // 👈 get provider
    const purple = Color(0xFF793FFF);

    return Padding(
      padding: const EdgeInsets.only(
        left: AppPadding.horizontal - 10,
        right: AppPadding.horizontal,
        top: 5,
        bottom: 5,
      ),
      child: Row(
        children: [
          Checkbox(
            value: provider.rememberMe,
            onChanged: (v) {
              provider.toggleRememberMe();
            },
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all(purple),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          GestureDetector(
            onTap: () {
              provider.toggleRememberMe();
            },
            child: const Text(
              "Remember me",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
              );
            },
            child: const Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
