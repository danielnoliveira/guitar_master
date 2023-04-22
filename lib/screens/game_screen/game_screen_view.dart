import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guitar_hero_mobile/core/enum/e_disc_type.dart';
import 'package:guitar_hero_mobile/screens/game_screen/game_screen_view_model.dart';
import 'package:sizer/sizer.dart';

import 'widgets/horizontal_line.dart';
import 'widgets/spawn_point.dart';
import 'widgets/vertical_line.dart';

class GameScreenView extends GameScreenViewModel {
  @override
  Widget build(BuildContext context) {
    Size defaultButtonSize = Size(25.w, 25.w);
    return Scaffold(
      appBar: AppBar(
        title: null,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          GestureDetector(
              onTap: () {
                debugPrint('Pausando jogo');
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.pause),
              )),
        ],
      ),
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
              // for (var i = 17.5; i < 100; i += 17.5)
              //   HorizontalLine(
              //     topPosition: i.h,
              //   ),

              for (var i = 25; i < 100; i += 25)
                VerticalLine(leftPosition: i.w),
              ...horizontalLines,
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
                            bool activeDiscClicked = false;
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
                                activeDiscClicked = true;
                                break;
                              }
                            }
                            if (!activeDiscClicked) {
                              setState(() {
                                points = 0;
                              });
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
                            bool activeDiscClicked = false;
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
                                activeDiscClicked = true;
                                break;
                              }
                            }
                            if (!activeDiscClicked) {
                              setState(() {
                                points = 0;
                              });
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
                            bool activeDiscClicked = false;
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
                                activeDiscClicked = true;
                                break;
                              }
                            }
                            if (!activeDiscClicked) {
                              setState(() {
                                points = 0;
                              });
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
                            bool activeDiscClicked = false;
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
                                activeDiscClicked = true;
                                break;
                              }
                            }
                            if (!activeDiscClicked) {
                              setState(() {
                                points = 0;
                              });
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

              bunchOfDiscs,

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
              if (isGameLoading)
                Center(
                  child: Text('CARREGANDO...',
                      style: GoogleFonts.schoolbell(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.w,
                        color: Colors.white,
                      )),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
