import 'package:flutter/material.dart';

class SpawnPoint extends StatelessWidget {
  final Color spawnColor;
  final GlobalKey spawnKey;
  const SpawnPoint({
    Key? key,
    required this.spawnKey,
    required this.spawnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: spawnKey,
      width: 20,
      height: 20,
      color: spawnColor,
    );
  }
}
