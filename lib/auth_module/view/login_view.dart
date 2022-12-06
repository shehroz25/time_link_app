//@dart=2.9
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_link_shehroz/auth_module/view%20model/authentication_methods.dart';
import 'package:time_link_shehroz/auth_module/view/signup_view.dart';
import 'package:time_link_shehroz/utils/custom_btn.dart';
import 'package:time_link_shehroz/utils/custom_textfield.dart';
import 'package:time_link_shehroz/utils/custom_txt.dart';
import 'package:time_link_shehroz/utils/navigation_bar.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();

  final _password = TextEditingController();
  bool isLoading = false;
  bool visiblePassword = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 97, left: 26, right: 29),
              height: size.height * .85,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 29, right: 29),
                    child: Image.asset("assets/images/pic2.png"),
                  ),
                  const SizedBox(height: 47),
                  Center(
                    child: CustomTxt(
                        txt: "Welcome to timelink",
                        clr: const Color(0xff65A6E7),
                        size: 28,
                        fnt_wght: FontWeight.w500),
                  ),
                  const SizedBox(height: 32),
                  CustomTxt(
                      txt: "Email Address",
                      clr: const Color(0xff000000),
                      size: 14,
                      fnt_wght: FontWeight.w400),
                  const SizedBox(height: 5),
                  CustomTextField(
                    color1: const Color(0xffC59DF4),
                    color2: const Color(0xffA150FF),
                    obsecure: false,
                    hinttext: "example@gmail.com",
                    inputtype: TextInputType.emailAddress,
                    Controller: _email,
                  ),
                  const SizedBox(height: 34),
                  CustomTxt(
                      txt: "Password",
                      clr: const Color(0xff000000),
                      size: 14,
                      fnt_wght: FontWeight.w400),
                  const SizedBox(height: 11),
                  CustomTextField(
                      color1: const Color(0xffC59DF4),
                      color2: const Color(0xffA150FF),
                      obsecure: !visiblePassword,
                      hinttext: "password",
                      inputtype: TextInputType.emailAddress,
                      Controller: _password,
                      suffixicon: IconButton(
                        icon: Icon(
                          visiblePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xffFFFFFF),
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            visiblePassword = !visiblePassword;
                          });
                        },
                      )),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTxt(
                          txt: "Forget Password?",
                          clr: const Color(0xff000000),
                          size: 12,
                          fnt_wght: FontWeight.w400),
                    ],
                  ),
                  const SizedBox(height: 17),
                  InkWell(
                    onTap: () {
                      if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
                        setState(() {
                          isLoading = true;
                        });

                        logIn(_email.text, _password.text).then((user) {
                          if (user != null) {
                            print("Login Sucessfully");
                            setState(() {});
                            Get.snackbar("", "Login Sucessfully",
                                backgroundColor: Colors.green,
                                colorText: const Color(0xffFFFFFF),
                                animationDuration:
                                    const Duration(milliseconds: 300));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const BottomNav()));
                          } else {
                            print("Login Failed");
                            setState(() {});
                          }
                        });
                      } else {
                        Get.snackbar("error", "Please fill all the fields",
                            backgroundColor: const Color(0xffC59DF4));
                      }
                    },
                    child: Btn(
                      color1: const Color(0xffC59DF4),
                      color2: const Color(0xffA150FF),
                      txt: "Log in",
                      wdgt: 355.0,
                      hgt: size.height * .055,
                    ),
                  ),
                  const SizedBox(height: 31),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: 'Dont have an Account? ',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff3C3C3C))),
                        TextSpan(
                            text: 'Sign up',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SignUp()),
                                    )
                                    // Get.to(const SignUp())
                                  },
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000))),
                      ])),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
