import 'package:flutter/material.dart';

import 'text_theme.dart';

class AppTheme {
  static ThemeData get defaultTheme {
    return ThemeData.light().copyWith(textTheme: textTheme);
  }
}
