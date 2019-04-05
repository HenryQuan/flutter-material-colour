import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About')
      ),
      body: Center(
        child: Text('This is AboutPage\nFlutter Material Colour v1.0')
      )
    );
  }
}
