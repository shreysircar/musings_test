import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:music/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:music/core/configs/theme/app_colors.dart';
import 'package:music/domain/entities/song/song.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;
  final Function? function;
  const FavoriteButton({
    this.function,
    required this.songEntity,
    super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
create:(context)=>FavoriteButtonCubit(),
child:BlocBuilder <FavoriteButtonCubit,FavoriteButtonState>(
  builder:(context,state){
if(state is FavoriteButtonInitial){
  return  IconButton(
                    onPressed: () async {

                    context.read<FavoriteButtonCubit>().favoriteButtonUpdated(
                       songEntity.songId
                       
                        );
                        if(function!=null){
                          function!();
                        }
                    },
                    icon: Icon(
                    songEntity.isFavorite?Icons.favorite:  Icons.favorite_outline_outlined,
                      size:25,
                      color: AppColors.primary,
                    ),
                  );
}

if(state is FavoriteButtonUpdated){
  return  IconButton(
                    onPressed: () {

                                            context.read<FavoriteButtonCubit>().favoriteButtonUpdated(
                       songEntity.songId
                       
                        );
                    },
                    icon: Icon(
                    state.IsFavorite ? Icons.favorite:  Icons.favorite_outline_outlined,
                      size:25,
                      color: AppColors.primary,
                    ),
                  );
}
return Container();
  },
),
    );
  }
}