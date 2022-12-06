import 'package:flutter/material.dart';
import 'package:time_link_shehroz/profile_module/view/profile_view.dart';
import 'package:time_link_shehroz/utils/custom_appbar.dart';
import 'package:time_link_shehroz/utils/custom_container.dart';
import 'package:time_link_shehroz/utils/custom_txt.dart';

class GraphStatics extends StatefulWidget {
  const GraphStatics({Key? key}) : super(key: key);

  @override
  State<GraphStatics> createState() => _HomeState();
}

class _HomeState extends State<GraphStatics> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      //drawer: MyDrawer(),
      appBar: CustomAppBar(
        title: "Graphs & statistics",
        icon: Icons.arrow_back_ios,
        onPressed: () {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => const Profile()),
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
                const SizedBox(height: 30),
                CustomContainer(
                  hight: size.height * .12,
                  width: size.width,
                  color1: const Color(0xffC59DF4),
                  color2: const Color(0xffA150FF),
                  chld: Center(
                    child: CustomTxt(
                        txt: "Average order time per\n          day / weekly",
                        clr: Colors.white,
                        size: 20,
                        fnt_wght: FontWeight.w500),
                  ),
                  borderradius: BorderRadius.circular(15),
                ),
                const SizedBox(height: 30),
                CustomContainer(
                  hight: size.height * .12,
                  width: size.width,
                  color1: const Color(0xffC59DF4),
                  color2: const Color(0xffA150FF),
                  chld: Center(
                    child: CustomTxt(
                        txt:
                            "Average order completion\n          time per order",
                        clr: Colors.white,
                        size: 20,
                        fnt_wght: FontWeight.w500),
                  ),
                  borderradius: BorderRadius.circular(15),
                ),
                const SizedBox(height: 30),
                CustomContainer(
                  hight: size.height * .12,
                  width: size.width,
                  color1: const Color(0xffC59DF4),
                  color2: const Color(0xffA150FF),
                  chld: Center(
                    child: CustomTxt(
                        txt: "Number of orders on a\n  particular day / week ",
                        clr: Colors.white,
                        size: 20,
                        fnt_wght: FontWeight.w500),
                  ),
                  borderradius: BorderRadius.circular(15),
                ),
                const SizedBox(height: 30),
                CustomContainer(
                  hight: size.height * .12,
                  width: size.width,
                  color1: const Color(0xffC59DF4),
                  color2: const Color(0xffA150FF),
                  chld: Center(
                    child: CustomTxt(
                        txt: "Busiest periods ",
                        clr: Colors.white,
                        size: 20,
                        fnt_wght: FontWeight.w500),
                  ),
                  borderradius: BorderRadius.circular(15),
                ),
                const SizedBox(height: 30),
                CustomContainer(
                  hight: size.height * .12,
                  width: size.width,
                  color1: const Color(0xffC59DF4),
                  color2: const Color(0xffA150FF),
                  chld: Center(
                    child: CustomTxt(
                        txt: "Order per day / week",
                        clr: Colors.white,
                        size: 20,
                        fnt_wght: FontWeight.w500),
                  ),
                  borderradius: BorderRadius.circular(15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
