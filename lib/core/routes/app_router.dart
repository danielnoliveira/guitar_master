import 'package:auto_route/auto_route.dart';
import 'package:guitar_hero_mobile/screens/developer_screen/developer_screen.dart';
import 'package:guitar_hero_mobile/screens/game_screen/game_screen.dart';
import 'package:guitar_hero_mobile/screens/home_screen/home_screen.dart';
import 'package:guitar_hero_mobile/screens/songs_screen/songs_screen.dart';
import 'package:guitar_hero_mobile/screens/splash_screen/splash_screen.dart';

import 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: HomeScreen, initial: true, path: '/home'),
    AutoRoute(page: DeveloperScreen, initial: true, path: '/home/credits'),
    AutoRoute(page: SongsScreen, initial: true, path: '/home/songs'),
    AutoRoute(page: GameScreen, initial: true, path: 'home/game'),
  ],
)
class $AppRouter extends AppRouter {}
