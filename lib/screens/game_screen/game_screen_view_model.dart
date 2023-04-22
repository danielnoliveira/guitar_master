import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guitar_hero_mobile/core/enum/e_disc_type.dart';
import 'package:guitar_hero_mobile/screens/game_screen/widgets/bunch_of_discs.dart';
import 'package:guitar_hero_mobile/screens/game_screen/widgets/horizontal_line.dart';
import 'package:guitar_hero_mobile/screens/game_screen/widgets/disc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sizer/sizer.dart';

import 'game_screen.dart';

abstract class GameScreenViewModel extends State<GameScreen> {
  List<Disc> allDiscs = [];
  List<HorizontalLine> horizontalLines = [];
  List<Disc> activeDiscs = [];
  BunchOfDiscs bunchOfDiscs = BunchOfDiscs();
  late Timer t;
  AudioPlayer _myPlayer = AudioPlayer();
  bool isGameLoading = true;

  int points = 0;
  int noteIndex = 0;
  late int maxNote;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // maxNote = widget.song.chart!.length;
    initSound();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _myPlayer.pause();
    t.cancel();
    super.dispose();
  }

  Future initSound() async {
    // await _myPlayer.setUrl(widget.song.url!);
    setState(() {
      isGameLoading = false;
    });
    startNotes();
    await Future.delayed(Duration(milliseconds: 8250));
    _myPlayer.play();
  }

  Future<void> startNotes() async {
    t = Timer.periodic(Duration(milliseconds: 363), (Timer t) {
      if (noteIndex == maxNote) {
        t.cancel();
        return;
      }
      setState(() {
        horizontalLines.add(
          HorizontalLine(),
        );
        // if (!widget.song.chart![noteIndex].isEmpty()) {
        //   Offset? offset;

        //   switch (widget.song.chart![noteIndex].getDiscType()) {
        //     case eDiscType.green:
        //       offset = getGlobalPaintBounds(greenSpawn);
        //       break;

        //     case eDiscType.red:
        //       offset = getGlobalPaintBounds(redSpawn);
        //       break;
        //     case eDiscType.yellow:
        //       offset = getGlobalPaintBounds(yellowSpawn);
        //       break;
        //     case eDiscType.blue:
        //       offset = getGlobalPaintBounds(blueSpawn);
        //       break;
        //   }
        //   if (offset != null) {
        //     bunchOfDiscs.bunchOfDiscsState.updateDiscs(Disc(
        //       myKey: GlobalKey(),
        //       discType: widget.song.chart![noteIndex].getDiscType(),
        //       leftPosition: offset.dx - 8.5.w,
        //       disableDisc: removeDiscOutOfBorder,
        //       enableDisc: addActiveDisc,
        //     ));
        //   }
        // }
      });
      noteIndex++;
    });
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
}
