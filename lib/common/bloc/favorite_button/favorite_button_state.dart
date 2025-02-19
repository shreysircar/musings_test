

abstract class FavoriteButtonState {}

class FavoriteButtonInitial extends FavoriteButtonState{}

class FavoriteButtonUpdated extends FavoriteButtonState{
  final bool IsFavorite;

  FavoriteButtonUpdated({required this.IsFavorite});

}