import 'dart:async';

import 'package:flutter/material.dart';
import 'package:time_link_shehroz/home_module/view/home_view.dart';
import 'package:time_link_shehroz/utils/custom_appbar.dart';
import 'package:time_link_shehroz/utils/custom_container.dart';
import 'package:time_link_shehroz/utils/custom_txt.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  static var countdownDuration = const Duration(minutes: 10);
  static var countdownDuration1 = const Duration(minutes: 10);
  Duration duration = const Duration();
  Duration duration1 = const Duration();
  Timer? timer;
  Timer? timer1;
  bool countDown = true;
  bool countDown1 = true;

  @override
  void initState() {
    int hours;
    int mints;
    int secs;
    hours = int.parse("00");
    mints = int.parse("00");
    secs = int.parse("00");
    countdownDuration = Duration(hours: hours, minutes: mints, seconds: secs);
    startTimer();
    reset();
    int hours1;
    int mints1;
    int secs1;
    hours1 = int.parse("10");
    mints1 = int.parse("00");
    secs1 = int.parse("00");
    countdownDuration1 =
        Duration(hours: hours1, minutes: mints1, seconds: secs1);
    startTimer1();
    reset1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: CustomAppBar(
            icon: Icons.arrow_back_ios,
            title: "Order",
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            }),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                height: size.height * .76,
                width: size.width,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 34,
                      ),
                      const Text(
                        "Timer",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 24, bottom: 30),
                          child: _buildTime()),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          CustomContainer(
                              hight: 49.0,
                              width: size.width * .35,
                              borderradius: BorderRadius.circular(15),
                              color1: const Color(0xffC59DF4),
                              color2: const Color(0xffA150FF),
                              chld: Center(
                                child: CustomTxt(
                                    txt: "30 minute left",
                                    clr: Colors.white,
                                    size: 15,
                                    fnt_wght: FontWeight.w500),
                              )),
                          const Spacer(),
                          CustomContainer(
                              hight: 49.0,
                              width: size.width * .35,
                              borderradius: BorderRadius.circular(15),
                              color1: const Color(0xffC59DF4),
                              color2: const Color(0xffA150FF),
                              chld: Center(
                                child: CustomTxt(
                                    txt: "15 minute left",
                                    clr: Colors.white,
                                    size: 15,
                                    fnt_wght: FontWeight.w500),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                      Row(
                        children: [
                          CustomContainer(
                              hight: 49.0,
                              width: size.width * .35,
                              borderradius: BorderRadius.circular(15),
                              color1: const Color(0xffC59DF4),
                              color2: const Color(0xffA150FF),
                              chld: Center(
                                child: CustomTxt(
                                    txt: "5 minute left",
                                    clr: Colors.white,
                                    size: 15,
                                    fnt_wght: FontWeight.w500),
                              )),
                          const Spacer(),
                          CustomContainer(
                              hight: 49.0,
                              width: size.width * .35,
                              borderradius: BorderRadius.circular(15),
                              color1: const Color(0xffC59DF4),
                              color2: const Color(0xffA150FF),
                              chld: Center(
                                child: CustomTxt(
                                    txt: "2 minute left",
                                    clr: Colors.white,
                                    size: 15,
                                    fnt_wght: FontWeight.w500),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 63,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: CustomContainer(
                            hight: 37.0,
                            width: 200.0,
                            borderradius: BorderRadius.circular(15),
                            color1: const Color(0xffC59DF4),
                            color2: const Color(0xffA150FF),
                            chld: Center(
                              child: CustomTxt(
                                  txt: "Order Ready",
                                  clr: Colors.white,
                                  size: 15,
                                  fnt_wght: FontWeight.w500),
                            )),
                      ),
                      const SizedBox(
                        height: 111,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: CustomContainer(
                              hight: 37.0,
                              width: 200.0,
                              borderradius: BorderRadius.circular(15),
                              color1: const Color(0xffC59DF4),
                              color2: const Color(0xffA150FF),
                              chld: Center(
                                child: CustomTxt(
                                    txt: "Order Qr",
                                    clr: Colors.white,
                                    size: 15,
                                    fnt_wght: FontWeight.w500),
                              ))),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      timer!.cancel();
    }
    Navigator.of(context, rootNavigator: true).pop(context);
    return true;
  }

  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = const Duration());
    }
  }

  void reset1() {
    if (countDown) {
      setState(() => duration1 = countdownDuration1);
    } else {
      setState(() => duration1 = const Duration());
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void startTimer1() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime1());
  }

  void addTime() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void addTime1() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration1.inSeconds - addSeconds;
      if (seconds < 0) {
        timer1?.cancel();
      } else {
        duration1 = Duration(seconds: seconds);
      }
    });
  }

  Widget _buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: hours, header: 'HOURS'),
      const SizedBox(
        width: 30,
      ),
      buildTimeCard(time: minutes, header: 'MINUTES'),
      const SizedBox(
        width: 30,
      ),
      buildTimeCard(time: seconds, header: 'SECONDS'),
    ]);
  }

  //

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple.withOpacity(.50),
                    Colors.purpleAccent.shade700
                  ],
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 50),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            header,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
          ),
        ],
      );
}
