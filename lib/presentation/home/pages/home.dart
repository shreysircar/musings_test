import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music/common/helpers/is_dark_mode.dart';
import 'package:music/common/widgets/button/appbar/app_bar.dart';
import 'package:music/core/configs/assets/app_images.dart';
import 'package:music/core/configs/assets/app_vectors.dart';
import 'package:music/core/configs/theme/app_colors.dart';
import 'package:music/presentation/home/widgets/news_songs.dart';
import 'package:music/presentation/home/widgets/playlist.dart';
import 'package:music/presentation/profile/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        action:IconButton(
          onPressed: () { 
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context)=>const ProfilePage()
                ));
           },
           icon: const Icon(
            Icons.person
           )
           ),
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 70,
          width: 70,
        ),
      ),
      body: Column(
        children: [
          _homeTopCard(),
          _tabs(),
          SizedBox(
            height:260,
            child: TabBarView(
              controller: _tabController,
              children: [
                
                const NewsSongs(),
                Container(),
                Container(),
                Container()
              ],),
          ),

const Playlist()


        ],
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 130,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                AppVectors.homeTopCard,
                height: 110,
              ),
            ),
            Positioned(
              bottom: 18, // Aligns Billie with homeTopCard
              left: 230, // Moves Billie slightly right to overlap
              child: Transform.scale(
                scale: 1.3, // Increases Billie’s size relative to homeTopCard
                child: Image.asset(
                  AppImages.billie,
                  height: 120,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Align(
        alignment: Alignment.center,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: context.isDarkMode ? Colors.white : Colors.black,
          indicatorColor: AppColors.primary,
          tabs: [
            _tabItem('News'),
            _tabItem('Videos'),
            _tabItem('Artists'),
            _tabItem('Podcasts'),
          ],
        ),
      ),
    );
  }

  Widget _tabItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
