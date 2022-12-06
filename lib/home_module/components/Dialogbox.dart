import 'package:flutter/material.dart';
import 'package:time_link_shehroz/auth_module/view%20model/authentication_methods.dart';
import 'package:time_link_shehroz/utils/custom_btn.dart';
import 'package:time_link_shehroz/utils/custom_textfield.dart';
import 'package:time_link_shehroz/utils/custom_txt.dart';

class DialogBox extends StatelessWidget {
  DialogBox({Key? key}) : super(key: key);

  final ordernumbercontroller = TextEditingController();
  final ordernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Container(
          height: 353,
          width: 309,
          decoration: BoxDecoration(
              color: const Color(0xffF5FAFF),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTxt(
                    txt: "Please Enter the \n   Order Number",
                    clr: const Color(0xff000000),
                    size: 28,
                    fnt_wght: FontWeight.w500),
                const SizedBox(
                  height: 25,
                ),
                CustomOrderTextField(
                  Controller: ordernumbercontroller,
                  color1: const Color(0xffC59DF4),
                  color2: const Color(0xffA150FF),
                  obsecure: false,
                  hinttext: "# 124567",
                  Padding: const EdgeInsets.only(left: 90),
                ),
                const SizedBox(height: 28),
                CustomOrderTextField(
                  Controller: ordernamecontroller,
                  color1: const Color(0xffC59DF4),
                  color2: const Color(0xffA150FF),
                  obsecure: false,
                  hinttext: "Add fun facts",
                  Padding: const EdgeInsets.only(left: 75),
                ),
                const SizedBox(height: 29),
                InkWell(
                  onTap: () {
                    order(
                        ordername: ordernamecontroller,
                        ordernumber: ordernumbercontroller);
                    Navigator.of(context).pop();
                    //print(ordernamecontroller);
                  },
                  child: const Btn(
                    hgt: 37.0,
                    wdgt: 200.0,
                    txt: "Submit",
                    color1: Color(0xffC59DF4),
                    color2: Color(0xffA150FF),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
