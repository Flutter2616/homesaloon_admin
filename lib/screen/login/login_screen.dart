import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesaloon_admin/controller/dash_controller.dart';
import 'package:homesaloon_admin/utils/admin_login.dart';
import 'package:homesaloon_admin/utils/share_preference.dart';
import 'package:sizer/sizer.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  Dashcontroller controller=Get.put(Dashcontroller());
  TextEditingController txtemail=TextEditingController();
  TextEditingController txtpassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100.w,
                height: 20.h,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Welcome Back!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1)),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text("Don’t have an account? ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1)),
                        InkWell(onTap: () {
                          Get.offAllNamed("signup");
                        },
                          child: Text("SignUp",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff6440FE),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(controller: txtemail,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: Colors.black),
                          hintText: "Enter Email",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                              borderSide: BorderSide(color: Color(0xff6440FE)))),
                    ),
                    const SizedBox(height: 30),
                    TextField(controller: txtpassword,
                      obscureText: true,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          labelText: "password",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: Colors.black),
                          hintText: "Enter password",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                              borderSide: BorderSide(color: Color(0xff6440FE)))),
                    ),
                    const SizedBox(height: 30),
                    InkWell(onTap: () async {
                      String msg = "";
                      msg =await Firebasehelper.helper
                          .manul_login(txtemail.text, txtpassword.text);
                      Get.snackbar("$msg", "",
                          isDismissible: true,
                          snackStyle: SnackStyle.FLOATING,
                          borderRadius: 10.sp,
                          colorText: Colors.white,
                          backgroundColor: msg=='success'?Colors.green.shade600:Colors.red.shade600,
                          snackPosition: SnackPosition.BOTTOM);
                      if(msg=="success")
                      {Sharepre share=Sharepre();
                        controller.profile['status']==null?Get.offAllNamed('profile'):Get.offAllNamed('dash');
                      }
                    },
                      child: Container(
                        height: 6.h,
                        width: 100.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xff6440FE),
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                        child: Text("Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot your Password?",
                        style: TextStyle(
                            color: Color(0xff6440FE),
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//0xff6440FE
