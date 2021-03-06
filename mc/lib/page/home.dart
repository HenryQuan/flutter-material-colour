import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mc/core/MaterialColour.dart';
import 'package:provider/provider.dart';
import '../core/ThemeChanger.dart';
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
    List<MaterialColour> list = [];
    ColourNames.forEach((n) => list.add(MaterialColour(n)));
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
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
      body: LayoutBuilder(
        builder: (c, constraint) {
          // At least 2 items, at most 7 items
          var itemNum = max(2, min((constraint.maxWidth / 200).floor(), 7));

          return Container(
            child: GridView.count(
              crossAxisCount: itemNum,
              children: list.map((mc) {
                return Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                  child: Material(
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16)),
                    elevation: 4,
                    clipBehavior: Clip.antiAlias,
                    child: FlatButton(
                      child: null,
                      color: mc.mainColour.colour,
                      onPressed: () {
                        // Update theme here
                        themeChanger.setTheme(mc.getSwatch());
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailPage(title: mc.name, mc: mc)),
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
