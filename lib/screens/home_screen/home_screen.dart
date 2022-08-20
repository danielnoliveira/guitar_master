import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guitar_hero_mobile/screens/home_screen/home_screen_view.dart';
import 'package:guitar_hero_mobile/screens/home_screen/home_screen_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenViewModel createState() => HomeScreenView();
}
