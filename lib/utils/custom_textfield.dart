import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.color1,
      required this.color2,
      this.labeltext,
      this.hinttext,
      this.prefixicon,
      this.suffixicon,
      this.Controller,
      required this.obsecure,
      this.color3,
      this.Padding,
      //this.maxliness,
      this.inputtype})
      : super(key: key);

  final color1;
  final color2;
  final labeltext;
  final hinttext;
  final prefixicon;
  final suffixicon;
  final TextEditingController? Controller;
  final obsecure;
  final color3;
  final inputtype;
  final Padding;
  //final maxliness;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: size.height * .055,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1, color2]),
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [BoxShadow(blurRadius: 3, color: Color(0xffA150FF))],
      ),
      child: TextFormField(
        style: TextStyle(color: color3),
        controller: Controller,
        obscureText: obsecure,
        keyboardType: inputtype,
        //maxLines: maxliness,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.white),
          hintText: hinttext,
          labelText: labeltext,
          prefixIcon: prefixicon,
          suffixIcon: suffixicon,
        ),
      ),
    );
  }
}

class CustomTextFieldNoBorder extends StatelessWidget {
  const CustomTextFieldNoBorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(fillColor: Color(0xffffffff)),
    );
  }
}

class CustomOrderTextField extends StatelessWidget {
  const CustomOrderTextField(
      {Key? key,
      required this.color1,
      required this.color2,
      this.labeltext,
      this.hinttext,
      this.prefixicon,
      this.suffixicon,
      this.Controller,
      required this.obsecure,
      this.color3,
      this.Padding,
      //this.maxliness,
      this.inputtype})
      : super(key: key);

  final color1;
  final color2;
  final labeltext;
  final hinttext;
  final prefixicon;
  final suffixicon;
  final TextEditingController? Controller;
  final obsecure;
  final color3;
  final inputtype;
  final Padding;
  //final maxliness;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: Padding,
      height: size.height * .055,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1, color2]),
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [BoxShadow(blurRadius: 3, color: Color(0xffA150FF))],
      ),
      child: TextFormField(
        style: TextStyle(color: color3),
        controller: Controller,
        obscureText: obsecure,
        keyboardType: inputtype,
        //maxLines: maxliness,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.white),
          hintText: hinttext,
          labelText: labeltext,
          prefixIcon: prefixicon,
          suffixIcon: suffixicon,
        ),
      ),
    );
  }
}
