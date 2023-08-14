import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homesaloon_admin/controller/service_controller.dart';
import 'package:homesaloon_admin/modal/service_modal.dart';
import 'package:homesaloon_admin/utils/firestorehelper.dart';
import 'package:sizer/sizer.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Servicescreen extends StatefulWidget {
  const Servicescreen({super.key});

  @override
  State<Servicescreen> createState() => _ServicescreenState();
}

class _ServicescreenState extends State<Servicescreen> {
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
            "My service",
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          Flexible(
            child: StreamBuilder(
              stream: Firestorehelper.helper.readdata(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else if (snapshot.hasData) {
                  QuerySnapshot qs = snapshot.data!;
                  List<QueryDocumentSnapshot> querylist = qs.docs;
                  // print("snapshotdata: ${qs.size}==========******");
                  controller.servicelist.clear();
                  Map m1 = {};

                  for (var x in querylist) {
                    String id = x.id;
                    m1 = x.data() as Map;
                    Servicemodal service = Servicemodal(
                      name: m1['detail'],
                      type: m1['type'],
                      img: m1['img'],
                      offer: m1['offer'],
                      price: m1['price'],
                      desc: m1['description'],
                      time: m1['time'],
                      gender: m1['gender'],
                      id: id,
                    );
                    controller.servicelist.add(service);
                  }
                  // print("list: ${controller.servicelist}==========******");
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        // height: 10.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Colors.white),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage(
                                    "${controller.servicelist[index].img}"),
                                radius: 15.sp),
                            const SizedBox(width: 15),
                            Container(
                              width: 50.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("${controller.servicelist[index].name}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                          color: Colors.black)),
                                  const SizedBox(height: 5),
                                  Text("\$${controller.servicelist[index].price}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          color: Colors.black)),
                                  const SizedBox(height: 5),
                                  Text(
                                      "Description:${controller.servicelist[index].desc}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp,
                                          color: Colors.black)),
                                  const SizedBox(height: 5),
                                  Text(
                                      "Duration:${controller.servicelist[index].time}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp,
                                          color: Colors.black)),
                                  const SizedBox(height: 5),
                                  Text(
                                      "Offer:${controller.servicelist[index].offer}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp,
                                          color: Colors.black)),
                                  const SizedBox(height: 5),
                                  Text(
                                      "service id:${controller.servicelist[index].id}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp,
                                          color: Colors.black)),
                                ],
                              ),
                            ),
                            Spacer(),
                            Builder(
                              builder: (context) {
                                return PopupMenuButton(
                                  onSelected: (value) {
                                    if (value == 'update') {
                                      Get.toNamed(
                                          controller.servicelist[index].type ==
                                                  "package"
                                              ? "package"
                                              : "add",
                                          arguments: {
                                            "status": 1,
                                            "index": index
                                          });
                                    }
                                  },
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        onTap: () {
                                          Firestorehelper.helper.delete(
                                              "${controller.servicelist[index].id}");
                                        },
                                        value: "delete",
                                        child: Text("Delete"),
                                      ),
                                      PopupMenuItem(
                                        onTap: () {},
                                        value: "update",
                                        child: Text("update"),
                                      )
                                    ];
                                  },
                                );
                              }
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: controller.servicelist.length,
                  );
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
