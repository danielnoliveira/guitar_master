import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class PersonalInfoButton extends StatelessWidget {
  final void Function(BuildContext) onPress;
  final IconData leftIcon;
  final String content;
  const PersonalInfoButton({
    Key? key,
    required this.onPress,
    required this.leftIcon,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress(context),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: Row(
        children: [
          Icon(
            leftIcon,
            color: Theme.of(context).primaryColor,
            size: 9.w,
          ),
          Spacer(),
          Text(
            content,
            textAlign: TextAlign.center,
            style: GoogleFonts.schoolbell(
              fontSize: 6.w,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
