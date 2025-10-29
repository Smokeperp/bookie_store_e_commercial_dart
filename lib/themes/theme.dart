import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    onSurface: Colors.grey.shade100,
    primary: Colors.grey.shade400,
  ),
    textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.grey.shade100),
    bodyMedium: TextStyle(color: Colors.grey.shade100),
    bodySmall: TextStyle(color: Colors.grey.shade100),
  ),
);
