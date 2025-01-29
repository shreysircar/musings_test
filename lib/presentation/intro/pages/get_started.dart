import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music/common/widgets/button/basic_app_button.dart';
import 'package:music/core/configs/assets/app_images.dart';
import 'package:music/core/configs/assets/app_vectors.dart';
import 'package:music/core/configs/theme/app_colors.dart';
import 'package:music/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical:40,
              horizontal:40,
            ),
            decoration:BoxDecoration(
              image: DecorationImage(
                fit:BoxFit.fill,
                image:AssetImage(AppImages.introBG,
                ))
            ) ,
          ), 
          Container(
            color: Colors.black.withValues(alpha:0.15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
              horizontal:40,
              vertical:40, ),
              child: Column(children: [
                Align(
                  alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  AppVectors.logo,
                  height:100,
                  width:100,
                )
                ),
                Spacer(),
                Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                   fontWeight:FontWeight.w900,
                   color:AppColors.lightBackground,
                   fontSize: 18 ),
                ),
              SizedBox(height: 10,),
                Text(
                  'Discover, stream, and create playlists of your favorite songs—all in one place. Dive into a world of endless melodies and let the rhythm guide you.',
                  style: TextStyle(
                   fontWeight:FontWeight.w500,
                   color:AppColors.lightBackground,
                   fontSize: 13 ),
                  textAlign:TextAlign.center,
                ),
                SizedBox(height:20,),
                BasicAppButton(
                  onPressed: (){ 
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context)=>const ChooseMode()
                      ));
                },
                  title: 'Get Started',
                  height: 20,
                )
              ],),
            )
        ],
          ),

        
      );
  }
}