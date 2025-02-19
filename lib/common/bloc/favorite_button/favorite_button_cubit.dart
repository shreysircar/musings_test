import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:music/domain/usecases/song/addOrRemoveFavoriteSong.dart';
import 'package:music/service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState>{
  FavoriteButtonCubit():super(FavoriteButtonInitial());

void favoriteButtonUpdated(String songId) async {
var result = await sl<AddOrRemoveFavoriteSongUseCase>().call(
  params:songId
);
result.fold(
  
  (l){},
  (isFavorite){
    emit(
FavoriteButtonUpdated(
  IsFavorite: isFavorite
)
    );
    },
);
}




}