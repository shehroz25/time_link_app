import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_link_shehroz/auth_module/view%20model/authentication_methods.dart';
import 'package:time_link_shehroz/order_module/view/order_view.dart';
import 'package:time_link_shehroz/utils/custom_appbar.dart';
import 'package:time_link_shehroz/utils/custom_btn.dart';
import 'package:time_link_shehroz/utils/custom_container.dart';
import 'package:time_link_shehroz/utils/custom_txt.dart';
import 'package:time_link_shehroz/utils/my_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: CustomAppBar(
        onPressed: () {
          Scaffold.of(context).openDrawer();
          //const MyDrawer();
        },
        title: "Active Orders",
        icon: Icons.menu,
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 26, right: 25, top: 30),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('orders')
                  .where("email",
                      isEqualTo: FirebaseAuth.instance.currentUser!.email)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState != ConnectionState.waiting) {
                  var data = snapshot.data!.docs;
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: Container(
                                        height: size.height * .25,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 30),
                                            CustomTxt(
                                                txt:
                                                    "Are you sure to delete this order?",
                                                clr: Colors.black,
                                                size: 19,
                                                fnt_wght: FontWeight.bold),
                                            const SizedBox(height: 60),
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Btn(
                                                    hgt: 37.0,
                                                    wdgt: 100.0,
                                                    txt: "Cancel",
                                                    color1: Color(0xffC59DF4),
                                                    color2: Color(0xffA150FF),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  InkWell(
                                                    onTap: () {
                                                      deleteorder(snapshot.data
                                                          ?.docs[index].id);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Btn(
                                                      hgt: 37.0,
                                                      wdgt: 100.0,
                                                      txt: "Delete",
                                                      color1: Color(0xffC59DF4),
                                                      color2: Color(0xffA150FF),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: InkWell(
                              onTap: () {
                                Get.to(const Order());
                              },
                              child: CustomContainer(
                                hight: size.height * .12,
                                width: size.width,
                                pdng: const EdgeInsets.only(left: 20, top: 35),
                                color1: const Color(0xffC59DF4),
                                color2: const Color(0xffA150FF),
                                borderradius: BorderRadius.circular(15),
                                chld: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTxt(
                                      txt: data[index]['order number'],
                                      clr: Colors.white,
                                      fnt_wght: FontWeight.w500,
                                      size: 20,
                                    ),
                                    CustomTxt(
                                      txt: data[index]['name'],
                                      clr: Colors.white,
                                      fnt_wght: FontWeight.w500,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(
                      child: CustomTxt(
                          txt: "No order Exists",
                          clr: Colors.black,
                          size: 20,
                          fnt_wght: FontWeight.bold));
                }
              }),
        ),
      ),
    );
  }
}
