import 'dart:convert';

class Song {
  String? name;
  String? artist;
  String? charter;
  String? album;
  String? year;
  int? offset;
  int? resolution;
  String? player2;
  int? difficulty;
  int? previewStart;
  int? previewEnd;
  String? genre;
  String? mediaType;
  String? musicStream;

  Song({
    this.name,
    this.artist,
    this.charter,
    this.album,
    this.year,
    this.offset,
    this.resolution,
    this.player2,
    this.difficulty,
    this.previewStart,
    this.previewEnd,
    this.genre,
    this.mediaType,
    this.musicStream,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'artist': artist});
    result.addAll({'charter': charter});
    result.addAll({'album': album});
    result.addAll({'year': year});
    result.addAll({'offset': offset});
    result.addAll({'resolution': resolution});
    result.addAll({'player2': player2});
    result.addAll({'difficulty': difficulty});
    result.addAll({'previewStart': previewStart});
    result.addAll({'previewEnd': previewEnd});
    result.addAll({'genre': genre});
    result.addAll({'mediaType': mediaType});
    result.addAll({'musicStream': musicStream});

    return result;
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      name: map['name'] ?? '',
      artist: map['artist'] ?? '',
      charter: map['charter'] ?? '',
      album: map['album'] ?? '',
      year: map['year'] ?? '',
      offset: map['offset']?.toInt() ?? 0,
      resolution: map['resolution']?.toInt() ?? 0,
      player2: map['player2'] ?? '',
      difficulty: map['difficulty']?.toInt() ?? 0,
      previewStart: map['previewStart']?.toInt() ?? 0,
      previewEnd: map['previewEnd']?.toInt() ?? 0,
      genre: map['genre'] ?? '',
      mediaType: map['mediaType'] ?? '',
      musicStream: map['musicStream'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Song.fromJson(String source) => Song.fromMap(json.decode(source));
}
