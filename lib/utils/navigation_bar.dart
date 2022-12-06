import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_link_shehroz/home_module/components/Dialogbox.dart';
import 'package:time_link_shehroz/home_module/view/home_view.dart';
import 'package:time_link_shehroz/home_module/view/scan_device.dart';
import 'package:time_link_shehroz/order_module/view/completed_order_view.dart';
import 'package:time_link_shehroz/profile_module/view/profile_view.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  List<Widget> screens = [
    const Home(),
    const CompletedOrders(),
    const ScanDevice(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(children: [
        BottomNavigationBar(
            unselectedLabelStyle:
                const TextStyle(color: Color(0xff1D2733), fontSize: 10),
            selectedItemColor: const Color(0xffA150FF),
            unselectedItemColor: const Color(0xffC1C2C8),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            iconSize: 40,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.house_fill),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.doc),
                label: "Completed Orders",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.qrcode_viewfinder),
                label: "Scan Qr",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: "Profile",
              )
            ]),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return DialogBox();
              });
        },
        child: Container(
          height: 61,
          width: 61,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xffC297F5), Color(0xffA355FE)],
            ),
          ),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
