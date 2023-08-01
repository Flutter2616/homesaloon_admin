import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homesaloon_admin/controller/add_controller.dart';
import 'package:homesaloon_admin/controller/service_controller.dart';
import 'package:homesaloon_admin/modal/service_modal.dart';
import 'package:homesaloon_admin/utils/firestorehelper.dart';
import 'package:sizer/sizer.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({super.key});

  @override
  State<Addscreen> createState() => _AddscreenState();
}

//6440FE
class _AddscreenState extends State<Addscreen> {
  Addcontroller add = Get.put(Addcontroller());
  Servicecontroller service = Get.put(Servicecontroller());
  TextEditingController txtprice = TextEditingController();
  TextEditingController txttime = TextEditingController();
  TextEditingController txtdesc = TextEditingController();
  TextEditingController txtoffer = TextEditingController();
  Map m1 = Get.arguments;

  @override
  void initState() {
    super.initState();
    if(m1['status']==1)
      {
        txtprice =
            TextEditingController(text: service.servicelist[m1['index']].price);
        txttime =
            TextEditingController(text: service.servicelist[m1['index']].time);
        txtoffer =
            TextEditingController(text: service.servicelist[m1['index']].offer);
        txtdesc =
            TextEditingController(text: service.servicelist[m1['index']].desc);
        add.service!.value = service.servicelist[m1['index']].name!;
        add.gender.value = service.servicelist[m1['index']].gender!;
      }
    else
    {
      add.all_Clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xff6440FE),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: InkWell(
                  onTap: () {
                    if (m1['status'] == 0) {
                      Servicemodal modal = Servicemodal(
                          name: add.service!.value,
                          desc: txtdesc.text,
                          gender: add.gender.value,
                          price: txtprice.text,
                          time: txttime.text,
                          offer: txtoffer.text);
                      Firestorehelper.helper.insert(modal, "service");
                      Get.offAllNamed("dash");
                    } else {
                      Servicemodal modal = Servicemodal(
                          name: add.service!.value,
                          desc: txtdesc.text,
                          gender: add.gender.value,
                          price: txtprice.text,
                          id: service.servicelist[m1['index']].id,
                          time: txttime.text,
                          offer: txtoffer.text);
                      Firestorehelper.helper.update(modal, "service");
                      Get.offAllNamed("dash");
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: Color(0xff6440FE),
                      size: 15.sp,
                    ),
                  ),
                ),
              )
            ],
            title: Text(
              "Add service",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Container(
                height: 7.h,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    border: Border.all(color: Color(0xff6440FE), width: 2)),
                child: Obx(
                  () => DropdownButton(
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(10.sp),
                    hint: Text(
                      "Select service type",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: Colors.black),
                    ),
                    underline: Container(),
                    value: add.service!.value,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: Colors.black),
                    items: [
                      DropdownMenuItem(
                        child: Text("Haircut"),
                        value: "Haircut",
                      ),
                      DropdownMenuItem(
                        child: Text("Face care"),
                        value: "Facecare",
                      ),
                      DropdownMenuItem(
                        child: Text("Hair color"),
                        value: "Haircolor",
                      ),
                      DropdownMenuItem(
                        child: Text("Shave grooming"),
                        value: "Shaving",
                      ),
                      DropdownMenuItem(
                        child: Text("Massage"),
                        value: "Massage",
                      ),
                      DropdownMenuItem(
                        child: Text("Haircare"),
                        value: "Haircare",
                      ),
                    ],
                    onChanged: (value) {
                      add.service!.value = value!;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  rediobutton("Man"),
                  rediobutton("Kids"),
                ],
              ),
              const SizedBox(height: 10),
              textfield(txtprice, "price"),
              const SizedBox(height: 10),
              textfield(txttime, "time"),
              const SizedBox(height: 10),
              textfield(txtdesc, "description"),
              const SizedBox(height: 10),
              textfield(txtoffer, "offer"),
            ],
          ),
        ),
      ),
    );
  }

  TextField textfield(TextEditingController controller, String title) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500),
        hintText: "$title",
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide(width: 2, color: Color(0xff6440FE))),
      ),
    );
  }

  Container rediobutton(String title) {
    return Container(
      width: 40.w,
      child: Obx(
        () => RadioListTile(
            activeColor: Color(0xff6440FE),
            value: "${title}",
            groupValue: add.gender.value,
            onChanged: (value) {
              add.gender.value = value!;
            },
            title: Text(
              "${title}",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                  color: Colors.black),
            )),
      ),
    );
  }
}
