import 'package:flutter/material.dart';
import './page/home.dart';

void main() => runApp(MC());

class MC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Colour',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: HomePage(title: 'Material Colour'),
    );
  }
}
