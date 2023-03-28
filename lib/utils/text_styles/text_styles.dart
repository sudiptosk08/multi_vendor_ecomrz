import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/app_colors.dart';

const FontWeight _light = FontWeight.w300;
const FontWeight _regular = FontWeight.w400;
const FontWeight _medium = FontWeight.w500;
const FontWeight _bold = FontWeight.w700;
const FontWeight _extraBold = FontWeight.w900;
TextStyle _poppins = GoogleFonts.poppins();
TextStyle _rubik = GoogleFonts.rubik();
TextStyle _ptSans = GoogleFonts.ptSans();

// Naming: Camelcase
// FontWeight..fontclass..Size..Color
// normal18Red3c

class TextStyles {
  static TextStyle appBarText = _poppins.copyWith(
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontSize: 18,
  );
  static TextStyle mediumPoppins24white = _poppins.copyWith(
    fontWeight: _medium,
    color: AppColors.white,
    fontSize: 20,
  );

  static TextStyle bodyText1 = _poppins.copyWith(
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontSize: 15,
  );

  static TextStyle bodyText2 = _poppins.copyWith(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 14,
  );
  static TextStyle bodyText3 = _poppins.copyWith(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 13,
  );
  static TextStyle subTitle = _poppins.copyWith(
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontSize: 16,
  );
}
