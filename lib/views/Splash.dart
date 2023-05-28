import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yumnotes/constants/constants.dart';
import 'package:yumnotes/views/PremiumScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => moveToNextScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: kAppbarBg,
        body: Center(
          child: Image(
            width: 313,
            height: 156,
            image: AssetImage("assets/logo.png"),
          ),
        ),
      ),
    );
  }

  moveToNextScreen() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PremiumScreen(),
      ),
    );
  }
}
