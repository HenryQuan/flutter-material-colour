/*
A widget for changing theme dynamically
*/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mc/core/DynamicTheme.dart';

class _FlutterTheme extends InheritedWidget {
  _FlutterTheme({Key key, @required Widget child, this.state}) : super(key: key, child: child);

  final FlutterThemeState state;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return null;
  }
}

class FlutterTheme extends StatefulWidget {
  FlutterTheme({Key key, @required this.child, this.theme}) : super(key: key);

  final Widget child;
  final DynamicTheme theme;

  @override
  State<StatefulWidget> createState() => new FlutterThemeState();
}

class FlutterThemeState extends State<FlutterTheme> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}