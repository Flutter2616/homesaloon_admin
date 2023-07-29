import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homesaloon_admin/modal/profilemodal.dart';
import 'package:homesaloon_admin/utils/share_preference.dart';
import 'package:sizer/sizer.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

//6440FE
class _ProfilescreenState extends State<Profilescreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtnumber = TextEditingController();
  TextEditingController txtaddress = TextEditingController();
  TextEditingController txtdate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: OutlinedButton(
            onPressed: () {
              Sharepre share=Sharepre();
              Profilemodal modal = Profilemodal(
                  name: txtname.text,
                  address: txtaddress.text,
                  date: txtdate.text,
                  number: txtnumber.text);
              share.set_personaldata(modal);
              Get.offAllNamed("dash");
            },
            child: Text("Save Profile",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            style:
                OutlinedButton.styleFrom(backgroundColor: Color(0xff6440FE))),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                "Personal detail",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp),
              ),
              const SizedBox(height: 10),
              textfield(txtname, "Full name", TextInputType.name),
              const SizedBox(height: 10),
              textfield(txtnumber, "number", TextInputType.number),
              const SizedBox(height: 10),
              textfield(
                  txtaddress, "Full address", TextInputType.streetAddress),
              const SizedBox(height: 10),
              textfield(txtdate, "date of birth", TextInputType.number),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  TextField textfield(
      TextEditingController controller, String title, TextInputType input) {
    return TextField(
      controller: controller,
      keyboardType: input,
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
}
