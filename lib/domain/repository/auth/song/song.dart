

import 'package:dartz/dartz.dart';
import 'package:music/core/errors/failure.dart';
import 'package:music/domain/entities/song/song.dart'; // Import Failure class

abstract class SongsRepository {
  Future<Either<Failure, List<SongEntity>>> getNewsSongs();
  Future<Either<Failure, List<SongEntity>>> getPlaylist();
  Future<Either<Failure, bool>> addOrRemoveFavoriteSongs(String songId);
  Future<Either<Failure, bool>> isFavoriteSong(String songId);  // Corrected return type
 Future<Either<Failure, List<SongEntity>>> getUserFavoriteSongs();

}
