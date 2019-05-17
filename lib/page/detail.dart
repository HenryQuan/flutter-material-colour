import 'package:flutter/material.dart';
import 'package:mc/core/MaterialColour.dart';

class ColourPage extends StatelessWidget {
  ColourPage({Key key, this.title, this.mc}) : super(key: key);

  final String title;
  final MaterialColour mc;
  static const scale = ['50', '100', '200', '300', '400', '500', '600', '700', '800', '900', 'A100', 'A200', 'A400', 'A700'];

  _showAlert(BuildContext context, String key) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text('Hello'),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    var bgColour = mc.mainColour.colour;
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
        color: mc.mainColour.colour,
        child: ListView.builder(
          itemCount: mc.list.length,
          itemBuilder: (c, i) {
            var currKey = scale[i];
            var currColour = new HexColour(mc.list[currKey]);
            return Material(
              color: currColour.colour,
              child: InkWell(
                onTap: () => _showAlert(c, '123'),
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
