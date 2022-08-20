import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guitar_hero_mobile/screens/songs_screen/songs_screen_view.dart';
import 'package:guitar_hero_mobile/screens/songs_screen/songs_screen_view_model.dart';

class SongsScreen extends StatefulWidget {
  const SongsScreen({Key? key}) : super(key: key);

  @override
  SongsScreenViewModel createState() => SongsScreenView();
}
