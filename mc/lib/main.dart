import 'package:flutter/material.dart';
import 'package:mc/core/ThemeChanger.dart';
import 'package:provider/provider.dart';
import './page/home.dart';

void main() => runApp(MC());

class MC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: AppWidget(),
    );
  }
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Flutter Material Colour',
      theme: theme.getTheme(),
      home: HomePage(title: 'Material Colour'),
    );
  }
}
