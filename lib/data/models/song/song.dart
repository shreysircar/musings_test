import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;
  bool? isFavorite;
  String? songId;

  // Constructor
  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.isFavorite,
    required this.songId,
  });

  // From JSON constructor
  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
    isFavorite = data['isFavorite'] ?? false; // Default to false if isFavorite is null
    songId = data['songId']; // Assuming songId is in the Firestore document
  }
}

extension SongModelX on SongModel {
  // Convert SongModel to SongEntity (used in domain layer)
  SongEntity toEntity() {
    return SongEntity(
      title: title!,         // Positional arguments without named keys
      artist: artist!,
      duration:duration!,
      releaseDate:releaseDate!,
      isFavorite:isFavorite!,
      songId:songId!,        // Added songId as a positional parameter
    );
  }
}
