import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Value extends StatelessWidget {
  final String text;
  const Value({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.schoolbell(
        fontSize: 6.w,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
