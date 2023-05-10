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
  static TextStyle headline1 = _poppins.copyWith(
    fontSize: 31,
    fontWeight: FontWeight.w700,
    color: KColor.black,
  );

  static TextStyle headline2 = _poppins.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: KColor.black,
  );

  static TextStyle headline3 = _poppins.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: KColor.black,
  );

  static TextStyle headline4 = _poppins.copyWith(
    fontSize: 19,
    fontWeight: FontWeight.w700,
    color: KColor.black,
  );
  static TextStyle headline5 = _poppins.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: KColor.black,
  );

  static TextStyle headline6 = _poppins.copyWith(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: KColor.black,
  );

  static TextStyle appBarText = _poppins.copyWith(
    fontWeight: FontWeight.w600,
    color: KColor.black,
    fontSize: 16,
  );
  static TextStyle mediumPoppins24white = _poppins.copyWith(
    fontWeight: _medium,
    color: KColor.white,
    fontSize: 18,
  );

  static TextStyle bodyText1 = _poppins.copyWith(
    fontWeight: FontWeight.w500,
    color: KColor.black,
    fontSize: 13,
  );

  static TextStyle bodyText2 = _poppins.copyWith(
    fontWeight: FontWeight.w500,
    color: KColor.black,
    fontSize: 12.5,
  );
  static TextStyle bodyText3 = _poppins.copyWith(
    fontWeight: FontWeight.w500,
    color: KColor.black,
    fontSize: 12,
  );
  static TextStyle subTitle = _poppins.copyWith(
    fontWeight: FontWeight.w600,
    color: KColor.black,
    fontSize: 15,
  );
}
