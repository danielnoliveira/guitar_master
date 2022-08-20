import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guitar_hero_mobile/screens/home_screen/home_screen_view_model.dart';
import 'package:sizer/sizer.dart';

class HomeScreenView extends HomeScreenViewModel {
  @override
  Widget build(BuildContext context) {
    TextStyle buttonTextStyle = GoogleFonts.schoolbell(
      fontSize: 8.w,
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: 100.w,
        height: 100.h,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Spacer(),
            Text(
              'GUITAR MASTER',
              style: GoogleFonts.schoolbell(
                fontSize: 14.w,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                fixedSize: Size(60.w, 60),
              ),
              onPressed: () {
                AutoRouter.of(context).pushNamed('/home/songs');
              },
              child: Text('Jogar'.toUpperCase(), style: buttonTextStyle),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                fixedSize: Size(60.w, 60),
              ),
              onPressed: () {
                AutoRouter.of(context).pushNamed('/home/credits');
              },
              child: Text('Créditos'.toUpperCase(), style: buttonTextStyle),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      )),
    );
  }
}
