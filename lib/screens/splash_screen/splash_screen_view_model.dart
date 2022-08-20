import 'package:flutter/material.dart';
import 'package:guitar_hero_mobile/screens/splash_screen/splash_screen.dart';

abstract class SplashScreenViewModel extends State<SplashScreen> {
  bool startOpacity = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          startOpacity = true;
        });
      }
    });
  }
}
