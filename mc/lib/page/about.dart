import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final version = '1.0';

    return Scaffold(
      appBar: AppBar(
        title: Text('About')
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Source code'),
              subtitle: Text('Check it out on GitHub'),
              onTap: () => launch('https://github.com/HenryQuan/flutter-material-colour'),
            ),
            ListTile(
              title: Text('Open source licenses'),
              subtitle: Text('This app is powered by Flutter'),
              onTap: () {
                showLicensePage(
                  context: context,
                  applicationLegalese: 'Material Colour',
                  applicationName: 'MC',
                  applicationVersion: version,
                );
              }
            ),
            ListTile(
              title: Text('Version'),
              subtitle: Text(version),
            ),
            ListTile(
              subtitle: Text("This was my first ever Flutter app but I didn't complete it and moved on with React Native back then. My first ever completed Flutter app was AnimeOne and now, I perfer Flutter over React Native."),
            ),
          ],
        )
      )
    );
  }
}
