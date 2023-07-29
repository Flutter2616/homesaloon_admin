import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesaloon_admin/firebase_options.dart';
import 'package:homesaloon_admin/screen/homescreen/dash_screen.dart';
import 'package:homesaloon_admin/screen/login/login_screen.dart';
import 'package:homesaloon_admin/screen/login/profile_screen.dart';
import 'package:homesaloon_admin/screen/login/signup_screen.dart';
import 'package:homesaloon_admin/screen/partner_detail_screen/detail_screen.dart';
import 'package:homesaloon_admin/screen/splash_screen.dart';
import 'package:homesaloon_admin/screen/sub_screen/add_screen.dart';
import 'package:homesaloon_admin/screen/sub_screen/home_screen.dart';
import 'package:homesaloon_admin/screen/sub_screen/order_screen.dart';
import 'package:homesaloon_admin/screen/sub_screen/package_screen.dart';
import 'package:homesaloon_admin/screen/sub_screen/service_screen.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(debugShowCheckedModeBanner: false,
        // initialRoute: "profile",
        routes: {
          '/':(context) => Splashscreen(),
          'login':(context) => Loginscreen(),
          'profile':(context) => Profilescreen(),
          'signup':(context) => Signupscreen(),
          'detail':(context) => Detailscreen(),
          'dash':(context) => Dashscreen(),
          'home':(context) => Homescreen(),
          'service':(context) => Servicescreen(),
          'order':(context) => Orderscreen(),
          'add':(context) => Addscreen(),
          'package':(context) => Packagescreen(),
        },
      ),
    ),
  );
}
