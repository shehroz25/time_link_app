import 'package:flutter/material.dart';
import 'package:time_link_shehroz/profile_module/view/profile_view.dart';
import 'package:time_link_shehroz/utils/custom_appbar.dart';
import 'package:time_link_shehroz/utils/custom_container.dart';
import 'package:time_link_shehroz/utils/custom_txt.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  String? subscription;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Subscriptions",
          icon: Icons.arrow_back_ios,
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
          }),
      body: SizedBox(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Center(child: Image.asset("assets/images/pic4.png")),
            const SizedBox(height: 58),
            CustomContForOrders(
              hight: 90.0,
              width: 309.0,
              pdng: const EdgeInsets.only(left: 60, top: 33, right: 59),
              txt: "Current subcription",
              color1: const Color(0xffC59DF4),
              color2: const Color(0xffA150FF),
              borderradius: BorderRadius.circular(15),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: RadioListTile(
                activeColor: const Color(0xffA354FE),
                title: CustomTxt(
                    txt: "Upgrade subscription",
                    clr: const Color(0xff000000),
                    size: 20,
                    fnt_wght: FontWeight.w400),
                value: "Upgrade subscription",
                groupValue: subscription,
                onChanged: (value) {
                  setState(() {
                    subscription = value.toString();
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: RadioListTile(
                  activeColor: const Color(0xffA354FE),
                  title: CustomTxt(
                      txt: "Downgrade subscription",
                      clr: const Color(0xff000000),
                      size: 20,
                      fnt_wght: FontWeight.w400),
                  value: "Downgrade subscription",
                  groupValue: subscription,
                  onChanged: (value) {
                    setState(() {
                      subscription = value.toString();
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
