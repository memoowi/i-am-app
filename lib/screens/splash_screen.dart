import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/logo.png',
              scale: 0.7,
              filterQuality: FilterQuality.high,
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: const LinearProgressIndicator(
              minHeight: 5.0,
            ),
          ),
        ],
      ),
    );
  }
}
