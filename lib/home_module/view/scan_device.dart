import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:time_link_shehroz/utils/custom_appbar.dart';
import 'package:time_link_shehroz/utils/custom_txt.dart';
import 'package:time_link_shehroz/utils/navigation_bar.dart';

class ScanDevice extends StatelessWidget {
  const ScanDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.leftToRight,
                duration: const Duration(milliseconds: 500),
                child: const BottomNav()),
          );
        },
        title: "Add Device",
        icon: Icons.arrow_back_ios,
      ),
      body: SizedBox(
          child: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            child: CustomTxt(
                txt: "Scan the QR code of the\n                device",
                clr: const Color(0xff000000),
                size: 22,
                fnt_wght: FontWeight.w500),
          ),
          const SizedBox(height: 35),
          Image.asset("assets/images/qr.png"),
          const SizedBox(height: 47),
          CustomTxt(
              txt:
                  "The QR code will be automatically detected\nwhen you position it between the guide lines",
              clr: Colors.black,
              size: 14,
              fnt_wght: FontWeight.w600)
        ],
      )),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Container(
      //     height: 61,
      //     width: 61,
      //     child: const Icon(
      //       Icons.add,
      //       color: Colors.white,
      //     ),
      //     decoration: const BoxDecoration(
      //       shape: BoxShape.circle,
      //       gradient: LinearGradient(
      //         colors: [Color(0xffC297F5), Color(0xffA355FE)],
      //       ),
      //     ),
      //   ),
      // )
    );
  }
}
