import 'package:flutter/material.dart';

class ColourPage extends StatelessWidget {
  ColourPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: FlatButton(
          child: Text('POP'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      )
    );
  }
}
