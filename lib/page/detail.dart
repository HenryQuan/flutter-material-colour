import 'package:flutter/material.dart';

class ColourPage extends StatelessWidget {
  ColourPage({Key key, this.title, this.colour}) : super(key: key);

  final String title;
  final Map<String, String> colour;

  Color hexToColor(String code) {
    print(code);
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  _showAlert(BuildContext context, String key) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(key),
          content: Text(colour[key].toUpperCase()),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    var headerColour = hexToColor(colour['500']);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: headerColour
      ),
      body: ListView.builder(
        itemCount: colour.length,
        itemBuilder: (c, i) {
          var currKey = colour.keys.elementAt(i);
          return MaterialButton(
            height: 64,
            child: Text(currKey),
            color: hexToColor(colour[currKey]),
            onPressed: () => _showAlert(context, currKey)
          );
        },
      )
    );
  }
}
