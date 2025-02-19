import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/domain/usecases/song/get_playlist.dart';
import 'package:music/presentation/home/pages/bloc/playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  final GetPlaylistUseCase getPlaylistUseCase; // Store use case instance

 PlaylistCubit(this.getPlaylistUseCase) : super(PlaylistInitial());

  Future<void> getPlaylist() async {
    try {
      emit(PlaylistLoading()); // Start loading
      final result = await getPlaylistUseCase.call();

      result.fold(
        (failure) {
          print(" Error: $failure"); // Debugging
          emit(PlaylistLoadFailure());
        },
        (songs) {
          print(" Songs Loaded: ${songs.length}"); // Debugging
          emit(PlaylistLoaded(songs: songs));
        },
      );
    } catch (e, stacktrace) {
      print(" Unexpected Error: $e");
      print(stacktrace);
      emit(PlaylistLoadFailure());
    }
  }
}
