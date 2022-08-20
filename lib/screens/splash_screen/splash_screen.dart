import 'dart:math';

import 'package:flutter/material.dart';

import 'package:guitar_hero_mobile/screens/splash_screen/splash_screen_view.dart';
import 'package:guitar_hero_mobile/screens/splash_screen/splash_screen_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenViewModel createState() => SplashScreenView();
}
