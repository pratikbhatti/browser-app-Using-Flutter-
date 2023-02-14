import 'dart:async';

import 'package:demo29/screens/home/view/homePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //splash screen
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animated/splash_screen.json',
          repeat: false,
          reverse: false,
        ),
      ),
    );
  }
}
