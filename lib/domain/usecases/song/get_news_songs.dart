import 'package:dartz/dartz.dart';

import 'package:music/core/usecase/usecase.dart';

import 'package:music/domain/repository/auth/song/song.dart';


/*
class GetNewsSongsUseCase implements Usecase<Either, dynamic> {
  final SongsRepository songsRepository;

  GetNewsSongsUseCase(this.songsRepository);

  @override
  Future<Either> call({params}) async {
    return await songsRepository.getNewsSongs();  // ✅ Uses the interface
  }
}*/
class GetNewsSongsUseCase implements Usecase<Either, dynamic> {
  final SongsRepository songsRepository;

  GetNewsSongsUseCase(this.songsRepository);

  @override
  Future<Either> call({params}) async {
    final result = await songsRepository.getNewsSongs();

    result.fold(
      (failure) => print("❌ Error: ${failure.runtimeType} - ${failure.toString()}"),
      (songs) => print("✅ Fetched ${songs.length} songs"),
    );

    return result;
  }
}

