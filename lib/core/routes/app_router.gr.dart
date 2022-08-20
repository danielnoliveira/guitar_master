// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../screens/developer_screen/developer_screen.dart' as _i3;
import '../../screens/game_screen/game_screen.dart' as _i5;
import '../../screens/home_screen/home_screen.dart' as _i2;
import '../../screens/songs_screen/songs_screen.dart' as _i4;
import '../../screens/splash_screen/splash_screen.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    DeveloperScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.DeveloperScreen());
    },
    SongsScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SongsScreen());
    },
    GameScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.GameScreen());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i6.RouteConfig(HomeScreenRoute.name, path: '/home'),
        _i6.RouteConfig(DeveloperScreenRoute.name, path: '/home/credits'),
        _i6.RouteConfig(SongsScreenRoute.name, path: '/home/songs'),
        _i6.RouteConfig(GameScreenRoute.name, path: 'home/game')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i6.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '/home');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i3.DeveloperScreen]
class DeveloperScreenRoute extends _i6.PageRouteInfo<void> {
  const DeveloperScreenRoute()
      : super(DeveloperScreenRoute.name, path: '/home/credits');

  static const String name = 'DeveloperScreenRoute';
}

/// generated route for
/// [_i4.SongsScreen]
class SongsScreenRoute extends _i6.PageRouteInfo<void> {
  const SongsScreenRoute() : super(SongsScreenRoute.name, path: '/home/songs');

  static const String name = 'SongsScreenRoute';
}

/// generated route for
/// [_i5.GameScreen]
class GameScreenRoute extends _i6.PageRouteInfo<void> {
  const GameScreenRoute() : super(GameScreenRoute.name, path: 'home/game');

  static const String name = 'GameScreenRoute';
}
