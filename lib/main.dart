import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_am/screens/auth/login_screen.dart';
import 'package:i_am/screens/auth/signup_screen.dart';
import 'package:i_am/screens/main_screen.dart';
import 'package:i_am/screens/splash_screen.dart';
import 'package:i_am/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I-Am',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primaryColor),
        useMaterial3: true,
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/splash':
            return CupertinoPageRoute(
              builder: (context) => const SplashScreen(),
            );
          case '/login':
            return CupertinoPageRoute(
              builder: (context) => const LoginScreen(),
            );
          case '/signup':
            return CupertinoPageRoute(
              builder: (context) => const SignUpScreen(),
            );
          case '/home':
            return CupertinoPageRoute(
              builder: (context) => const MainScreen(),
            );
          default:
            return null;
        }
      },
      home: MainScreen(),
    );
  }
}
