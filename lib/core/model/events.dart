class Events {
  Map<int, String> map = {};

  Events();

  void addEvent(int key, String value) {
    map[key] = value;
  }

  Events.fromJson(Map<String, dynamic> json) {
    final data = json['Events'] as Map<String, dynamic>;
    for (final key in data.keys) {
      map[int.parse(key)] = data[key];
    }
  }

  Map<String, dynamic> toJson() => {
        'Events': Map.fromEntries(
          map.entries.map((e) => MapEntry(e.key.toString(), e.value)),
        ),
      };

  Map<int, String> get events => map;
}
