import 'package:guitar_hero_mobile/core/enum/e_disc_type.dart';

class SongChartRow {
  final bool green;
  final bool red;
  final bool yellow;
  final bool blue;

  SongChartRow(
      {required this.green,
      required this.red,
      required this.yellow,
      required this.blue});

  factory SongChartRow.empty() {
    return SongChartRow(green: false, red: false, yellow: false, blue: false);
  }
  factory SongChartRow.green() {
    return SongChartRow(green: true, red: false, yellow: false, blue: false);
  }
  factory SongChartRow.red() {
    return SongChartRow(green: false, red: true, yellow: false, blue: false);
  }
  factory SongChartRow.yellow() {
    return SongChartRow(green: false, red: false, yellow: true, blue: false);
  }
  factory SongChartRow.blue() {
    return SongChartRow(green: false, red: false, yellow: false, blue: true);
  }
  factory SongChartRow.all() {
    return SongChartRow(green: true, red: true, yellow: true, blue: true);
  }

  bool isEmpty() {
    return !green && !red && !blue && !yellow;
  }

  eDiscType getDiscType() {
    if (green) {
      return eDiscType.green;
    }
    if (blue) {
      return eDiscType.blue;
    }
    if (red) {
      return eDiscType.red;
    }
    return eDiscType.yellow;
  }
}
