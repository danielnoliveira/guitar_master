import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:guitar_hero_mobile/core/enum/e_disc_type.dart';
import 'package:guitar_hero_mobile/core/routes/app_router.dart';
import 'package:guitar_hero_mobile/widgets/disc.dart';
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Disc> allDiscs = [];
  List<Disc> activeDiscs = [];
  FlutterSoundPlayer _myPlayer = FlutterSoundPlayer();

  int points = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSound();
    // Future.delayed(Duration(seconds: 1), () {
    //   setState(() {
    //     allDiscs.add(
    //       Disc(
    //         myKey: GlobalKey(),
    //         discType: eDiscType.green,
    //         leftPosition: 0,
    //         disableDisc: removeDiscOutOfBorder,
    //         enableDisc: addActiveDisc,
    //       ),
    //     );
    //   });
    // });
    Timer.periodic(Duration(seconds: 2), (Timer t) {
      setState(() {
        allDiscs.add(
          Disc(
            myKey: GlobalKey(),
            discType: eDiscType.values[Random().nextInt(4)],
            leftPosition: 0,
            disableDisc: removeDiscOutOfBorder,
            enableDisc: addActiveDisc,
          ),
        );
      });
    });
  }

  Future initSound() async {
    await _myPlayer.openPlayer();
    await _myPlayer.startPlayer(
      fromURI:
          'https://fine.sunproxy.net/file/Y0ZNN1Y4ZzJnRVJoVERVTSs4TDhQRnEzS3hWMmQyaEZQOXQ4bHp2V2lWM2xXbnZ2N1hKb0w1djhwb3hKS3R5byt3NVNFRkwzNlU2RWlDSkNnUVZ1cEkyUGI3MXJrWXRlS25rY3JtSEFLRFk9/Linkin_Park_-_In_the_End_(BornMP3.com).mp3',
      codec: Codec.mp3,
    );
  }

  void addActiveDisc(Disc disc) {
    activeDiscs.add(disc);
  }

  void removeDiscOutOfBorder(Disc disc) {
    activeDiscs.remove(disc);
  }

  Offset? getGlobalPaintBounds(GlobalKey widgetId) {
    final renderObject =
        widgetId.currentContext?.findRenderObject() as RenderBox;

    if (renderObject != null) {
      final Offset offset = renderObject.localToGlobal(Offset.zero);
      return offset;
    } else {
      return null;
    }
  }

  GlobalKey greenSpawn = GlobalKey(debugLabel: 'green spawn');
  GlobalKey redSpawn = GlobalKey(debugLabel: 'red spawn');
  GlobalKey yellowSpawn = GlobalKey(debugLabel: 'yellow spawn');
  GlobalKey blueSpawn = GlobalKey(debugLabel: 'blue spawn');

  @override
  Widget build(BuildContext context) {
    Size defaultButtonSize = Size(25.w, 25.w);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black.withOpacity(0.85),
          child: Stack(
            children: [
              Positioned(
                left: 12.5.w - 10,
                child:
                    SpawnPoint(spawnKey: greenSpawn, spawnColor: Colors.green),
              ),
              Positioned(
                  left: 37.5.w - 10,
                  child:
                      SpawnPoint(spawnKey: redSpawn, spawnColor: Colors.red)),
              Positioned(
                left: 62.5.w - 10,
                child: SpawnPoint(
                    spawnKey: yellowSpawn, spawnColor: Colors.yellow),
              ),
              Positioned(
                  left: 87.5.w - 10,
                  child:
                      SpawnPoint(spawnKey: blueSpawn, spawnColor: Colors.blue)),
              for (var i = 17.5; i < 100; i += 17.5)
                HorizontalLine(
                  topPosition: i.h,
                ),
              for (var i = 25; i < 100; i += 25)
                VerticalLine(leftPosition: i.w),
              Container(
                width: 100.w,
                height: 100.h,
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            for (var d in activeDiscs) {
                              var rb = d.myKey.currentContext
                                  ?.findRenderObject() as RenderBox;
                              Offset of = rb.localToGlobal(Offset.zero);
                              bool amIinsideGreenButtonXaxis =
                                  of.dx >= 0 && of.dx < 25.w;
                              double buttonYaxis = 100.h - 25.w;
                              bool amIinsideGreenButtonYaxis = of.dy < 100.h &&
                                  (of.dy + 15.w) >= buttonYaxis;

                              if (amIinsideGreenButtonXaxis &&
                                  amIinsideGreenButtonYaxis) {
                                d.discState.updateWasIhitted(true);
                                removeDiscOutOfBorder(d);
                                setState(() {
                                  points++;
                                });
                                break;
                              }
                            }
                          },
                          child: null,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            fixedSize: defaultButtonSize,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            for (var d in activeDiscs) {
                              var rb = d.myKey.currentContext
                                  ?.findRenderObject() as RenderBox;
                              Offset of = rb.localToGlobal(Offset.zero);
                              bool amIinsideRedButtonXaxis =
                                  of.dx >= 25.w && of.dx < 50.w;
                              double buttonYaxis = 100.h - 25.w;
                              bool amIinsideRedButtonYaxis = of.dy < 100.h &&
                                  (of.dy + 15.w) >= buttonYaxis;

                              if (amIinsideRedButtonXaxis &&
                                  amIinsideRedButtonYaxis) {
                                d.discState.updateWasIhitted(true);
                                removeDiscOutOfBorder(d);
                                setState(() {
                                  points++;
                                });
                                break;
                              }
                            }
                          },
                          child: null,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            fixedSize: defaultButtonSize,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            for (var d in activeDiscs) {
                              var rb = d.myKey.currentContext
                                  ?.findRenderObject() as RenderBox;
                              Offset of = rb.localToGlobal(Offset.zero);
                              bool amIinsideRedButtonXaxis =
                                  of.dx >= 50.w && of.dx < 75.w;
                              double buttonYaxis = 100.h - 25.w;
                              bool amIinsideRedButtonYaxis = of.dy < 100.h &&
                                  (of.dy + 15.w) >= buttonYaxis;

                              if (amIinsideRedButtonXaxis &&
                                  amIinsideRedButtonYaxis) {
                                d.discState.updateWasIhitted(true);
                                removeDiscOutOfBorder(d);
                                setState(() {
                                  points++;
                                });
                                break;
                              }
                            }
                          },
                          child: null,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.yellow,
                            fixedSize: defaultButtonSize,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            for (var d in activeDiscs) {
                              var rb = d.myKey.currentContext
                                  ?.findRenderObject() as RenderBox;
                              Offset of = rb.localToGlobal(Offset.zero);
                              bool amIinsideRedButtonXaxis =
                                  of.dx >= 75.w && of.dx < 100.w;
                              double buttonYaxis = 100.h - 25.w;
                              bool amIinsideRedButtonYaxis = of.dy < 100.h &&
                                  (of.dy + 15.w) >= buttonYaxis;

                              if (amIinsideRedButtonXaxis &&
                                  amIinsideRedButtonYaxis) {
                                d.discState.updateWasIhitted(true);
                                removeDiscOutOfBorder(d);
                                setState(() {
                                  points++;
                                });
                                break;
                              }
                            }
                          },
                          child: null,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            fixedSize: defaultButtonSize,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ...allDiscs
                  .map((disc) => Builder(builder: (context) {
                        Offset? offset;
                        switch (disc.discType) {
                          case eDiscType.green:
                            offset = getGlobalPaintBounds(greenSpawn);
                            break;

                          case eDiscType.red:
                            offset = getGlobalPaintBounds(redSpawn);
                            break;
                          case eDiscType.yellow:
                            offset = getGlobalPaintBounds(yellowSpawn);
                            break;
                          case eDiscType.blue:
                            offset = getGlobalPaintBounds(blueSpawn);
                            break;
                        }

                        if (offset == null) {
                          return SizedBox();
                        }
                        disc.leftPosition = offset.dx - 8.5.w;
                        return disc;
                      }))
                  .toList(),
              Positioned(
                left: 50.w - 12,
                child: Text(
                  points.toString(),
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpawnPoint extends StatelessWidget {
  final Color spawnColor;
  final GlobalKey spawnKey;
  const SpawnPoint({
    Key? key,
    required this.spawnKey,
    required this.spawnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: spawnKey,
      width: 20,
      height: 20,
      color: spawnColor,
    );
  }
}

class HorizontalLine extends StatelessWidget {
  final double topPosition;
  const HorizontalLine({
    Key? key,
    required this.topPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topPosition,
      child: Container(
        width: 100.w,
        height: 4,
        color: Colors.grey,
      ),
    );
  }
}

class VerticalLine extends StatelessWidget {
  final double leftPosition;
  const VerticalLine({Key? key, required this.leftPosition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftPosition,
      child: Container(
        width: 2,
        height: 100.h,
        color: Colors.grey,
      ),
    );
  }
}
