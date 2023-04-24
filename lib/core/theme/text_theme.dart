import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';

TextTheme get textTheme {
  return TextTheme(
    //Header
    displayLarge: TextStyle(
      fontFamily: FontFamily.lato,
      fontSize: 28,
      fontWeight: FontWeight.w800,
    ),

    //Title
    titleLarge: TextStyle(
      fontFamily: FontFamily.lato,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),

    //Subtitle
    titleMedium: TextStyle(
        fontFamily: FontFamily.lato,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black),

    //Body
    bodyLarge: TextStyle(
        fontFamily: FontFamily.lato,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.black),

    //Body
    bodyMedium: TextStyle(
        fontFamily: FontFamily.lato,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Colors.black),

    //Caption
    labelLarge: TextStyle(
        fontFamily: FontFamily.lato,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.black.withOpacity(.8)),
  );
}
