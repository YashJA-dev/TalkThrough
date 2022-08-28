import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle montserratStyle(
    {required double size,
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black}) {
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontWeight: fontWeight,
  );
}
TextStyle damion(
    {required double size,
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black}){
 return GoogleFonts.damion(
    fontSize: size,
    color: color,
    fontWeight: fontWeight,
  );
    
}