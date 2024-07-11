import 'package:flutter/material.dart';
import 'package:portfolio/MyHome.dart';
import 'package:portfolio/about.dart';
import 'package:portfolio/projects.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: "Font"),
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes:{
      'home': (context) => MyHome(),
      'about': (context) => About(),
      'projects': (context) => MyProject(),
    }

  ));
}
