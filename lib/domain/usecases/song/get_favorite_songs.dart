import 'package:dartz/dartz.dart';
import 'package:music/core/usecase/usecase.dart';
import 'package:music/domain/repository/auth/song/song.dart';
import 'package:music/service_locator.dart';

class GetFavoriteSongsUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
return await sl<SongsRepository>().getUserFavoriteSongs();
  }

}

