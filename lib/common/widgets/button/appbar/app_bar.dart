import 'package:flutter/material.dart';
import 'package:music/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;
  const BasicAppBar({
    this.title,
    this.action,
    this.backgroundColor,
    this.hideBack=false,
    super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
backgroundColor: backgroundColor?? Colors.transparent ,
elevation:0, 
title:title ?? const Text('') ,
actions:[
  action?? Container()
],
centerTitle: true,
leading:hideBack? null: IconButton(
  onPressed:(){
    Navigator.pop(context);
  },
  icon: Container(
  height:50,
  width:50,
  decoration: BoxDecoration(
    color:context.isDarkMode? Colors.white.withValues(alpha:0.03) : Colors.black.withValues(alpha:0.05),
    shape:BoxShape.circle
    
  ),
  child: Icon(
    Icons.arrow_back_ios_new_sharp,
    size:20,
    color:context.isDarkMode? Colors.white : Colors.black,
  ),
),
),
    );
  }
  
  @override
 
  Size get preferredSize =>const Size.fromHeight(kToolbarHeight);
}