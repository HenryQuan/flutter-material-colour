import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About')
      ),
      body: Center(
        child: Text('Flutter Material Colour 1.0')
      )
    );
  }
}
