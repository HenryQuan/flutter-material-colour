import 'package:flutter/material.dart';
import 'package:mc/core/MaterialColour.dart';
import './detail.dart';
import './about.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;
  static const ColourNames = [
    'Red', 'Pink',
    'Purple', 'Deep Purple',
    'Indigo', 'Blue',
    'Light Blue', 'Cyan',
    'Teal', 'Green',
    'Light Green', 'Lime',
    'Yellow', 'Amber',
    'Orange', 'Deep Orange',
    'Brown', 'Grey',
    'Blue Grey'
  ];

  @override
  Widget build(BuildContext context) {
    // Get MaterialColour list
    var list = [];
    ColourNames.forEach((n) => list.add(new MaterialColour(n)));

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
            children: list.map((mc) {
              return Padding(
                child: Material(
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16)),
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  child: FlatButton(
                    child: null,
                    color: mc.mainColour.colour,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ColourPage(title: mc.name, mc: mc)),
                      );
                    },
                  ),
                ),
                padding: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
