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
  static TextStyle mediumPoppins24Black24 = _poppins.copyWith(
    fontWeight: _medium,
    color: AppColors.black22,
    fontSize: 24,
  );
}
