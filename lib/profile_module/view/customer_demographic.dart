import 'package:flutter/material.dart';
import 'package:time_link_shehroz/profile_module/model/bar_chart.dart';
import 'package:time_link_shehroz/profile_module/view/profile_view.dart';
import 'package:time_link_shehroz/utils/custom_appbar.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:time_link_shehroz/utils/custom_container.dart';
import 'package:time_link_shehroz/utils/custom_textfield.dart';
import 'package:time_link_shehroz/utils/custom_txt.dart';

class CustomerDemographic extends StatefulWidget {
  const CustomerDemographic({Key? key}) : super(key: key);

  @override
  State<CustomerDemographic> createState() => _CustomerDemogaraphicsState();
}

class _CustomerDemogaraphicsState extends State<CustomerDemographic> {
  String? subscription;
  final List<BarChartModel> data = [
    BarChartModel(
      age: "90",
      number: 10,
      color: charts.ColorUtil.fromDartColor(const Color(0xffA150FF)),
    ),
    BarChartModel(
      age: "80",
      number: 20,
      color: charts.ColorUtil.fromDartColor(const Color(0xffA150FF)),
    ),
    BarChartModel(
      age: "70",
      number: 30,
      color: charts.ColorUtil.fromDartColor(const Color(0xffA150FF)),
    ),
    BarChartModel(
      age: "60",
      number: 40,
      color: charts.ColorUtil.fromDartColor(const Color(0xffA150FF)),
    ),
    BarChartModel(
      age: "50",
      number: 50,
      color: charts.ColorUtil.fromDartColor(const Color(0xffA150FF)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModel series, _) => series.age,
        measureFn: (BarChartModel series, _) => series.number,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
          title: "Customer demographic",
          icon: Icons.arrow_back_ios,
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
          }),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            const SizedBox(height: 27),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Spacer(),
                Radio(
                  value: "Age Group",
                  groupValue: subscription,
                  onChanged: (value) {
                    setState(() {
                      subscription = value.toString();
                    });
                  },
                  fillColor: MaterialStateColor.resolveWith(
                    (states) => const Color(0xffA354FE),
                  ),
                ),
                const Text(
                  "Age Group",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Radio(
                  value: "Gender",
                  groupValue: subscription,
                  onChanged: (value) {
                    setState(() {
                      subscription = value.toString();
                    });
                  },
                  fillColor: MaterialStateColor.resolveWith(
                    (states) => const Color(0xffA354FE),
                  ),
                ),
                const Text(
                  "Gender",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
              ],
            ),
            //const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 68),
              child: SizedBox(
                height: 300,
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: CustomContainer(
                  hight: size.height * .30,
                  width: size.width,
                  chld: Column(
                    children: [
                      const SizedBox(height: 23),
                      CustomTxt(
                          txt: "List of Customer",
                          clr: const Color(0xffFFFFFF),
                          size: 20,
                          fnt_wght: FontWeight.w700),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Row(
                          children: [
                            CustomTxt(
                                txt: "Name",
                                clr: const Color(0xffffffff),
                                size: 20,
                                fnt_wght: FontWeight.w400),
                            const Spacer(),
                            CustomTxt(
                                txt: "Total visit list",
                                clr: const Color(0xffffffff),
                                size: 20,
                                fnt_wght: FontWeight.w400)
                          ],
                        ),
                      ),
                      Row(
                        children: const [
                          Expanded(child: CustomTextFieldNoBorder()),
                          Spacer(),
                          Expanded(child: CustomTextFieldNoBorder()),
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(child: CustomTextFieldNoBorder()),
                          Spacer(),
                          Expanded(child: CustomTextFieldNoBorder()),
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(child: CustomTextFieldNoBorder()),
                          Spacer(),
                          Expanded(child: CustomTextFieldNoBorder()),
                        ],
                      ),
                    ],
                  ),
                  color1: const Color(0xffC59DF4),
                  color2: const Color(0xffA150FF),
                  borderradius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
            )
          ],
        ),
      ),
    );
  }
}
