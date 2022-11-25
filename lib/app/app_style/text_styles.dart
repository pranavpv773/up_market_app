import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextstyles {
  static String? fontFamily = GoogleFonts.notoSans().fontFamily;

  static TextStyle h1 = TextStyle(
    fontFamily: GoogleFonts.sofia().fontFamily,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w800,
    fontSize: 34.sp,
  );
  static TextStyle darkH1 = TextStyle(
    fontFamily: GoogleFonts.heebo().fontFamily,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w800,
    fontSize: 34.sp,
  );
  static TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );

  static TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    overflow: TextOverflow.ellipsis,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );

  static TextStyle h4 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );
  static TextStyle h5 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
  );
}
