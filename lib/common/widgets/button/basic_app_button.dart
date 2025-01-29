import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
final VoidCallback onPressed;
final String title;
final double height;
  const BasicAppButton({
    required this.onPressed,
    required this.title,
     required this.height,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(70)
      ),
      child:Text(
        title,
        style: TextStyle(
          color:Colors.white,
          fontWeight: FontWeight.w900
        )
      )
    );
  }
}