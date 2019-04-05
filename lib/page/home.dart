import 'package:flutter/material.dart';
import './detail.dart';
import './about.dart';
import '../value/colour.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  Color hexToColor(String code) {
    print(code);
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            tooltip: 'Increase volume by 10',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          )
        ],
      ),
      body: OrientationBuilder(
        builder: (c, o) {
          return GridView.count(
            crossAxisCount: o == Orientation.portrait ? 2 : 4,
            children: List.generate(FlutterMaterialColour.length, (index) {
              var currItem = FlutterMaterialColour.values.elementAt(index);
              var currColour = FlutterMaterialColour.keys.elementAt(index);
              return Padding(
                child: Material(
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16) ),
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  child: FlatButton(
                    child: null,
                    color: hexToColor(currItem['500']),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ColourPage(title: currColour, colour: currItem)),
                      );
                    },
                  ),
                ),
                padding: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
              );
            }),
          );
        },
      )
    );
  }

  
}
