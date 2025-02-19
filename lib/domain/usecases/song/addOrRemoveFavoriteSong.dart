import 'package:dartz/dartz.dart';
import 'package:music/core/usecase/usecase.dart';
import 'package:music/domain/repository/auth/song/song.dart';
import 'package:music/service_locator.dart';

class AddOrRemoveFavoriteSongUseCase implements Usecase<Either, String > {
  @override
  Future<Either> call({String? params}) async {
return await sl<SongsRepository>().addOrRemoveFavoriteSongs(params!);
  }

}

