/*
Theme class for dynamic theming
*/

import 'package:flutter/material.dart';

class DynamicTheme {
  DynamicTheme();

  ThemeData switchTheme(MaterialColor primary) {
    return ThemeData(
      primarySwatch: primary,
    );
  }
}