import 'package:api_bloc/constant/text/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget loginText(String title,FontWeight fontWeight,double fontsize,Color color,double spacing){
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(title,style: TextStyle(
      fontWeight: fontWeight,
      letterSpacing: spacing,
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: fontsize,
      color:  color
    )),
  );
}
Widget customTextField(
    TextEditingController controller,TextInputType inputType,
    bool hide,String title,
    IconData iconData,String type,
    VoidCallback eyeClick
    ){
  return Container(
    height: 50.h,
    width: double.infinity.w,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.amber,width: 1.2.w),
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: hide,
      style: TextStyle(
        color: Colors.white,
         fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15.0),
        border:  InputBorder.none,
        hintText: title,
        hintStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
        prefixIcon: type == "register"?IconButton(onPressed: eyeClick,icon: hide == true ? Icon(CupertinoIcons.eye_slash,color: Colors.white,):Icon(CupertinoIcons.eye_fill,color: Colors.white,)):null,
        //Icon(iconData,color: Colors.white),
      suffixIcon: type != "register"?Icon(iconData,color: Colors.white,):null
      ),
    ),
  );
}
Widget customButton(String title,VoidCallback callback){
  return InkWell(
    onTap: callback,
    child: Container(
      height: 50.h,
      width: 240.w,
      decoration: BoxDecoration(
        border: Border.all(width: 1.2.w,color: Colors.white),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(
        child: Text(title,style: TextStyle(
          color: Colors.amber,
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.poppins().fontFamily,
          letterSpacing: 2,
        ),),
      ),
    ),
  );
}