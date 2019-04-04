import 'package:flutter/material.dart';
import './page/detail.dart';
import './value/colour.dart';

void main() => runApp(MC());

class MC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Colour',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Material Colour'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

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
                        MaterialPageRoute(builder: (context) => ColourPage(title: currColour)),
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
