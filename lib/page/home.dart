import 'package:flutter/material.dart';
import './detail.dart';
import './about.dart';
import '../core/colour.dart';
import '../core/ColourUtil.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black87
          ),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            color: Colors.black87,
            icon: Icon(Icons.info_outline),
            tooltip: 'About Material Colour',
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
            children: FlutterMaterialColour.keys.map((key) {
              print(key);
              return Padding(
                child: Material(
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16) ),
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  child: FlatButton(
                    child: null,
                    color: ColourUtil.getColour(FlutterMaterialColour[key]['500']),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ColourPage(title: key, colour: FlutterMaterialColour[key])),
                      );
                    },
                  ),
                ),
                padding: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
              );
            }).toList()
          );
        },
      )
    );
  }
}
