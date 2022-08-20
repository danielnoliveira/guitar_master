import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'splash_screen_view_model.dart';
import 'widgets/guitars.dart';

class SplashScreenView extends SplashScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedOpacity(
            onEnd: () {
              AutoRouter.of(context).replaceNamed('/home');
            },
            duration: Duration(seconds: 3),
            opacity: startOpacity ? 1.0 : 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Guitars(),
                Text(
                  'GUITAR MASTER',
                  style: GoogleFonts.schoolbell(
                    fontSize: 10.w,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
