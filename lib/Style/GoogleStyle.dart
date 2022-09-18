import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle montserratStyle(
    {required double size,
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black,
      bool italic = false,}) {
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontStyle: italic ? FontStyle.italic : FontStyle.normal,
    fontWeight: fontWeight,
  );
}

TextStyle damion({
  required double size,
  FontWeight fontWeight = FontWeight.w700,
  Color color = Colors.black,
  bool italic = false,
}) {
  return GoogleFonts.damion(
    fontSize: size,
    color: color,
    fontWeight: fontWeight,
    fontStyle: italic ? FontStyle.italic : FontStyle.normal,
  );
}

TextStyle jost(
    {required double size,
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black,
  bool italic = false,
    }) {
  return GoogleFonts.jost(
    fontSize: size,
    color: color,
    fontWeight: fontWeight,
    fontStyle: italic ? FontStyle.italic : FontStyle.normal,

  );
}
