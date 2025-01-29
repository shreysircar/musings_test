import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music/common/widgets/button/appbar/app_bar.dart';
import 'package:music/common/widgets/button/basic_app_button.dart';
import 'package:music/core/configs/assets/app_vectors.dart';
import 'package:music/presentation/auth/pages/register.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 70,
          width: 70,
        )
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical:50,
          horizontal: 30
        ),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
        _registerText(),
        const SizedBox(height: 50,),
                const SizedBox(height: 20,),
        _emailField(context),
         const SizedBox(height: 20,),
        _passwordField(context),
         const SizedBox(height: 20,),
         BasicAppButton(
          onPressed: (){},
           title: 'Sign In', 
           height: 20)
          ],
        ),
      ),
    );
  }

  Widget _registerText(){
    return const Text(
      'Sign In',
      style:TextStyle(
        fontWeight:FontWeight.bold,
        fontSize:25
      )
    );
  }



  Widget _emailField(BuildContext context){
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter Email'
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _passwordField(BuildContext context){
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter Password'
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
    );
  }

Widget _signupText(BuildContext context){
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical:30
      ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
    const Text(
    'Not a Member?',
    style: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize:14
    ),
    ),
    TextButton(
      onPressed: (){
                                    Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const RegisterPage(),
                              ),
                            );
      },
       child:const Text(
'Register Now',
       )
    ),
      ],
      ),
  );
}

}