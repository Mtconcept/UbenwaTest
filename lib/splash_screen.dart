import 'package:flutter/material.dart';
import 'package:ubenwa_test/animations.dart';
import 'package:ubenwa_test/onboardings.dart';

import 'constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToOnboarding(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: FadeInLeft(
          delay: Duration(seconds: 1),
          child: Center(
            child: Image.asset(
              "$imgPath/logo.png",
              width: 150,
            ),
          ),
        ),
      ),
    );
  }
}

_navigateToOnboarding(context) {
  Future.delayed(Duration(seconds: 3), () {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return Onboardings();
    }), (route) => false);
  });
}
