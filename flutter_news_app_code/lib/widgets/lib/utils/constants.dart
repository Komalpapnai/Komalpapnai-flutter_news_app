import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color black = Color(0xFF000000);
  static const Color darkGrey = Color(0xFF464646);
  static const Color lightGrey = Color(0xFFBABABA);
  static const Color textBlack = Color(0xFF212121);
  static const Color white = Color(0xFFFFFFFF);
}

class AppTypography {
  static TextStyle headlineTitle = GoogleFonts.robotoSlab(
    fontWeight: FontWeight.bold,
    fontSize: 29,
    color: AppColors.white,
  );

  static TextStyle cardTitle = GoogleFonts.robotoSlab(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColors.white,
  );

  static TextStyle cardSubtitle = GoogleFonts.robotoSlab(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    color: AppColors.lightGrey,
  );

  static TextStyle detailTitle = GoogleFonts.robotoSlab(
    fontWeight: FontWeight.bold,
    fontSize: 29,
    color: AppColors.textBlack,
  );

  static TextStyle detailSubtitle = GoogleFonts.robotoSlab(
    fontWeight: FontWeight.normal,
    fontSize: 20,
    color: AppColors.textBlack,
  );

  static TextStyle detailSource = GoogleFonts.robotoSlab(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColors.textBlack,
  );

  static TextStyle detailContent = GoogleFonts.robotoSlab(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: AppColors.lightGrey,
  );
  
  static TextStyle detailDate = GoogleFonts.robotoSlab(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: AppColors.lightGrey,
  );
}
