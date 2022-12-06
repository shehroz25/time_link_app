import 'package:flutter/material.dart';
import 'package:time_link_shehroz/home_module/components/Dialogbox.dart';
import 'package:time_link_shehroz/home_module/view/home_view.dart';
import 'package:time_link_shehroz/utils/custom_appbar.dart';
import 'package:time_link_shehroz/utils/custom_container.dart';
import 'package:time_link_shehroz/utils/custom_txt.dart';

class AddPromotion extends StatelessWidget {
  const AddPromotion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Add Promotion",
        icon: Icons.arrow_back_ios,
        icon2: Icons.add,
        onPressed: () {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        },
        onPressed2: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return DialogBox();
              });
        },
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              CustomContainer(
                hight: size.height * .12,
                width: 309.0,
                chld: Center(
                  child: CustomTxt(
                      txt: "Offer name",
                      clr: const Color(0xffffffff),
                      size: 20,
                      fnt_wght: FontWeight.w500),
                ),
                borderradius: BorderRadius.circular(15),
                color1: const Color(0xffC59DF4),
                color2: const Color(0xffA150FF),
              ),
              const SizedBox(height: 30),
              CustomContainer(
                hight: size.height * .12,
                width: 309.0,
                chld: Center(
                  child: CustomTxt(
                      txt: "offer name",
                      clr: const Color(0xffffffff),
                      size: 20,
                      fnt_wght: FontWeight.w500),
                ),
                borderradius: BorderRadius.circular(15),
                color1: const Color(0xffC59DF4),
                color2: const Color(0xffA150FF),
              ),
              const SizedBox(height: 30),
              CustomContainer(
                hight: size.height * .12,
                width: 309.0,
                chld: Center(
                  child: CustomTxt(
                      txt: "offer name",
                      clr: const Color(0xffffffff),
                      size: 20,
                      fnt_wght: FontWeight.w500),
                ),
                borderradius: BorderRadius.circular(15),
                color1: const Color(0xffC59DF4),
                color2: const Color(0xffA150FF),
              ),
              const SizedBox(height: 30),
              CustomContainer(
                hight: size.height * .12,
                width: 309.0,
                chld: Center(
                  child: CustomTxt(
                      txt: "offer name",
                      clr: const Color(0xffffffff),
                      size: 20,
                      fnt_wght: FontWeight.w500),
                ),
                borderradius: BorderRadius.circular(15),
                color1: const Color(0xffC59DF4),
                color2: const Color(0xffA150FF),
              ),
              const SizedBox(height: 30),
              CustomContainer(
                hight: size.height * .12,
                width: 309.0,
                chld: Center(
                  child: CustomTxt(
                      txt: "offer name",
                      clr: const Color(0xffffffff),
                      size: 20,
                      fnt_wght: FontWeight.w500),
                ),
                borderradius: BorderRadius.circular(15),
                color1: const Color(0xffC59DF4),
                color2: const Color(0xffA150FF),
              )
            ],
          ),
        ),
      ),
    );
  }
}
