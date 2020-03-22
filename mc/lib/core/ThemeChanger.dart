import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  getTheme() => _themeData;
  setTheme(MaterialColor color) {
    _themeData = ThemeData(
      primarySwatch: color
    );
    
    // Update all listeners
    notifyListeners();
  }

  ThemeChanger(this._themeData);
}
