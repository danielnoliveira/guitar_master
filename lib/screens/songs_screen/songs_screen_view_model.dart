import 'package:flutter/widgets.dart';
import 'package:guitar_hero_mobile/core/helpers/chart_reader_helper.dart';
import 'package:guitar_hero_mobile/core/model/chart.dart';

import 'songs_screen.dart';

abstract class SongsScreenViewModel extends State<SongsScreen> {
  late Future<List<Chart>> futureListOfCharts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureListOfCharts = ChartReaderHelper.getListOfSongs();
  }
}
