import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:time_link_shehroz/auth_module/view/authenticate.dart';
import 'package:time_link_shehroz/utils/custom_btn.dart';
import 'package:time_link_shehroz/utils/custom_txt.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/pic1.png",
                  height: size.height * .70,
                  width: size.width,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 68, left: 75),
                  child: Image.asset("assets/images/splashimage.png"),
                ),
                Image.asset(
                  "assets/images/Frame.png",
                  height: size.height * .75,
                  fit: BoxFit.fitWidth,
                )
              ],
            ),
            CustomTxt(
                txt: "Hey,time saver",
                clr: const Color(0xff65A6E7),
                size: 28,
                fnt_wght: FontWeight.w500),
            const SizedBox(height: 6),
            CustomTxt(
                txt: "Welcome to time link",
                clr: const Color(0xff686868),
                size: 16,
                fnt_wght: FontWeight.w400),
            const SizedBox(height: 20),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Authenticate()));
                },
                child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            duration: const Duration(milliseconds: 600),
                            child: Authenticate()),
                      );
                    },
                    child: const Btn(
                      color1: Color(0xffC59DF4),
                      color2: Color(0xffA150FF),
                      txt: "Start",
                      wdgt: 200.0,
                      hgt: 37.0,
                    )))
          ],
        ),
      ),
    );
  }
}
