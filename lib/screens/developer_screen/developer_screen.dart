import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guitar_hero_mobile/core/consts/conts.dart';
import 'package:guitar_hero_mobile/screens/developer_screen/developer_screen_view_model.dart';
import 'package:guitar_hero_mobile/screens/developer_screen/widgets/label.dart';
import 'package:guitar_hero_mobile/screens/developer_screen/widgets/personal_info_button.dart';
import 'package:guitar_hero_mobile/screens/developer_screen/widgets/value.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperScreen extends DeveloperScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Créditos',
          style: GoogleFonts.schoolbell(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: 100.w,
            height: 100.h - kToolbarHeight,
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(text: 'Desenvolvedor principal:'),
                Value(text: 'Daniel Nogueira de Oliveira'),
                SizedBox(
                  height: 15,
                ),
                Label(text: 'Contatos:'),
                PersonalInfoButton(
                  onPress: emailAction,
                  leftIcon: Icons.email,
                  content: 'daniel.n.oliveira@outlook.com',
                ),
                SizedBox(
                  height: 20,
                ),
                Label(
                  text: 'Portifólio:',
                ),
                PersonalInfoButton(
                    onPress: githubAction,
                    leftIcon: MdiIcons.github,
                    content: 'danielnoliveira'),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Gostou do meu trabalho? Se sim, você pode apoiar meus futuros projetos com uma doação de qualquer valor.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.schoolbell(
                    fontSize: 6.w,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                PersonalInfoButton(
                  onPress: pixAction,
                  leftIcon: Icons.pix,
                  content: 'apoie-me com um pix\n(Chave aleatória)',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
