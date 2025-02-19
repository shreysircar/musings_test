import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/common/helpers/is_dark_mode.dart';
import 'package:music/common/widgets/button/favorite_button/favorite_button.dart';
import 'package:music/core/configs/theme/app_colors.dart';
import 'package:music/domain/entities/song/song.dart';
import 'package:music/presentation/home/pages/bloc/playlist_cubit.dart';
import 'package:music/presentation/home/pages/bloc/playlist_state.dart';
import 'package:music/presentation/song_player/pages/song_player.dart';
import 'package:music/service_locator.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = sl<PlaylistCubit>();
        Future.delayed(Duration.zero, cubit.getPlaylist);
        return cubit;
      },
      child: SizedBox(
        height: 250, // ✅ Adjusted height to fit content properly
        child: BlocBuilder<PlaylistCubit, PlaylistState>(
          builder: (context, state) {
            if (state is PlaylistLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PlaylistLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Playlist',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const Text(
                          'See More',
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded( // ✅ Prevents list from getting cut
                      child: _songs(state.songs),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox(); // Default empty state
          },
        ),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(), // ✅ Smooth scrolling
      itemBuilder: (context, index) {
        return  GestureDetector(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.isDarkMode ? AppColors.darkGrey : const Color(0xffE6E6E6),
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: context.isDarkMode ? const Color(0xff959595) : const Color(0xff555555),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songs[index].title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        songs[index].artist,
                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(songs[index].duration.toString().replaceAll('.', ':')),
                  const SizedBox(width: 20),
FavoriteButton(
  songEntity: songs[index],)
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: songs.length,
    );
  }
}
