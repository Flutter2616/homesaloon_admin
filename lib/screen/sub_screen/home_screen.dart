import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

//6440FE
class _HomescreenState extends State<Homescreen> {
  List<Map<String, dynamic>> chartlist = [
    {"domain": "january", "measure": 500},
    {"domain": "feabruary", "measure": 200},
    {"domain": "march", "measure": 700},
    {"domain": "april", "measure": 1500},
    {"domain": "may", "measure": 2000},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                wallet(
                    "\$5000", "Profit today", Color(0xff6440FE), Colors.white),
                wallet("10", "Order today", Color(0xffffffff), Colors.black),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              height: 50.h,
              width: 100.w,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: Colors.white),
              child: DChartBar(
                data: [
                  {'id': 'Bar', 'data': chartlist},
                ],
                domainLabelPaddingToAxisLine: 16,
                axisLineTick: 2,
                axisLinePointTick: 2,
                axisLinePointWidth: 10,
                axisLineColor: Colors.black,
                measureLabelPaddingToAxisLine: 16,
                barColor: (barData, index, id) => Colors.grey.shade400,
                showBarValue: true,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: 100.w,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Orders",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 5),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.sports_cricket),
                        radius: 15.sp),
                    tileColor: Colors.white,
                    title: Text("Haircut",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Colors.black)),
                    subtitle: Text("\$200",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            color: Colors.grey)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8.w,
                          height: 8.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.red.shade50),
                          child:
                              Icon(Icons.close, color: Colors.red, size: 15.sp),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 8.w,
                          height: 8.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.green.shade50),
                          child: Icon(Icons.done,
                              color: Colors.green, size: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.sports_cricket),
                        radius: 15.sp),
                    tileColor: Colors.white,
                    title: Text("Haircut",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Colors.black)),
                    subtitle: Text("men",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            color: Colors.grey)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8.w,
                          height: 8.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.red.shade50),
                          child:
                              Icon(Icons.close, color: Colors.red, size: 15.sp),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 8.w,
                          height: 8.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.green.shade50),
                          child: Icon(Icons.done,
                              color: Colors.green, size: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.sports_cricket),
                        radius: 15.sp),
                    tileColor: Colors.white,
                    title: Text("Haircut",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Colors.black)),
                    subtitle: Text("men",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            color: Colors.grey)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8.w,
                          height: 8.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.red.shade50),
                          child:
                              Icon(Icons.close, color: Colors.red, size: 15.sp),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 8.w,
                          height: 8.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.green.shade50),
                          child: Icon(Icons.done,
                              color: Colors.green, size: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.sports_cricket),
                        radius: 15.sp),
                    tileColor: Colors.white,
                    title: Text("Haircut",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Colors.black)),
                    subtitle: Text("men",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            color: Colors.grey)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8.w,
                          height: 8.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.red.shade50),
                          child:
                              Icon(Icons.close, color: Colors.red, size: 15.sp),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 8.w,
                          height: 8.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.green.shade50),
                          child: Icon(Icons.done,
                              color: Colors.green, size: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container wallet(String title, String msg, Color c, Color textcolor) {
    return Container(
      height: 10.h,
      width: 45.w,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10.sp), color: c),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$title",
              style: TextStyle(
                  color: textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp)),
          const SizedBox(height: 5),
          Text("$msg",
              style: TextStyle(
                  color: textcolor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp)),
        ],
      ),
    );
  }
}
