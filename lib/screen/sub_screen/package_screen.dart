import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homesaloon_admin/controller/add_controller.dart';
import 'package:homesaloon_admin/controller/service_controller.dart';
import 'package:homesaloon_admin/modal/service_modal.dart';
import 'package:homesaloon_admin/utils/firestorehelper.dart';
import 'package:sizer/sizer.dart';

class Packagescreen extends StatefulWidget {
  const Packagescreen({super.key});

  @override
  State<Packagescreen> createState() => _PackagescreenState();
}

class _PackagescreenState extends State<Packagescreen> {
  Addcontroller add = Get.put(Addcontroller());
  Servicecontroller service=Get.put(Servicecontroller());
  TextEditingController txtprice = TextEditingController();
  TextEditingController txttime = TextEditingController();
  TextEditingController txtdesc = TextEditingController();
  TextEditingController txtoffer = TextEditingController();
  Map m1=Get.arguments;
  @override
  void initState() {
    super.initState();
    txtprice=TextEditingController(text: service.servicelist[m1['index']].price);
    txttime=TextEditingController(text: service.servicelist[m1['index']].time);
    txtdesc=TextEditingController(text: service.servicelist[m1['index']].desc);
    txtoffer=TextEditingController(text: service.servicelist[m1['index']].offer);
    add.gender.value=service.servicelist[m1['index']].gender!;
    add.package_Update("${service.servicelist[m1['index']].name}");
  }
  @override
  Widget build(BuildContext context) {
    //6440FE
    return SafeArea(
      child: Scaffold(
        appBar: AppBar
          (
            elevation: 0,
            backgroundColor: Color(0xff6440FE),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: InkWell(
                  onTap: () {
                    if(m1['status']==0)
                      {
                        add.add_package();
                        Servicemodal modal = Servicemodal(
                            name: add.packagedetail,
                            desc: txtdesc.text,
                            gender: add.gender.value,
                            price: txtprice.text,
                            time: txttime.text,
                            offer: txtoffer.text);
                        Firestorehelper.helper.insert(modal, "package");
                        add.all_Clear();
                        Get.offAllNamed("dash");
                      }
                    else
                      {
                        add.add_package();
                        Servicemodal modal = Servicemodal(
                            name: add.packagedetail,
                            desc: txtdesc.text,
                            gender: add.gender.value,
                            price: txtprice.text,
                            id: service.servicelist[m1['index']].id,
                            time: txttime.text,
                            offer: txtoffer.text);
                        Firestorehelper.helper.update(modal, "package");
                        add.all_Clear();
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
              "Add Package",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      border: Border.all(color: Color(0xff6440FE), width: 2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Add Service in package",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      category("Haircut",add.haircut),
                      category("Massage",add.massage),
                      category("Haircare",add.haircare),
                      category("Shave grooming",add.shave),
                      category("Face care",add.facecare),
                      category("Hair color",add.haircolor),
                    ],
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
      ),
    );
  }

  Obx category(String title, RxBool type) {
    return Obx(
                    () => CheckboxListTile(
                      checkColor: Colors.white,
                      activeColor: Color(0xff6440FE),
                      title: Text("${title}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),
                      value: type.value,
                      onChanged: (value) {
                        type.value=value!;
                        if(value==true)
                          {
                            add.packagelist.add("$title");
                          }
                        else
                          {
                            add.packagelist.remove("$title");
                          }
                      },
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
