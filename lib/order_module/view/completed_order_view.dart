import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:time_link_shehroz/utils/custom_appbar.dart';
import 'package:time_link_shehroz/utils/custom_container.dart';
import 'package:time_link_shehroz/utils/custom_txt.dart';
import 'package:time_link_shehroz/utils/navigation_bar.dart';

class CompletedOrders extends StatefulWidget {
  const CompletedOrders({Key? key}) : super(key: key);

  @override
  State<CompletedOrders> createState() => _HomeState();
}

class _HomeState extends State<CompletedOrders> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Completed Orders",
        icon: Icons.arrow_back_ios,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.leftToRight,
                duration: const Duration(milliseconds: 500),
                child: const BottomNav()),
          );
        },
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 26, right: 25),
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    bottomsheet(context);
                  },
                  child: CustomContForOrders(
                    hight: size.height * .12,
                    width: size.width,
                    pdng: const EdgeInsets.only(left: 20, top: 35),
                    color1: const Color(0xffC59DF4),
                    color2: const Color(0xffA150FF),
                    txt: "Orders # 2345",
                    borderradius: BorderRadius.circular(15),
                    // pdng: const EdgeInsets.only(
                    //   right: 200,
                    // ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    bottomsheet(context);
                  },
                  child: CustomContForOrders(
                    hight: size.height * .12,
                    width: size.width,
                    pdng: const EdgeInsets.only(left: 20, top: 35),
                    color1: const Color(0xffC59DF4),
                    color2: const Color(0xffA150FF),
                    txt: "Orders # 3467",
                    borderradius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    bottomsheet(context);
                  },
                  child: CustomContForOrders(
                    hight: size.height * .12,
                    width: size.width,
                    pdng: const EdgeInsets.only(left: 20, top: 35),
                    color1: const Color(0xffC59DF4),
                    color2: const Color(0xffA150FF),
                    txt: "Orders # 3467",
                    borderradius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    bottomsheet(context);
                  },
                  child: CustomContForOrders(
                    hight: size.height * .12,
                    width: size.width,
                    pdng: const EdgeInsets.only(left: 20, top: 35),
                    color1: const Color(0xffC59DF4),
                    color2: const Color(0xffA150FF),
                    txt: "Orders # 3467",
                    borderradius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    bottomsheet(context);
                  },
                  child: CustomContForOrders(
                    hight: size.height * .12,
                    width: size.width,
                    pdng: const EdgeInsets.only(left: 20, top: 35),
                    color1: const Color(0xffC59DF4),
                    color2: const Color(0xffA150FF),
                    txt: "Orders # 3467",
                    borderradius: BorderRadius.circular(15),
                  ),
                ),
                //const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void bottomsheet(context) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      backgroundColor: const Color(0xffF5FAFF),
      isDismissible: true,
      context: context,
      builder: (BuildContext bc) {
        return InkWell(
          onTap: () {
            Navigator.pop(
              bc,
            );
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(height: 27),
                CustomTxt(
                    txt: "Order I'd",
                    clr: const Color(0xff000000),
                    size: 20,
                    fnt_wght: FontWeight.w700),
                const SizedBox(height: 26),
                CustomTxt(
                    txt: "Order Complation Time",
                    clr: const Color(0xff000000),
                    size: 28,
                    fnt_wght: FontWeight.w700),
                const SizedBox(height: 127),
                Padding(
                  padding: const EdgeInsets.only(left: 26, right: 26),
                  child: CustomContForOrders(
                    hight: 90.0,
                    width: MediaQuery.of(context).size.width,
                    color1: const Color(0xffC59DF4),
                    color2: const Color(0xffA150FF),
                    txt: "Orders # 2345",
                    borderradius: BorderRadius.circular(15),
                    pdng: const EdgeInsets.only(left: 18, top: 36),
                  ),
                ),
                const SizedBox(height: 29),
                Center(
                  child: CustomContainer(
                      hight: 43.0,
                      width: 156.0,
                      borderradius: BorderRadius.circular(15),
                      color1: const Color(0xffC59DF4),
                      color2: const Color(0xffA150FF),
                      chld: Center(
                        child: CustomTxt(
                            txt: "Order Qr",
                            clr: Colors.white,
                            size: 15,
                            fnt_wght: FontWeight.w500),
                      )),
                )
              ],
            ),
          ),
        );
      });
}
