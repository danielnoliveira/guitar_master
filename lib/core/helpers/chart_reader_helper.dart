import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:guitar_hero_mobile/core/enum/e_single_type.dart';
import 'package:guitar_hero_mobile/core/model/chart.dart';
import 'package:guitar_hero_mobile/core/model/events.dart';
import 'package:guitar_hero_mobile/core/model/single.dart';
import 'package:guitar_hero_mobile/core/model/song.dart';
import 'package:guitar_hero_mobile/core/model/sync_track.dart';

class ChartReaderHelper {
  static Future<List<Chart>> getListOfSongs() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final chartsPath = manifestMap.keys
        .where((String key) => key.contains('songs_notes_charts/'))
        .where((String key) => key.contains('.chart'))
        .toList();
    List<Chart> charts = [];
    for (var i = 0; i < chartsPath.length; i++) {
      List<String> lines =
          (await rootBundle.loadString(chartsPath[i])).split('\n');
      charts.add(convertFileToChart(lines));
    }

    return charts;
  }

  static Chart convertFileToChart(List<String> lines) {
    Song song = Song();
    SyncTrack syncTrack = SyncTrack();
    Events events = Events();
    List<Single> singles = [];
    bool isSong = false;
    bool isSyncTrack = false;
    bool isEvents = false;
    bool isSingle = false;
    RegExp singleTypeRegex = RegExp(r'\[(Expert|Medium|Hard|Easy)Single\]');

    for (String line in lines) {
      if (line.contains("[Song]")) {
        isSong = true;
        isSyncTrack = false;
        isEvents = false;
        isSingle = false;
      } else if (line.contains('[SyncTrack]')) {
        isSong = false;
        isSyncTrack = true;
        isEvents = false;
        isSingle = false;
      } else if (line.contains('[Events]')) {
        isSong = false;
        isSyncTrack = false;
        isEvents = true;
        isSingle = false;
      } else if (line.contains(singleTypeRegex)) {
        eSingleType singleType =
            eSingleType.values.firstWhere((e) => line.contains(e.toString()));
        singles.add(Single(singleType));

        isSong = false;
        isSyncTrack = false;
        isEvents = false;
        isSingle = true;
      } else if (line.startsWith('{') || line.startsWith('}') || line.isEmpty) {
        // ignore brackets
        // if (line.startsWith('}') && isSingle && single.toJson().isNotEmpty) {}
      } else {
        List<String> parts =
            line.split('=').map((part) => part.trim()).toList();
        String key = parts[0].replaceAll('"', '');
        String value = parts[1].replaceAll('"', '');

        if (isSong) {
          switch (key) {
            case 'Name':
              song.name = value;
              break;
            case 'Artist':
              song.artist = value;
              break;
            case 'Charter':
              song.charter = value;
              break;
            case 'Album':
              song.album = value;
              break;
            case 'Year':
              song.year = value;
              break;
            case 'Offset':
              song.offset = int.parse(value);
              break;
            case 'Resolution':
              song.resolution = int.parse(value);
              break;
            case 'Player2':
              song.player2 = value;
              break;
            case 'Difficulty':
              song.difficulty = int.parse(value);
              break;
            case 'PreviewStart':
              song.previewStart = int.parse(value);
              break;
            case 'PreviewEnd':
              song.previewEnd = int.parse(value);
              break;
            case 'Genre':
              song.genre = value;
              break;
            case 'MediaType':
              song.mediaType = value;
              break;
            case 'MusicStream':
              song.musicStream = value;
              break;
          }
        } else if (isSyncTrack) {
          syncTrack.addSyncPoint(int.parse(key), value.replaceAll('"', ''));
        } else if (isEvents) {
          events.addEvent(int.parse(key), value.replaceAll('"', ''));
        } else if (isSingle) {
          singles.last.addNote(int.parse(key), value.replaceAll('"', ''));
        }
      }
    }
    return Chart(song, events, syncTrack, singles);
  }
}
