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
    var headerColour = hexToColor(colour['500']);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: headerColour
      ),
      body: Center(
        child: ListView.builder(
          itemCount: colour.length,
          itemBuilder: (c, i) {
            var currKey = colour.keys.elementAt(i);
            return FlatButton(
              child: Text(currKey),
              color: hexToColor(colour.values.elementAt(i)),
              onPressed: () {

              },
            );
          }
        )
      )
    );
  }
}
