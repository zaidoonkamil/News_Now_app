import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Untitled.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
