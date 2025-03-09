import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


const kDivider = Divider(
  color: Color(0xFFDEDEDE),
  endIndent: 20,
  indent: 20,
  thickness: 1,
);

const kSizedBox = SizedBox();
SizedBox kSizedBox2 = SizedBox(
  height: 2.h,
);
SizedBox kSizedBox4 = SizedBox(
  height: 4.h,
);
SizedBox kSizedBox5 = SizedBox(
  height: 5.h,
);
SizedBox kSizedBox8 = SizedBox(
  height: 8.h,
);
SizedBox kSizedBox10 = SizedBox(
  height: 10.h,
);
SizedBox kSizedBox12 = SizedBox(
  height: 12.h,
);
SizedBox kSizedBox14 = SizedBox(
  height: 14.h,
);
SizedBox kSizedBox15 = SizedBox(
  height: 15.h,
);
SizedBox kSizedBox16 = SizedBox(
  height: 16.h,
);
SizedBox kSizedBox18 = SizedBox(
  height: 18.h,
);
SizedBox kSizedBox20 = SizedBox(
  height: 20.h,
);
SizedBox kSizedBox22 = SizedBox(
  height: 22.h,
);
SizedBox kSizedBox24 = SizedBox(
  height: 24.h,
);
SizedBox kSizedBox25 = SizedBox(
  height: 25.h,
);
SizedBox kSizedBox30 = SizedBox(
  height: 30.h,
);
SizedBox kSizedBox32 = SizedBox(
  height: 32.h,
);
SizedBox kSizedBox35 = SizedBox(
  height: 35.h,
);
SizedBox kSizedBox40 = SizedBox(
  height: 40.h,
);
SizedBox kSizedBox42 = SizedBox(
  height: 42.h,
);
SizedBox kSizedBox50 = SizedBox(
  height: 50.h,
);
SizedBox kSizedBox71 = SizedBox(
  height: 71.h,
);

SizedBox kSizedW3 = SizedBox(
  width: 3.w,
);
SizedBox kSizedW5 = SizedBox(
  width: 5.w,
);
SizedBox kSizedW6 = SizedBox(
  width: 6.w,
);
SizedBox kSizedW7 = SizedBox(
  width: 7.w,
);
SizedBox kSizedW10 = SizedBox(
  width: 10.w,
);
SizedBox kSizedW12 = SizedBox(
  width: 12.w,
);
SizedBox kSizedW15 = SizedBox(
  width: 15.w,
);
SizedBox kSizedW20 = SizedBox(
  width: 20.w,
);
SizedBox kSizedW24 = SizedBox(
  width: 24.w,
);
SizedBox kSizedW30 = SizedBox(
  width: 30.w,
);
SizedBox kSizedW100 = SizedBox(
  width: 100.w,
);
TextStyle columnHeadTextStyle = getTextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w500,
);

TextStyle getTextStyle({
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,

}) {
  return GoogleFonts.getFont('Poppins',
      color: color,
      fontSize: fontSize,
    
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration);
}

TextStyle rowDataTextSTyle = getTextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
);
Color tableHeaderBgColor = Colors.grey[100]!;

///Icon Size
double eyeSize = 16;

///Container Common Margin
EdgeInsets commonPageMargin = const EdgeInsets.all(16);

///Common Page Padding
EdgeInsets commonPagePadding =
    const EdgeInsets.symmetric(horizontal: 25, vertical: 20);

///Common Box Decoration
BoxDecoration commonBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(8),
  boxShadow: <BoxShadow>[
    BoxShadow(
        color: Colors.black.withOpacity(.05),
        offset: const Offset(1, 1),
        spreadRadius: 2,
        blurRadius: 10),
  ],
  color: Colors.white,
);

///Common Table Boarder Color
Color commonTableBorderColor = Colors.grey[300]!;

///Common Box Decoration
BoxDecoration commonTableBoxDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: commonTableBorderColor),
  borderRadius: BorderRadius.circular(14),
);

///Title Style For TExt Field
TextStyle textfieldTitleStyle = getTextStyle(
    color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500);

///Hint Style
TextStyle textfieldHintStyle = getTextStyle(
  color: Colors.grey,
  fontSize: 13,
);

///Heading Text Style
TextStyle headingTextstyle = getTextStyle(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.w600,
  
);

///Common Divider
Divider commonDivider = Divider(
  color: Colors.grey[200] ?? Colors.grey,
  height: 0,
);

///popup Boarder Radius
double popupBorderRadius = 25;

///Table Date Format
String tableDateFormat = 'dd/MMM/yy';
Widget commonDialogFooterDivider = Column(
  children: [
    kSizedBox30,
    Divider(color: Colors.grey[350], height: 0),
    kSizedBox5
  ],
);

Widget commonDialogHeaderDivider = const Column(
  children: [
    Divider(thickness: 1, height: 0),
    SizedBox(height: 20),
  ],
);
