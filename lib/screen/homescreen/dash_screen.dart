import 'package:custom_floating_action_button/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homesaloon_admin/controller/dash_controller.dart';
import 'package:homesaloon_admin/screen/sub_screen/home_screen.dart';
import 'package:homesaloon_admin/screen/sub_screen/order_screen.dart';
import 'package:homesaloon_admin/screen/sub_screen/service_screen.dart';
import 'package:homesaloon_admin/utils/admin_login.dart';
import 'package:sizer/sizer.dart';

class Dashscreen extends StatefulWidget {
  const Dashscreen({super.key});

  @override
  State<Dashscreen> createState() => _DashscreenState();
}

//6440FE
class _DashscreenState extends State<Dashscreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Dashcontroller controller = Get.put(Dashcontroller());
  Map userdetail = {};

  @override
  void initState() {
    super.initState();
    userdetail = Firebasehelper.helper.userdetail();
  }

  Dashcontroller dash = Get.put(Dashcontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomFloatingActionButton(
        floatinButtonColor: Color(0xff6440FE),
        barrierDismissible: false,
        type: CustomFloatingActionButtonType.verticalUp,
        openFloatingActionButton: const Icon(Icons.add, color: Colors.white),
        closeFloatingActionButton: const Icon(Icons.close, color: Colors.white),
        options: [
          InkWell(
            onTap: () {
              Get.toNamed("package", arguments: {"status": 0, "index": null});
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: Color(0xff6440FE)),
              child: Text("Add package",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed("add", arguments: {"status": 0, "index": null});
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: Color(0xff6440FE)),
              child: Text("Add service",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        ],
        body: Scaffold(
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              elevation: 0,
              selectedFontSize: 11.sp,
              unselectedFontSize: 10.sp,
              selectedItemColor: Colors.black,
              unselectedLabelStyle:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
              selectedLabelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 15.sp, color: Colors.grey),
                  activeIcon:
                      Icon(Icons.home, size: 18.sp, color: Color(0xff6440FE)),
                  label: "Dashboard",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_repair_service,
                      size: 15.sp, color: Colors.grey),
                  activeIcon: Icon(Icons.home_repair_service,
                      size: 18.sp, color: Color(0xff6440FE)),
                  label: "Service",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart,
                      size: 15.sp, color: Colors.grey),
                  activeIcon: Icon(Icons.shopping_cart,
                      size: 18.sp, color: Color(0xff6440FE)),
                  label: "Order",
                ),
              ],
              backgroundColor: Colors.white,
              currentIndex: dash.pageindex.value,
              onTap: (value) {
                dash.pageindex.value = value;
              },
            ),
          ),
          key: _scaffoldKey,
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                icon: Icon(Icons.menu, color: Color(0xff000000), size: 18.sp)),
            backgroundColor: Color(0xffffffff),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/image/logo.png",
                    fit: BoxFit.cover, width: 60.w, height: 10.w),
                Text(
                  "Partner",
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            width: 60.w,
            backgroundColor: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 25.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  color: Color(0xff6440FE),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          child: Icon(Icons.person,
                              size: 20.sp, color: Colors.black),
                          radius: 30.sp,
                          backgroundColor: Colors.white),
                      const SizedBox(height: 10),
                      Text("${controller.profile['name']}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: Icon(Icons.perm_identity_outlined,
                          color: Colors.black, size: 18.sp),
                      tileColor: Colors.white,
                      title: Text("Profile",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(height: 5),
                    ListTile(
                      leading: Icon(Icons.settings_outlined,
                          color: Colors.black, size: 18.sp),
                      tileColor: Colors.white,
                      title: Text("Setting",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(height: 5),
                    ListTile(
                      leading: Icon(Icons.account_balance_outlined,
                          color: Colors.black, size: 18.sp),
                      tileColor: Colors.white,
                      title: Text("Account",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(height: 5),
                    ListTile(
                      onTap: () {
                        Firebasehelper.helper.logout();
                        Get.offAllNamed("login");
                      },
                      leading:
                          Icon(Icons.logout, color: Colors.black, size: 18.sp),
                      tileColor: Colors.white,
                      title: Text("Logout",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Obx(
            () => IndexedStack(
              index: dash.pageindex.value,
              children: [
                Homescreen(),
                Servicescreen(),
                Orderscreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
