class SyncTrack {
  Map<int, String> syncPoints = {};
  SyncTrack();

  void addSyncPoint(int key, String value) {
    syncPoints[key] = value;
  }

  SyncTrack.fromJson(Map<String, dynamic> json) {
    final data = json['syncPoints'] as Map<String, dynamic>;
    for (final key in data.keys) {
      syncPoints[int.parse(key)] = data[key];
    }
  }

  Map<String, dynamic> toJson() => {
        'syncPoints': Map.fromEntries(
          syncPoints.entries.map((e) => MapEntry(e.key.toString(), e.value)),
        ),
      };
}
