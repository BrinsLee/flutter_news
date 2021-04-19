import 'package:flutter/material.dart';
import 'package:flutter_new/global.dart';
import 'package:flutter_new/pages/welcome/welcome.dart';
import 'package:flutter_new/routes.dart';

void main() => Global.init().then((value) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material App",
      routes: staticRoutes,
      home: WelcomePage(),
    );
  }
}

