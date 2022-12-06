//@dart=2.9
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:time_link_shehroz/auth_module/view%20model/authentication_methods.dart';
import 'package:time_link_shehroz/auth_module/view/login_view.dart';
import 'package:time_link_shehroz/utils/custom_appbar.dart';
import 'package:time_link_shehroz/utils/custom_btn.dart';
import 'package:time_link_shehroz/utils/custom_textfield.dart';
import 'package:time_link_shehroz/utils/custom_txt.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _name = TextEditingController();

  final _email = TextEditingController();

  final _password = TextEditingController();

  final _businessPhone = TextEditingController();

  final _personalPhone = TextEditingController();

  File _profileImage;
  bool visiblePassword = false;
  bool visiblePasswords = false;

  Future imagePicked() async {
    final pickedImage =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _profileImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    User user = FirebaseAuth.instance.currentUser;

    // bool isLoading = false;

    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {},
        title: "Sign Up",
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 19, right: 19),
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Center(
                    child: InkWell(
                        onTap: imagePicked,
                        child: _profileImage != null
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(_profileImage))
                            : const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/pic3.png'))),
                  ),
                  CustomTxt(
                      txt: "Business Name",
                      clr: const Color(0xff000000),
                      size: 14,
                      fnt_wght: FontWeight.w400),
                  const SizedBox(height: 5),
                  CustomTextField(
                    color1: const Color(0xffC59DF4),
                    color2: const Color(0xffA150FF),
                    obsecure: false,
                    hinttext: "Business Name",
                    inputtype: TextInputType.emailAddress,
                    Controller: _name,
                  ),
                  const SizedBox(height: 28.89),
                  CustomTxt(
                      txt: "User-name/Phone number/Email",
                      clr: const Color(0xff000000),
                      size: 14,
                      fnt_wght: FontWeight.w400),
                  const SizedBox(height: 5),
                  CustomTextField(
                    color1: const Color(0xffC59DF4),
                    color2: const Color(0xffA150FF),
                    obsecure: false,
                    hinttext: "Write your name",
                    inputtype: TextInputType.emailAddress,
                    Controller: _email,
                  ),
                  const SizedBox(height: 34.11),
                  CustomTxt(
                      txt: "Business password",
                      clr: const Color(0xff000000),
                      size: 14,
                      fnt_wght: FontWeight.w400),
                  const SizedBox(height: 5),
                  CustomTextField(
                      color1: const Color(0xffC59DF4),
                      color2: const Color(0xffA150FF),
                      obsecure: !visiblePassword,
                      hinttext: "Password",
                      inputtype: TextInputType.emailAddress,
                      Controller: _password,
                      suffixicon: IconButton(
                          onPressed: () {
                            setState(() {
                              visiblePassword = !visiblePassword;
                            });
                          },
                          icon: Icon(
                            visiblePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xffFFFFFF),
                          ))),
                  const SizedBox(height: 34.11),
                  CustomTxt(
                      txt: "Business password",
                      clr: const Color(0xff000000),
                      size: 14,
                      fnt_wght: FontWeight.w400),
                  const SizedBox(height: 5),
                  CustomTextField(
                      color1: const Color(0xffC59DF4),
                      color2: const Color(0xffA150FF),
                      obsecure: !visiblePasswords,
                      hinttext: "Confirm password",
                      inputtype: TextInputType.emailAddress,
                      suffixicon: IconButton(
                          onPressed: () {
                            setState(() {
                              visiblePasswords = !visiblePasswords;
                            });
                          },
                          icon: Icon(
                            visiblePasswords
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xffFFFFFF),
                          ))),
                  const SizedBox(height: 34.11),
                  CustomTxt(
                      txt: "Business phone number",
                      clr: const Color(0xff000000),
                      size: 14,
                      fnt_wght: FontWeight.w400),
                  const SizedBox(height: 5),
                  CustomTextField(
                    Controller: _businessPhone,
                    color1: const Color(0xffC59DF4),
                    color2: const Color(0xffA150FF),
                    obsecure: false,
                    hinttext: "Write your number",
                    inputtype: TextInputType.phone,
                  ),
                  const SizedBox(height: 34.11),
                  CustomTxt(
                      txt: "Personal phone number",
                      clr: const Color(0xff000000),
                      size: 14,
                      fnt_wght: FontWeight.w400),
                  const SizedBox(height: 5),
                  CustomTextField(
                    Controller: _personalPhone,
                    color1: const Color(0xffC59DF4),
                    color2: const Color(0xffA150FF),
                    obsecure: false,
                    hinttext: "Write your number",
                    inputtype: TextInputType.phone,
                  ),
                  const SizedBox(height: 34.11),
                  CustomTxt(
                      txt: "Business email address",
                      clr: const Color(0xff000000),
                      size: 14,
                      fnt_wght: FontWeight.w400),
                  const SizedBox(height: 5),
                  const CustomTextField(
                    color1: Color(0xffC59DF4),
                    color2: Color(0xffA150FF),
                    obsecure: false,
                    hinttext: "Write your email address",
                    inputtype: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 34.11),
                  CustomTxt(
                      txt: "ABN or ACN",
                      clr: const Color(0xff000000),
                      size: 14,
                      fnt_wght: FontWeight.w400),
                  const SizedBox(height: 5),
                  const CustomTextField(
                    color1: Color(0xffC59DF4),
                    color2: Color(0xffA150FF),
                    obsecure: false,
                    hinttext: "Write your ABN/ACN",
                    inputtype: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 44.14),
                  InkWell(
                    onTap: () {
                      if (_name.text.isNotEmpty &&
                          _email.text.isNotEmpty &&
                          _password.text.isNotEmpty) {
                        setState(() {});

                        createAccount(
                                _name.text,
                                _email.text,
                                _password.text,
                                _businessPhone.text,
                                _personalPhone.text,
                                _profileImage)
                            .then((user) {
                          if (user != null) {
                            setState(() {});
                            Get.snackbar("", "Account Created Sucessfully",
                                backgroundColor: const Color(0xffC59DF4));
                            print("Account Created Sucessfully");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          } else {
                            Get.snackbar("error", "Please fill all the fields",
                                backgroundColor: const Color(0xffC59DF4));
                            print("Login Failed");
                            setState(() {});
                          }
                        });
                      } else {
                        Get.snackbar("error", "Please fill all the fields",
                            backgroundColor: const Color(0xffC59DF4));
                        print("Please enter the fields");
                      }
                    },
                    child: Btn(
                      color1: const Color(0xffC59DF4),
                      color2: const Color(0xffA150FF),
                      txt: "Sign up",
                      wdgt: 370.0,
                      hgt: size.height * .055,
                    ),
                  ),
                  const SizedBox(height: 44.14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff3C3C3C))),
                        TextSpan(
                            text: 'Log In',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()),
                                    )
                                    // Get.to(const SignUp())
                                  },
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000))),
                      ])),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
