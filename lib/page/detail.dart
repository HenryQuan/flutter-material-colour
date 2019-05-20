import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mc/core/MaterialColour.dart';

class ColourPage extends StatelessWidget {
  ColourPage({Key key, this.title, this.mc}) : super(key: key);

  final String title;
  final MaterialColour mc;
  static const scale = ['50', '100', '200', '300', '400', '500', '600', '700', '800', '900', 'A100', 'A200', 'A400', 'A700'];

  /// Show a snackbar when any colour string is pressed
  _showSnack(BuildContext c, String value) {
    final snackBar = SnackBar(content: Text('$value copied'), duration: Duration(milliseconds: 700));
    Scaffold.of(c).showSnackBar(snackBar);
  }

  /// Show alert when any colour tile is pressed
  _showAlert(BuildContext c, HexColour colour) {
    showDialog(
      context: c,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(colour.hex),
                onTap: () {
                  var value = colour.hex;
                  Clipboard.setData(new ClipboardData(text: value));
                  Navigator.pop(c);
                  _showSnack(c, value);
                },
              ),
              ListTile(
                title: Text(colour.rgb),
                onTap: () {
                  var value = colour.rgb;
                  Clipboard.setData(new ClipboardData(text: value));
                  Navigator.pop(c);
                  _showSnack(c, value);
                },
              ),
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    print(mc.list);
    var bgColour = mc.mainColour.colour;
    var cbgColour = new HexColour(mc.list['A700']);
    var barColour = mc.mainColour.textColour;

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
        brightness: mc.mainColour.brightness
      ),
      body: Container(
        color: cbgColour.colour,
        child: ListView.builder(
          itemCount: scale.length,
          itemBuilder: (c, i) {
            var currKey = scale[i];
            var currColour = new HexColour(mc.list[currKey]);
            return Material(
              color: currColour.colour,
              child: InkWell(
                onTap: () => _showAlert(c, currColour),
                child: Container(
                  padding: EdgeInsets.all(16),
                  height: 66,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        mc.list[currKey].toUpperCase(),
                        style: TextStyle(
                          color: currColour.textColour,
                          fontSize: 17, 
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        currKey,
                        style: TextStyle(
                          color: currColour.textColour,
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
