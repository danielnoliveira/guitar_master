import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guitar_hero_mobile/screens/home_screen/home_screen_view_model.dart';

class HomeScreenView extends HomeScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
      ),
    );
  }
}
