import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:time_link_shehroz/chat_module/view/search_user.dart';
import 'package:time_link_shehroz/profile_module/components/row_profile.dart';
import 'package:time_link_shehroz/profile_module/view/business_map.dart';
import 'package:time_link_shehroz/profile_module/view/customer_demographic.dart';
import 'package:time_link_shehroz/profile_module/view/graph_statistics.dart';
import 'package:time_link_shehroz/profile_module/view/profile_update.dart';
import 'package:time_link_shehroz/profile_module/view/subscription_view.dart';
import 'package:time_link_shehroz/utils/custom_appbar.dart';
import 'package:time_link_shehroz/utils/custom_txt.dart';
import 'dart:io';

import 'package:time_link_shehroz/utils/navigation_bar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    User? user = FirebaseAuth.instance.currentUser;
    File image;
    String imgUrl;
    return Scaffold(
      appBar: CustomAppBar(
          title: "Profile",
          icon: Icons.arrow_back_ios,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                  type: PageTransitionType.leftToRight,
                  duration: const Duration(milliseconds: 500),
                  child: const BottomNav()),
            );
            // Get.off(const BottomNav());
          }),
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(user!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              var getData = snapshot.data;
              return SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.033,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          getData != null
                              ? CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(getData['imageUrl']),
                                )
                              : const CircleAvatar(
                                  radius: 30,
                                  child: CircularProgressIndicator(),
                                ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTxt(
                                  txt: getData != null
                                      ? getData['business name']
                                      : "",
                                  clr: const Color(0xff000000),
                                  size: 20,
                                  fnt_wght: FontWeight.w500),
                              CustomTxt(
                                  txt:
                                      "Don’t tell anyone, but I’m obito\nuchiha.",
                                  clr: const Color(0xff000000),
                                  size: 12,
                                  fnt_wght: FontWeight.w400)
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.036,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(const ProfileUpdate(),
                              duration: const Duration(milliseconds: 400),
                              transition: Transition.cupertino);

                          print(getData);
                        },
                        child: const Rows(
                            img: "assets/images/profile.png", txt: 'Profile')),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Divider(thickness: 2),
                    SizedBox(
                      height: size.height * 0.024,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const Subscription(),
                            duration: const Duration(milliseconds: 400),
                            transition: Transition.cupertino);
                      },
                      child: const Rows(
                          img: "assets/images/renew.png", txt: 'Subcriptions'),
                    ),
                    SizedBox(
                      height: size.height * 0.022,
                    ),
                    const Divider(thickness: 2),
                    SizedBox(
                      height: size.height * 0.024,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const SearchUser(),
                            duration: const Duration(milliseconds: 400),
                            transition: Transition.cupertino);
                      },
                      child: const Rows(
                          img: "assets/images/Vector.png", txt: 'Support chat'),
                    ),
                    SizedBox(
                      height: size.height * 0.024,
                    ),
                    const Divider(thickness: 2),
                    SizedBox(
                      height: size.height * 0.023,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(const GraphStatics(),
                              duration: const Duration(milliseconds: 400),
                              transition: Transition.cupertino);
                        },
                        child: const Rows(
                            img: "assets/images/graph.png",
                            txt: 'Graphs & statistics')),
                    SizedBox(
                      height: size.height * 0.023,
                    ),
                    const Divider(thickness: 2),
                    SizedBox(
                      height: size.height * 0.023,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const GoogleMapView(),
                            duration: const Duration(milliseconds: 400),
                            transition: Transition.cupertino);
                      },
                      child: const Rows(
                          img: "assets/images/network.png",
                          txt: 'Businesses around you'),
                    ),
                    SizedBox(
                      height: size.height * 0.023,
                    ),
                    const Divider(thickness: 2),
                    SizedBox(
                      height: size.height * 0.023,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const CustomerDemographic(),
                            duration: const Duration(milliseconds: 400),
                            transition: Transition.cupertino);
                      },
                      child: const Rows(
                          img: "assets/images/demo.png",
                          txt: 'Customer demographics'),
                    ),
                    SizedBox(
                      height: size.height * 0.023,
                    ),
                    const Divider(thickness: 2),
                    SizedBox(
                      height: size.height * 0.023,
                    ),
                    const Rows(img: "assets/images/group.png", txt: 'Help'),
                    SizedBox(
                      height: size.height * 0.023,
                    ),
                    const Divider(thickness: 2),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
