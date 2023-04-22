import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
