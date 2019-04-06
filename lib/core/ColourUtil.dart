import 'package:flutter/material.dart';
import 'dart:math';

class ColourUtil {
  static String _normalise(String code) {
    var len = code.length;
    if (len == 6 && !code.contains('#')) code = '#' + code;
    return code;
  }

  /// Get colour from hex string
  static Color getColour(String code) {
    code = _normalise(code);
    // not valid string, return a default colour
    if (code.length < 7) return Colors.black;
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  /// Light colour -> Black, Dark colour -> White
  static Color getTextColour(String code) {
    return _brightness(code) < 130 ? Colors.white : Colors.black87;
  }

  /// Light colour -> Black, Dark colour -> White
  static Brightness getBrightness(String code) {
    return _brightness(code) < 130 ? Brightness.dark : Brightness.light;
  }

  /// Calculate the brightness of any given colour
  static double _brightness(String code) {
    code = _normalise(code);
    if (code.length < 7) return 0;
    var R = int.parse(code.substring(1, 3), radix: 16);
    var G = int.parse(code.substring(3, 5), radix: 16);
    var B = int.parse(code.substring(5, 7), radix: 16);
    // From http://www.nbdtech.com/Blog/archive/2008/04/27/Calculating-the-Perceived-Brightness-of-a-Color.aspx
    return sqrt(R * R * 0.241 + G * G * 0.691 + B * B * 0.068);
  }
}