import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guitar_hero_mobile/core/data/songs_list.dart';
import 'package:guitar_hero_mobile/core/helpers/chart_reader_helper.dart';
import 'package:guitar_hero_mobile/core/model/chart.dart';
import 'package:guitar_hero_mobile/core/model/song.dart';
import 'package:guitar_hero_mobile/screens/songs_screen/songs_screen_view_model.dart';
import 'package:guitar_hero_mobile/screens/songs_screen/widgets/songs_section.dart';
import 'package:sizer/sizer.dart';

class SongsScreenView extends SongsScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Lista de músicas',
          style: GoogleFonts.schoolbell(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: 100.w,
          height: 100.h - kToolbarHeight,
          padding: EdgeInsets.all(4.w),
          child: FutureBuilder(
              future: futureListOfCharts,
              builder: (context, snapthot) {
                return ListView.builder(
                  itemCount: bunchOfSongs.length,
                  itemBuilder: (_, index) {
                    if (snapthot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(
                        color: Colors.red,
                      );
                    }
                    String sectionTitle = bunchOfSongs.keys.toList()[index];
                    List<Chart> charts = [];
                    if (snapthot.hasData) {
                      charts = snapthot.data as List<Chart>;
                    }

                    return SongsSection(
                      sectionTitle: sectionTitle,
                      charts: charts,
                    );
                  },
                  shrinkWrap: true,
                );
              }),
        ),
      ),
    );
  }
}
