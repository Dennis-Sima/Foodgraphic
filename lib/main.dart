import 'package:Foodgraphic/view/pages/scanner.dart';
import 'package:flutter/material.dart';
import 'package:Foodgraphic/view/pages/home_page.dart';
import 'package:Foodgraphic/view/presentation/themes.dart';

void main() => runApp(Foodgraphic());

class Foodgraphic extends StatelessWidget {
  const Foodgraphic({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        brightness: Brightness.light,
        textTheme: TextTheme(
          title: TextThemes.title,
          subtitle: TextThemes.subtitle,
          body1: TextThemes.body1,
        ),
      ),
      home: ScanShopPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
