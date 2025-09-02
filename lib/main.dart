import 'package:flutter/material.dart';
import 'package:mdcat/providers/class_selection_provider.dart';
import 'package:mdcat/providers/forget_password_provider.dart';
import 'package:mdcat/providers/gender_provider.dart';
import 'package:mdcat/providers/new_password_provider.dart';
import 'package:mdcat/providers/quiz_provider.dart';
import 'package:mdcat/providers/signup_provider.dart';
// import 'package:mdcat/view/on_boardingwrapper.dart';
import 'package:mdcat/view/payment_screen.dart';
// import 'package:mdcat/widgets/on_boardingwrapper.dart';
// import 'package:mdcat/view/2on_boarding_screen.dart';
// import 'package:mdcat/view/3on_boardingscreen.dart';
// import 'package:mdcat/view/on_boardingscreen.dart';
// import 'package:mdcat/view/on_boardingwrapper.dart';
// import 'package:mdcat/view/on_boardingscreen.dart';
// import 'package:mdcat/view/on_boardingscreen.dart';
// import 'package:mdcat/view/2on_boarding_screen.dart';
// import 'package:mdcat/view/3on_boardingscreen.dart';
// import 'package:mdcat/view/2on_boarding_screen.dart';
// import 'package:mdcat/view/loginscreen.dart';
// import 'package:mdcat/view/on_boardingscreen.dart';
// import 'package:mdcat/view/homescreen.dart';
// import 'package:mdcat/view/loginscreen.dart';
// import 'package:mdcat/view/on_boardingscreen.dart';
import 'package:provider/provider.dart';
// import 'package:mdcat/view/loginscreen.dart';
import 'package:mdcat/providers/login_provider.dart';
// import other providers when needed
// import 'package:mdcat/providers/signup_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        // Add other providers here
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (_) => NewPasswordProvider()),
        ChangeNotifierProvider(create: (_) => GenderProvider()),
        ChangeNotifierProvider(create: (context) => ClassSelectionProvider()),
        ChangeNotifierProvider(create: (_) => QuizProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        // Start with LoginScreen instead of HomeScreen if you want login first
        // home: OnboardingWrapper(),
        home: PaymentUploadScreen(),
      ),
    );
  }
}
