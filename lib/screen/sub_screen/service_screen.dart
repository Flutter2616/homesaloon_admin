import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Servicescreen extends StatefulWidget {
  const Servicescreen({super.key});

  @override
  State<Servicescreen> createState() => _ServicescreenState();
}

class _ServicescreenState extends State<Servicescreen> {
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
          Container(
            height: 10.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: Colors.white),
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.sports_cricket),
                    radius: 15.sp),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Haircut djhfj shf",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Colors.black)),
                    const SizedBox(height: 5),
                    Text("Haircut djhfj shf",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            color: Colors.black)),
                  ],
                ),
                Spacer(),
                Row(mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("\$57",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Colors.black)),
                    const SizedBox(height: 5),
                    PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: "delete",
                            child: Text("Delete"),
                          ),
                          PopupMenuItem(
                            value: "update",
                            child: Text("update"),
                          )
                        ];
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
