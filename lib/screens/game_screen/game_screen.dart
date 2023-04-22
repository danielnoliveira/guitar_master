import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guitar_hero_mobile/core/model/chart.dart';
import 'package:guitar_hero_mobile/core/model/song.dart';
import 'package:guitar_hero_mobile/screens/game_screen/game_screen_view.dart';
import 'package:guitar_hero_mobile/screens/game_screen/game_screen_view_model.dart';

class GameScreen extends StatefulWidget {
  final Chart chart;
  const GameScreen({Key? key, required this.chart}) : super(key: key);

  @override
  GameScreenViewModel createState() => GameScreenView();
}
