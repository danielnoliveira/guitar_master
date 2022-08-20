import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:guitar_hero_mobile/core/consts/conts.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class DeveloperScreenViewModel extends StatelessWidget {
  const DeveloperScreenViewModel({Key? key}) : super(key: key);

  Future<void> githubAction(BuildContext context) async {
    if (await canLaunchUrl(Uri.parse(Constants.githubUrl))) {
      launchUrl(Uri.parse(Constants.githubUrl),
          mode: LaunchMode.externalApplication);
    } else {
      Clipboard.setData(
        ClipboardData(
          text: Constants.githubUrl,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Falha ao abrir link para o portifólio.\nLink copiado para a área de transferência.'),
        ),
      );
    }
  }

  Future<void> emailAction(BuildContext context) async {
    String emailUrl = 'mailto:${Constants.email}?subject=GuitarMaster&body=';
    if (await canLaunchUrl(Uri.parse(emailUrl))) {
      launchUrl(Uri.parse(emailUrl), mode: LaunchMode.externalApplication);
    } else {
      Clipboard.setData(
        ClipboardData(
          text: emailUrl,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Falha ao abrir app de e-mail.\nE-mail copiado para a área de transferência.'),
        ),
      );
    }
  }

  Future<void> pixAction(BuildContext context) async {
    Clipboard.setData(
      ClipboardData(
        text: '53af5956-0bb0-465f-a893-7d903075bad2',
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pix copiado com sucesso.'),
      ),
    );
  }
}
