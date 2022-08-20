import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class Guitars extends StatelessWidget {
  const Guitars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Transform.rotate(
              angle: pi / 4,
              child: SvgPicture.asset(
                'assets/svgs/guitar.svg',
                width: 20.w,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Transform.scale(
              scaleX: -1,
              child: Transform.rotate(
                angle: pi / 4,
                child: SvgPicture.asset(
                  'assets/svgs/guitar.svg',
                  width: 20.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
