/*import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music/common/widgets/button/basic_app_button.dart';
import 'package:music/core/configs/assets/app_images.dart';
import 'package:music/core/configs/assets/app_vectors.dart';
import 'package:music/core/configs/theme/app_colors.dart';
import 'package:music/presentation/choose_mode/pages/bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.chooseModeBG),
              ),
            ),
          ),
          Container(
            color: Colors.black.withAlpha(15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 40,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    AppVectors.logo,
                    height: 100,
                    width: 100,
                  ),
                ),
                Spacer(),
                Text(
                  'Choose Mode',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: AppColors.lightBackground,
                      fontSize: 18),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Dark Mode Widget
                    Column(
                      children: [
                        GestureDetector(
                          onTap:(){
                        context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color:
                                      Color(0xff3D3D3D).withAlpha(153), // 60% opacity
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  AppVectors.moon,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Dark Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: AppColors.grey),
                        ),
                      ],
                    ),
                    SizedBox(width: 40),
                    // Light Mode Widget
                    Column(
                      children: [
                                              GestureDetector(
                          onTap:(){
                        context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color:
                                      Color(0xff3D3D3D).withAlpha(153), // 60% opacity
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  AppVectors.sun,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Light Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: AppColors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ChooseMode()),
                    );
                  },
                  title: 'Continue',
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

*/
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music/common/widgets/button/basic_app_button.dart';
import 'package:music/core/configs/assets/app_images.dart';
import 'package:music/core/configs/assets/app_vectors.dart';
import 'package:music/core/configs/theme/app_colors.dart';
import 'package:music/presentation/auth/pages/signup.dart';
import 'package:music/presentation/choose_mode/pages/bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.chooseModeBG),
              ),
            ),
          ),
          Container(
            color: Colors.black.withAlpha(15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 40,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    AppVectors.logo,
                    height: 100,
                    width: 100,
                  ),
                ),
                Spacer(),
                Text(
                  'Choose Mode',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: AppColors.lightBackground,
                      fontSize: 18),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Dark Mode Widget
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.dark);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xff3D3D3D).withAlpha(153),
                                  shape: BoxShape.circle,
                                  border: context.watch<ThemeCubit>().state ==
                                          ThemeMode.dark
                                      ? Border.all(
                                          color: AppColors.primary,
                                          width: 3) // Highlight dark mode
                                      : null,
                                ),
                                child: SvgPicture.asset(
                                  AppVectors.moon,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Dark Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: AppColors.grey),
                        ),
                      ],
                    ),
                    SizedBox(width: 40),
                    // Light Mode Widget
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.light);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xff3D3D3D).withAlpha(153),
                                  shape: BoxShape.circle,
                                  border: context.watch<ThemeCubit>().state ==
                                          ThemeMode.light
                                      ? Border.all(
                                          color: AppColors.primary,
                                          width: 3) // Highlight light mode
                                      : null,
                                ),
                                child: SvgPicture.asset(
                                  AppVectors.sun,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Light Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: AppColors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const Signup()),
                    );
                  },
                  title: 'Continue',
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
