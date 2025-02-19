import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/common/widgets/button/appbar/app_bar.dart';
import 'package:music/common/widgets/button/favorite_button/favorite_button.dart';
import 'package:music/core/configs/constants/app_urls.dart';
import 'package:music/core/configs/theme/app_colors.dart';
import 'package:music/domain/entities/song/song.dart';
import 'package:music/presentation/home/pages/bloc/song_player_cubit.dart';
import 'package:music/presentation/home/pages/bloc/song_player_state.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayerPage({
    required this.songEntity,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: BasicAppBar(
  title:const Text(
     'Now Playing',
     style: TextStyle(
      fontSize:18
     ),
     ),
     action: IconButton(
      onPressed:(){},
      
      icon:Icon(
        Icons.more_vert_rounded
      )),
),
body:BlocProvider(
  create:(_)=>SongPlayerCubit()..loadSong(
    '${AppURLs.songFirestorage}${songEntity.title}.mp3?${AppURLs.mediaAlt}'

  ),
  child: SingleChildScrollView(
    padding:EdgeInsets.symmetric(
    vertical:20,
    horizontal:20,),
    child: Column(
      children: [
        _songCover(context),
        const SizedBox(height:20,),
        _songDetail(),
const SizedBox(height:30,),
_songPlayer(context)

      ],
    )
  ),
)
    );
  }
  Widget _songCover(BuildContext context){
    return Container(
      height:MediaQuery.of(context).size.height / 2,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(30),
 image: DecorationImage(
    fit:BoxFit.cover,
  image: NetworkImage(
'${AppURLs.coverFirestorage}${songEntity.title}.jpg?${AppURLs.mediaAlt}'

  )
  
  ) ),

);
  }
  Widget _songDetail(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songEntity.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 25),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        songEntity.artist,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400, 
                          fontSize: 16),
                      ),
                    ],
                  ),
FavoriteButton(
  songEntity: songEntity,)
      ],
      );
  }
  
Widget _songPlayer(BuildContext context){
return BlocBuilder<SongPlayerCubit,SongPlayerState>(
  builder:(context,state) {
if (state is SongPlayerLoading){
  return const CircularProgressIndicator();
}
if(state is SongPlayerLoaded){
  return Column(
    children: [
      Slider(
        value: context.read<SongPlayerCubit>().songPosition.inSeconds.toDouble(),
         min: 0.0,
         max: context.read<SongPlayerCubit>().songDuration.inSeconds.toDouble(),
         onChanged: (value){}
         ),
const SizedBox(height:5,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, // ✅ Fixes the issue
  children: [
    Text(
      formatDuration(
        context.read<SongPlayerCubit>().songPosition
      ),
    ),
    Text(
      formatDuration(
        context.read<SongPlayerCubit>().songDuration
      ),
    ),
  ],
),

  const SizedBox(height:1,),
GestureDetector(
  onTap:(){
     context.read<SongPlayerCubit>().playOrPauseSong();
  },
  child: Container( 
    height:60,
    width:60,
    decoration: BoxDecoration(
      shape:BoxShape.circle,
      color:AppColors.primary
    ),
    child:Icon(
      context.read<SongPlayerCubit>().audioPlayer.playing ? Icons.pause : Icons.play_arrow_rounded
    ),),
)
    ],
  );
}
return Container();

  },
  );
}


String formatDuration(Duration duration){
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);
  return '${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}';
}
  }
