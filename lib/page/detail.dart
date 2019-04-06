import 'package:flutter/material.dart';
import '../core/ColourUtil.dart';

class ColourPage extends StatelessWidget {
  ColourPage({Key key, this.title, this.colour}) : super(key: key);

  final String title;
  final Map<String, String> colour;

  _showAlert(BuildContext context, String key) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: FlatButton(

          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    var bgColour = ColourUtil.getColour(colour['500']);
    var barColour = ColourUtil.getTextColour(colour['500']);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: barColour
          ),
        ),
        iconTheme: IconThemeData(
          color: barColour
        ),
        backgroundColor: bgColour,
        brightness: ColourUtil.getBrightness(colour['500'])
      ),
      body: ListView.builder(
        itemCount: colour.length,
        itemBuilder: (c, i) {
          var currKey = colour.keys.elementAt(i);
          var currColour = colour[currKey];
          return MaterialButton(
            height: 74,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  colour[currKey].toUpperCase(),
                  style: TextStyle(
                    color: ColourUtil.getTextColour(currColour),
                    fontSize: 17, fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  currKey,
                  style: TextStyle(
                    color: ColourUtil.getTextColour(currColour),
                    fontSize: 15
                  ),
                ),
              ],
            ),
            color: ColourUtil.getColour(currColour),
            onPressed: () {}
          );
        },
      )
    );
  }
}
