import 'package:flutter/material.dart';
import './colour.dart';

void main() => runApp(MC());

class MC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Colour',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Material Colour'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

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
            children: List.generate(100, (index) {
              return FlatButton(
                child: Text(
                  'Item ${index + 1}',
                  style: Theme.of(context).textTheme.headline
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ColourPage(title: index.toString())),
                  );
                }
              );
            }),
          );
        },
      )
    );
  }

  
}
