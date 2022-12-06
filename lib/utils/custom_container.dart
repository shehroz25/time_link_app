import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {Key? key,
      required this.hight,
      required this.width,
      this.clr,
      required this.chld,
      required this.borderradius,
      this.color1,
      this.color2,
      this.pdng})
      : super(key: key);
  final hight;
  final width;
  final color1;
  final color2;
  final clr;
  final chld;
  final borderradius;
  final pdng;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: hight,
      width: width,
      child: chld,
      padding: pdng,
      decoration: BoxDecoration(
        color: clr,
        gradient: LinearGradient(colors: [color1, color2]),
        borderRadius: borderradius,
        // boxShadow: const [
        //   BoxShadow(blurRadius: 2, color: Color(0xffA150FF))
        //]
      ),
    );
  }
}

class CustomContForOrders extends StatelessWidget {
  const CustomContForOrders(
      {Key? key,
      required this.hight,
      required this.width,
      this.color1,
      this.color2,
      this.txt,
      this.borderradius,
      this.pdng})
      : super(key: key);
  final hight;
  final width;
  final color1;
  final color2;
  final txt;
  final borderradius;
  final pdng;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: pdng,
      height: hight,
      width: width,
      child: Text(
        txt,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1, color2]),
        borderRadius: borderradius,
      ),
    );
  }
}
