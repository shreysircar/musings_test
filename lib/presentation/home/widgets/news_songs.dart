import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/common/helpers/is_dark_mode.dart';
import 'package:music/core/configs/constants/app_urls.dart';
import 'package:music/core/configs/theme/app_colors.dart';
import 'package:music/domain/entities/song/song.dart';
import 'package:music/presentation/home/pages/bloc/news_songs_cubit.dart';
import 'package:music/presentation/home/pages/bloc/news_songs_state.dart';
import 'package:music/presentation/song_player/pages/song_player.dart';
import 'package:music/service_locator.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (_) {
    final cubit = sl<NewsSongsCubit>();
    cubit.getNewsSongs(); // Ensure it's called after cubit is fully initialized
    return cubit;},
      child: SizedBox(
        height:100,
        child:BlocBuilder<NewsSongsCubit,NewsSongsState>(
          builder:(context,state) {
if(state is NewsSongsLoading){
  return Container(
    alignment: Alignment.center,
    child: const CircularProgressIndicator());
}
if(state is NewsSongsLoaded){
  return _songs(
    state.songs
  );
}
return Container();
          },)

      ),
    );
  }

  Widget _songs(List<SongEntity>songs){
    return ListView.separated(
      scrollDirection:Axis.horizontal ,
          itemBuilder:(context,index){
                  String imageUrl = '${AppURLs.coverFirestorage}${songs[index].title}.jpg?${AppURLs.mediaAlt}';
      print("DEBUG: Image URL -> $imageUrl"); // Print the URL for debugging
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                 MaterialPageRoute(
                  builder: (BuildContext context)
                  => SongPlayerPage(
                    songEntity: songs[index],
                  ))
                );
              },
              child: SizedBox(
                width:200,
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
                children: [
              
              
              
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        '${AppURLs.coverFirestorage}${songs[index].title}.jpg?${AppURLs.mediaAlt}',
                      ),
                      onError: (exception, stackTrace) {
                        print('❌ Error loading image: $exception');
                      },
                    ),
                  ),
              
                  child:Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      width:40,
                      transform: Matrix4.translationValues(10, 10, 0),
                      decoration :BoxDecoration(
                        shape: BoxShape.circle,
                        
                        color:context.isDarkMode? AppColors.darkGrey: const Color.fromARGB(238, 225, 223, 223)
                      ),
                      child:Icon(
              Icons.play_arrow_rounded,
              color:context.isDarkMode? const Color.fromARGB(255, 192, 198, 198) :const Color(0xff555555)
                      )
                    )
                  )
                ),
              ),
              SizedBox(height:10),
              Text(
                songs[index].title,
                style:TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ), 
              ),
              
              SizedBox(height:10),
              Text(
                songs[index].artist,
                style:TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                )
              )
              
              ],),
              ),
            );
          } ,
           separatorBuilder:(context,index)=>SizedBox(
            
            width:14,
           ),
           itemCount: songs.length,
          );
  }
}