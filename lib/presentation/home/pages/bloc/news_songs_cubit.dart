import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/domain/usecases/song/get_news_songs.dart';
import 'package:music/presentation/home/pages/bloc/news_songs_state.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  final GetNewsSongsUseCase getNewsSongsUseCase; // Store use case instance

  NewsSongsCubit(this.getNewsSongsUseCase) : super(NewsSongsInitial());

  Future<void> getNewsSongs() async {
    try {
      emit(NewsSongsLoading()); // Start loading
      final result = await getNewsSongsUseCase.call();

      result.fold(
        (failure) {
          print(" Error: $failure"); // Debugging
          emit(NewsSongsLoadFailure());
        },
        (songs) {
          print(" Songs Loaded: ${songs.length}"); // Debugging
          emit(NewsSongsLoaded(songs: songs));
        },
      );
    } catch (e, stacktrace) {
      print(" Unexpected Error: $e");
      print(stacktrace);
      emit(NewsSongsLoadFailure());
    }
  }
}
