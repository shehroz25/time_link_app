import 'dart:async';

import 'package:flutter/material.dart';
import 'package:time_link_shehroz/onboarding_module/view/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        "assets/images/splashimage.png",
      ),
      color: Colors.blue.withOpacity(.5),
      //color: const Color.fromRGBO(190, 190, 190, .5),
      // color: const Color.fromARGB(255, 162, 187, 212),
    ));
  }
}
