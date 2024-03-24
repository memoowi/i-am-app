import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am/bloc/auth_bloc.dart';
import 'package:i_am/bloc/booking_list_bloc.dart';
import 'package:i_am/screens/auth/login_screen.dart';
import 'package:i_am/screens/auth/signup_screen.dart';
import 'package:i_am/screens/main_screen.dart';
import 'package:i_am/screens/map_screen.dart';
import 'package:i_am/screens/splash_screen.dart';
import 'package:i_am/utils/theme.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AppStarted()),
        ),
        BlocProvider(
          create: (context) => BookingListBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          case '/':
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
          case '/maps':
            return CupertinoPageRoute(
              builder: (context) => const MapScreen(),
            );
          default:
            return null;
        }
      },
    );
  }
}
