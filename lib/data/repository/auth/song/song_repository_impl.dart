import 'package:dartz/dartz.dart';
import 'package:music/core/errors/failure.dart'; // Import Failure class
import 'package:music/data/sources/song/song_firebase_service.dart';
import 'package:music/domain/entities/song/song.dart';
import 'package:music/domain/repository/auth/song/song.dart';
import 'package:music/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  final SongFirebaseService songFirebaseService;

  SongRepositoryImpl(this.songFirebaseService);

  @override
  Future<Either<Failure, List<SongEntity>>> getNewsSongs() async {
    return await songFirebaseService.getNewsSongs();
  }

  @override
  Future<Either<Failure, List<SongEntity>>> getPlaylist() async {
    return await songFirebaseService.getPlaylist();
  }

  @override
  Future<Either<Failure, bool>> addOrRemoveFavoriteSongs(String songId) async {
    return await songFirebaseService.addOrRemoveFavoriteSongs(songId);
  }

  @override
  Future<Either<Failure, bool>> isFavoriteSong(String songId) async {
    try {
      final result = await songFirebaseService.isFavoriteSong(songId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<SongEntity>>> getUserFavoriteSongs() async {
return await sl<SongFirebaseService>().getUserFavoriteSongs();
  }
}


