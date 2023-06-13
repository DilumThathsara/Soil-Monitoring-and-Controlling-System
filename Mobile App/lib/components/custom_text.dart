import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soil_app/utils/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    this.fontSize = 30,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.center,
    this.color = AppColors.primaryColor,
    this.textOverflow,
    super.key,
  });
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final Color color;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      textHeightBehavior:
          const TextHeightBehavior(applyHeightToFirstAscent: false),
      text,
      overflow: textOverflow,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
