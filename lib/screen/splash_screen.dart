import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homesaloon_admin/controller/dash_controller.dart';
import 'package:homesaloon_admin/utils/admin_login.dart';
import 'package:homesaloon_admin/utils/share_preference.dart';
import 'package:sizer/sizer.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Dashcontroller controller=Get.put(Dashcontroller());
  bool status = false;

  @override
  void initState() {
    super.initState();
    status = Firebasehelper.helper.checkuser();
    print(status);

  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () async {
      Sharepre share=Sharepre();
      controller.profile=await share.getdata();
      print("profile staus:${controller.profile['status']}");
      status == false ? Get.offAllNamed('login') : Get.offAllNamed('dash');
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffcdc5f5),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/logo.png",
                fit: BoxFit.fill,
              ),
              Text("Partner",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp)),
              const SizedBox(height: 10),
              LoadingAnimationWidget.hexagonDots(
                  color: Color(0xff451cf1), size: 30.sp)
            ],
          ),
        ),
      ),
    );
  }
}
