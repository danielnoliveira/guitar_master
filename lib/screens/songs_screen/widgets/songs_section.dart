import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guitar_hero_mobile/core/model/chart.dart';
import 'package:guitar_hero_mobile/core/model/song.dart';
import 'package:guitar_hero_mobile/core/routes/app_router.gr.dart';
import 'package:guitar_hero_mobile/screens/game_screen/game_screen.dart';
import 'package:sizer/sizer.dart';

class SongsSection extends StatelessWidget {
  final String sectionTitle;
  final List<Chart> charts;
  const SongsSection(
      {Key? key, required this.sectionTitle, required this.charts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: GoogleFonts.schoolbell(
            fontSize: 8.w,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4),
          width: 92.w,
          height: 2.5,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        for (var s in charts)
          GestureDetector(
            onTap: () {
              AutoRouter.of(context).push(GameScreenRoute(chart: s));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    s.song.artist ?? '',
                    style: GoogleFonts.schoolbell(
                      fontSize: 6.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                    ),
                    child: Text(
                      '${s.song.album}, ${s.song.year}',
                      style: GoogleFonts.schoolbell(
                        fontSize: 5.w,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
