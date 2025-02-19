/*import 'package:dartz/dartz.dart';
import 'package:music/core/usecase/usecase.dart';
import 'package:music/domain/repository/auth/song/song.dart';
import 'package:music/service_locator.dart';

class IsFavoriteSongUseCase implements Usecase<bool, String > {
  @override
  Future<Either> call({String? params}) async {
return await sl<SongsRepository>().isFavoriteSong(params!);
  }

}*/

import 'package:music/core/usecase/usecase.dart';
import 'package:music/domain/repository/auth/song/song.dart';
import 'package:music/service_locator.dart';

class IsFavoriteSongUseCase implements Usecase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    final result = await sl<SongsRepository>().isFavoriteSong(params!);

    return result.fold(
      (failure) => false, // If Left, return false
      (isFavorite) => isFavorite, // If Right, return the bool value
    );
  }
}
