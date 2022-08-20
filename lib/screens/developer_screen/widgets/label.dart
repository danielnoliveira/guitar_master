import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Label extends StatelessWidget {
  final String text;
  const Label({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.schoolbell(
        fontSize: 7.w,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
