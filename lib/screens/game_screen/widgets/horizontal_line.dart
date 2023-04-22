import 'package:flutter/material.dart';
import 'package:guitar_hero_mobile/core/consts/conts.dart';
import 'package:sizer/sizer.dart';

class HorizontalLine extends StatefulWidget {
  const HorizontalLine({
    Key? key,
  }) : super(key: key);

  @override
  State<HorizontalLine> createState() => _HorizontalLineState();
}

class _HorizontalLineState extends State<HorizontalLine> {
  late double topPosition;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topPosition = -(11.w + 2);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        topPosition = 100.h;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: Constants.horizontalLineSpeed),
      top: topPosition,
      child: Container(
        width: 100.w,
        height: 4,
        color: Colors.grey,
      ),
    );
  }
}
