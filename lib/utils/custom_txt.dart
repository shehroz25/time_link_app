import 'package:flutter/material.dart';
class CustomTxt extends StatelessWidget {
  @override

  CustomTxt({Key? key , required this.txt,required this.clr, required this.size,required this.fnt_wght}) : super(key: key);
  final txt;
  final clr;
  double size;
  FontWeight fnt_wght;



  @override
  Widget build(BuildContext context) {
    return Text(txt,style:TextStyle(color:clr,fontSize: size,fontWeight: fnt_wght) );
  }
}

