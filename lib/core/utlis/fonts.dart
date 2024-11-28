import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(
    {required Color color,
    required FontWeight fontweight,
    required double fontsize}) {
  return GoogleFonts.montserrat(
      color: color, fontWeight: fontweight, fontSize: fontsize);
}
