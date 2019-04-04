import 'package:flutter/material.dart';

class ColourPage extends StatelessWidget {
  ColourPage({Key key, this.title, this.colour}) : super(key: key);

  final String title;
  final Map<String, String> colour;

  Color hexToColor(String code) {
    print(code);
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: hexToColor(colour['500']),
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
