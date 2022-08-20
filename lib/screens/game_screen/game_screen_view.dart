import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guitar_hero_mobile/screens/game_screen/game_screen_view_model.dart';

class GameScreenView extends GameScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
      ),
    );
  }
}
