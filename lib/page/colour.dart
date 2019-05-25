/*
Show one single colour full screen
*/

import 'package:flutter/material.dart';

class ColourPage extends StatelessWidget {
  ColourPage({Key key, this.colour, this.tag}) : super(key: key);

  final Color colour;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: this.colour,
      ),
    );
  }
}