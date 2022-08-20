import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guitar_hero_mobile/screens/songs_screen/songs_screen_view_model.dart';

class SongsScreenView extends SongsScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de musicas'),
      ),
    );
  }
}
