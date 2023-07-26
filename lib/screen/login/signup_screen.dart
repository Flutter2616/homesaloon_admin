import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesaloon_admin/utils/admin_login.dart';
import 'package:sizer/sizer.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

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
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: Color(0xff6440FE),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("SignUp",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1)),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text("Already have an Account? ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1)),
                        InkWell(
                          onTap: () {
                            Get.offAllNamed("login");
                          },
                          child: Text("Login",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
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
                    TextField(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: Colors.black),
                          hintText: "Enter Username",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                              borderSide:
                              BorderSide(color: Color(0xff6440FE)))),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: txtemail,
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
                              borderSide:
                              BorderSide(color: Color(0xff6440FE)))),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: txtpassword,
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
                              borderSide:
                              BorderSide(color: Color(0xff6440FE)))),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () async {
                        String msg = "";
                        msg =await Firebasehelper.helper
                            .manul_register(txtemail.text, txtpassword.text);
                        Get.snackbar("$msg", "",
                            isDismissible: true,
                            snackStyle: SnackStyle.FLOATING,
                            borderRadius: 10.sp,
                            colorText: Colors.white,
                            backgroundColor: msg=='success'?Colors.green.shade600:Colors.red.shade600,
                            snackPosition: SnackPosition.BOTTOM);
                        if(msg=='success')
                        {
                          Get.offAllNamed('login');
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
                        child: Text("Signup",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500)),
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
