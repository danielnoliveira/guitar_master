import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guitar_hero_mobile/screens/developer_screen/developer_screen_view_model.dart';

class DeveloperScreen extends DeveloperScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créditos'),
      ),
    );
  }
}
