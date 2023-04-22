import 'dart:convert';

import 'events.dart';
import 'single.dart';
import 'song.dart';
import 'sync_track.dart';

class Chart {
  final Song song;
  final Events events;
  final SyncTrack syncTrack;
  final List<Single> singles;

  Chart(this.song, this.events, this.syncTrack, this.singles);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'song': song.toMap()});
    result.addAll({'events': events.toJson()});
    result.addAll({'syncTrack': syncTrack.toJson()});
    result.addAll({'singles': singles.map((x) => x.toJson()).toList()});

    return result;
  }

  factory Chart.fromMap(Map<String, dynamic> map) {
    return Chart(
      Song.fromMap(map['song']),
      Events.fromJson(map['events']),
      SyncTrack.fromJson(map['syncTrack']),
      List<Single>.from(map['singles']?.map((x) => Single.fromJson(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Chart.fromJson(String source) => Chart.fromMap(json.decode(source));
}
