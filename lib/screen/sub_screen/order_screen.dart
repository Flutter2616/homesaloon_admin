import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homesaloon_admin/controller/service_controller.dart';
import 'package:homesaloon_admin/modal/order_modal.dart';
import 'package:homesaloon_admin/modal/service_modal.dart';
import 'package:homesaloon_admin/utils/admin_login.dart';
import 'package:homesaloon_admin/utils/firestorehelper.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

class Orderscreen extends StatefulWidget {
  const Orderscreen({super.key});

  @override
  State<Orderscreen> createState() => _OrderscreenState();
}

class _OrderscreenState extends State<Orderscreen> {
  Servicecontroller controller = Get.put(Servicecontroller());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            "My Order",
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          Flexible(
            child: StreamBuilder(
              stream: Firestorehelper.helper.read_order(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else if (snapshot.hasData) {
                  QuerySnapshot qs = snapshot.data!;
                  List<QueryDocumentSnapshot> querylist = qs.docs;
                  // print("snapshotdata: ${qs.size}==========******");
                  Map m1 = {};
                  controller.orderlist.clear();
                  for (var x in querylist) {
                    String id = x.id;
                    print("id:${m1['id']}");
                    m1 = x.data() as Map;
                    Ordermodal order = Ordermodal(
                      name: m1['detail'],
                      qty: m1['qty'],
                      servicetime: m1['servicetime'],
                      status: m1['status'],
                      type: m1['type'],
                      img: m1['img'],
                      offer: m1['offer'],
                      price: m1['price'],
                      desc: m1['description'],
                      time: m1['time'],
                      gender: m1['gender'],
                      address: m1['address'],
                      id: id,
                    );
                    controller.orderlist.add(order);
                  }
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: ExpansionTile(
                            title: Text(
                                controller.orderlist[index].type == "package"
                                    ? "Package"
                                    : "${controller.orderlist[index].name}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500)),
                            subtitle: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    "\$${controller.orderlist[index].price}*${controller.orderlist[index].qty}qty",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(width: 10),
                                Text(
                                    "\$${controller.orderlist[index].price! * controller.orderlist[index].qty!}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            trailing: Text(
                                "${controller.orderlist[index].status}",
                                style: TextStyle(
                                    color: controller.orderlist[index].status ==
                                            "complate"
                                        ? Colors.green
                                        : Colors.red,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500)),
                            expandedAlignment: Alignment.topLeft,
                            maintainState: true,
                            childrenPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            collapsedBackgroundColor: Colors.white,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Client: ${controller.orderlist[index].address!['name']}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                      "Address: ${controller.orderlist[index].address!['address']}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                      "pincode: ${controller.orderlist[index].address!['pincode']}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                      "Phone Number: ${controller.orderlist[index].address!['phonenumber']}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(onTap: () {
                                          Firestorehelper.helper.order_delete("${controller.orderlist[index].id}");
                                        },
                                          child: Container(
                                            height: 4.h,
                                            width: 25.w,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.sp),
                                                color: Colors.red),
                                            child: Text("Cancel",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500)),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          height: 4.h,
                                          width: 25.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.sp),
                                              color: Colors.green),
                                          child: Text("Confirm",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: controller.orderlist.length);
                }
                return Center(
                  child: LoadingAnimationWidget.hexagonDots(
                      color: Color(0xff451cf1), size: 30.sp),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
