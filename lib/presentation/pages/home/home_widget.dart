import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppBar(String title, Color backcolor, Color titColor,VoidCallback ontap) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        color: titColor,
        letterSpacing: 2,
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 26.sp,
      ),
    ),
    centerTitle: true,
    backgroundColor: backcolor,
    elevation: 2.0,
    actions: [
      InkWell(
        onTap: ontap,
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
          ),
          child: Center(
            child: Icon(FeatherIcons.logOut),
          ),
        ),
      )
    ],
  );
}
