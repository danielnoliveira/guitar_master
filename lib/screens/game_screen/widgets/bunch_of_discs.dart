import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guitar_hero_mobile/screens/game_screen/widgets/disc.dart';

class BunchOfDiscs extends StatefulWidget {
  late _BunchOfDiscsState bunchOfDiscsState;
  BunchOfDiscs({Key? key}) : super(key: key);

  @override
  State<BunchOfDiscs> createState() {
    bunchOfDiscsState = _BunchOfDiscsState();
    return bunchOfDiscsState;
  }
}

class _BunchOfDiscsState extends State<BunchOfDiscs> {
  List<Disc> discs = [];

  void updateDiscs(Disc newDisc) {
    setState(() {
      discs.add(newDisc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: discs,
    );
  }
}
