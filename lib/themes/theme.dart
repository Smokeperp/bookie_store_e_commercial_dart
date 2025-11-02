import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    onSurface: Colors.grey.shade100,
    primary: Colors.grey.shade400,
  ),
      textTheme: GoogleFonts.montserratTextTheme().copyWith(
    bodyLarge: TextStyle(color: Colors.grey.shade100),
    bodyMedium: TextStyle(color: Colors.grey.shade100),
    bodySmall: TextStyle(color: Colors.grey.shade100),
  ),
);
