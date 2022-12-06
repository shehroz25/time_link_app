import 'package:flutter/material.dart';

class Rows extends StatelessWidget {
  const Rows({Key? key, required this.img, required this.txt}) : super(key: key);

  final String img;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Row(
        children: [
          Image.asset(img),
          const SizedBox(width: 22),
          Text(txt,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black
          ),)
        ],
      ),
    );
  }
}
