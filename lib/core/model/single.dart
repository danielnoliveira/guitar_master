import 'package:guitar_hero_mobile/core/enum/e_single_type.dart';

class Single {
  late eSingleType singleType;
  Map<int, List<String>> map = {};
  Single(
    this.singleType,
  );

  void addNote(int key, String value) {
    if (map.containsKey(key)) {
      map[key]!.add(value);
    } else {
      map[key] = [value];
    }
  }

  Single.fromJson(Map<String, dynamic> json) {
    final data = json['Single'] as Map<String, dynamic>;
    for (final key in data.keys) {
      map[int.parse(key)] = data[key];
    }
  }

  Map<String, dynamic> toJson() => {
        'Single': Map.fromEntries(
          map.entries.map((e) => MapEntry(e.key.toString(), e.value)),
        ),
      };
}
