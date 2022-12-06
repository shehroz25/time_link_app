import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_link_shehroz/auth_module/view%20model/authentication_methods.dart';
import 'package:time_link_shehroz/home_module/view/add_promotion.dart';
import 'package:time_link_shehroz/home_module/view/scan_device.dart';
import 'package:time_link_shehroz/profile_module/view/profile_update.dart';
import 'package:time_link_shehroz/profile_module/view/subscription_view.dart';
import 'package:time_link_shehroz/utils/custom_container.dart';
import 'package:time_link_shehroz/utils/custom_txt.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    User? user = FirebaseAuth.instance.currentUser;
    return SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(user!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              var userData = snapshot.data;
              return Drawer(
                  child: Column(
                children: [
                  CustomContainer(
                    hight: 113.0,
                    width: size.width,
                    chld: Padding(
                      padding: const EdgeInsets.only(top: 17, left: 36),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              userData != null
                                  ? CircleAvatar(
                                      radius: 35,
                                      backgroundImage:
                                          NetworkImage(userData['imageUrl']),
                                    )
                                  : const CircleAvatar(
                                      radius: 35,
                                      child: CircularProgressIndicator(),
                                    ),
                              const SizedBox(width: 19),
                              Column(
                                children: [
                                  CustomTxt(
                                      txt: userData != null
                                          ? userData['business name']
                                          : "",
                                      clr: const Color(0xffFFFFFF),
                                      size: 16,
                                      fnt_wght: FontWeight.w500),
                                  CustomTxt(
                                      txt: userData != null
                                          ? userData['email']
                                          : "",
                                      clr: const Color(0xffFFFFFF),
                                      size: 8,
                                      fnt_wght: FontWeight.w400)
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    borderradius: const BorderRadius.only(),
                    color1: const Color(0xffC59DF4),
                    color2: const Color(0xffA150FF),
                  ),
                  InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const Home()),
                        // );
                      },
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/orderdelievery.png",
                          color: Colors.black,
                        ),
                        title: const Text(
                          "Active Orders",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  const Divider(
                    height: 20,
                    thickness: 2,
                    color: Colors.black,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Subscription()),
                        );
                      },
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/renew.png",
                          color: Colors.black,
                        ),
                        title: const Text(
                          "Subscription",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  const Divider(
                    height: 20,
                    thickness: 2,
                    color: Colors.black,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScanDevice()),
                        );
                      },
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/scanner.png",
                          color: Colors.black,
                        ),
                        title: const Text(
                          "Scan QR",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  const Divider(
                    height: 20,
                    thickness: 2,
                    color: Colors.black,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileUpdate()),
                        );
                      },
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/profile.png",
                          color: Colors.black,
                        ),
                        title: const Text(
                          "Profile",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  const Divider(
                    height: 20,
                    thickness: 2,
                    color: Colors.black,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddPromotion()),
                        );
                      },
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/promotion.png",
                          color: Colors.black,
                        ),
                        title: const Text(
                          "Add promotion",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  const Divider(
                    height: 20,
                    thickness: 2,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 62, right: 76),
                    child: MaterialButton(
                      height: size.height * .050,
                      minWidth: size.width * .40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () {
                        logOut(context);
                      },
                      child: Row(
                        children: [
                          Image.asset('assets/images/logout.png'),
                          const Spacer(),
                          const Text(
                            "Logout",
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          const SizedBox(width: 19),
                        ],
                      ),
                      color: const Color(0xffC59DF4),
                    ),
                  ),
                ],
              ));
            }));
  }
}
