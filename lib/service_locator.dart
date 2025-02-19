import 'package:get_it/get_it.dart';
import 'package:music/data/repository/auth/auth_repository_impl.dart';
import 'package:music/data/repository/auth/song/song_repository_impl.dart';
import 'package:music/data/sources/auth/auth_firebase_service.dart';
import 'package:music/data/sources/song/song_firebase_service.dart';
import 'package:music/domain/repository/auth/auth.dart';
import 'package:music/domain/repository/auth/song/song.dart';
import 'package:music/domain/usecases/auth/get_user.dart';
import 'package:music/domain/usecases/auth/signin.dart';
import 'package:music/domain/usecases/auth/signup.dart';
import 'package:music/domain/usecases/song/addOrRemoveFavoriteSong.dart';
import 'package:music/domain/usecases/song/get_favorite_songs.dart';
import 'package:music/domain/usecases/song/get_news_songs.dart';
import 'package:music/domain/usecases/song/get_playlist.dart';
import 'package:music/domain/usecases/song/is_favorite_song.dart';
import 'package:music/presentation/home/pages/bloc/news_songs_cubit.dart';
import 'package:music/presentation/home/pages/bloc/playlist_cubit.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {
 
 
 sl.registerSingleton<AuthFirebaseService>(
  AuthFirebaseServiceImpl()
 );


 sl.registerSingleton<SongFirebaseService>(
  SongFirebaseServiceImpl()
 );


 sl.registerSingleton<AuthRepository>(
  AuthRepositoryImpl()
 );


 sl.registerSingleton<SongsRepository>(
SongRepositoryImpl(sl<SongFirebaseService>())
 );


 sl.registerSingleton<SignupUseCase>(
  SignupUseCase()
 );


 sl.registerSingleton<SigninUseCase>(
  SigninUseCase()
 );

 sl.registerSingleton<GetNewsSongsUseCase>(
GetNewsSongsUseCase(sl<SongsRepository>())
 );

  sl.registerSingleton<GetPlaylistUseCase>(
GetPlaylistUseCase(sl<SongsRepository>())
 );

sl.registerFactory(() => PlaylistCubit(sl<GetPlaylistUseCase>()));



sl.registerFactory<NewsSongsCubit>(
  () => NewsSongsCubit(sl<GetNewsSongsUseCase>()),
);

  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
AddOrRemoveFavoriteSongUseCase());
 
  sl.registerSingleton<IsFavoriteSongUseCase>(
IsFavoriteSongUseCase());
 
  sl.registerSingleton<GetUserUseCase>(
GetUserUseCase());


  sl.registerSingleton<GetFavoriteSongsUseCase>(
GetFavoriteSongsUseCase());

}
