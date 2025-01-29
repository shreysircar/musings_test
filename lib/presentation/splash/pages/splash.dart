import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music/core/configs/assets/app_vectors.dart';
import 'package:music/presentation/intro/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
@override
void initState(){
  super.initState();
  redirect();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
       child:SvgPicture.asset(
       AppVectors.logo,
       width:120,
       height:120
       ),
      )
    );
  }
  Future<void> redirect() async{
    await Future.delayed(Duration(seconds:4));
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context, 
      MaterialPageRoute(
        builder: (BuildContext context) => const GetStartedPage()
        )
        );
  }
}
