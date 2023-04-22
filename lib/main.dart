import 'package:flutter/material.dart';
import 'package:guitar_hero_mobile/core/routes/app_router.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = $AppRouter();
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp.router(
        title: 'Guitar Master',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(140, 2, 0, 1.0),
          scaffoldBackgroundColor: const Color.fromARGB(255, 80, 80, 80),
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
