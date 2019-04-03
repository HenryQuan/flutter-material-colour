import 'package:flutter/cupertino.dart';

class ColourPage extends StatelessWidget {
  ColourPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: 'Main',
        middle: Text('Colour $title')
      ),
      child: Center(
        child: CupertinoButton(
          child: Text('POP'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      )
    );
  }
}