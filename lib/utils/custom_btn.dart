import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {Key? key,
      required this.txt,
      required this.clr,
      required this.op,
      required this.color,
      this.icon})
      : super(key: key);
  @override
  final txt;
  final clr;
  final color;
  final op;
  final icon;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.only(left: 20, right: 5),
      height: MediaQuery.of(context).size.height * .06,
      minWidth: 500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      color: color,
      onPressed: op,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Icon(icon, color: Colors.white),
          const SizedBox(
            width: 50,
          ),
          Text(
            txt,
            style: TextStyle(color: clr, fontSize: 14),
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}

class Btn extends StatelessWidget {
  const Btn(
      {Key? key,
      this.color1,
      this.color2,
      this.txt,
      this.hgt,
      this.wdgt,
      this.img})
      : super(key: key);
  final color1;
  final color2;
  final txt;
  final hgt;
  final wdgt;
  final img;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: hgt,
      width: wdgt,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(blurRadius: 2, color: Color(0xffA150FF))
          ]),
      child: Center(
        child: Text(
          txt,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
