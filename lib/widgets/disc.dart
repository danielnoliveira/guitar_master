import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guitar_hero_mobile/core/enum/e_disc_type.dart';
import 'package:sizer/sizer.dart';

class Disc extends StatefulWidget {
  final GlobalKey myKey;
  final eDiscType discType;
  late double leftPosition;
  final void Function(Disc) disableDisc;
  final void Function(Disc) enableDisc;

  late _DiscState discState;
  Disc({
    Key? key,
    required this.myKey,
    required this.discType,
    required this.leftPosition,
    required this.disableDisc,
    required this.enableDisc,
  }) : super(key: key);

  @override
  State<Disc> createState() {
    discState = _DiscState();
    return discState;
  }
}

class _DiscState extends State<Disc> {
  bool isTimeToMove = false;
  bool wasIhit = false;
  late Color mainColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.enableDisc(widget);
    switch (widget.discType) {
      case eDiscType.blue:
        mainColor = Colors.blue;
        break;
      case eDiscType.green:
        mainColor = Colors.green;
        break;
      case eDiscType.red:
        mainColor = Colors.red;
        break;
      case eDiscType.yellow:
        mainColor = Colors.yellow;
        break;
    }
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isTimeToMove = true;
      });
    });
  }

  void updateWasIhitted(bool newValue) {
    setState(() {
      wasIhit = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      key: widget.myKey,
      onEnd: () => widget.disableDisc(widget),
      left: widget.leftPosition,
      duration: Duration(seconds: 5),
      top: isTimeToMove ? 100.h : -22.w,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: wasIhit ? 0.0 : 1.0,
        child: IgnorePointer(
          ignoring: true,
          child: Container(
            decoration: BoxDecoration(
              color: mainColor,
              border: Border.all(width: 2, color: Colors.white),
              shape: BoxShape.circle,
            ),
            width: 22.w,
            height: 22.w,
            alignment: Alignment.center,
            child: Container(
              width: 10.w,
              height: 10.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
