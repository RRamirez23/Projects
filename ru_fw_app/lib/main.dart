import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'splash.dart';

void main() {
  runApp(new MaterialApp(
      home: new MyApp(),
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primaryColor: Colors.blue)));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new AfterSplash(),
      title: new Text(
        'Ricardo Ramirez' + '\n\n\n\n' + 'RUFW Part 4' + '\n\n\n\n' + '5/4/21',
        textAlign: TextAlign.center,
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      backgroundColor:Color(0xFFFFCC00), //ANY COLOR YOU CHOOSE
      styleTextUnderTheLoader: new TextStyle(),
      loaderColor: Color(0xFF57150B), //ANY COLOR YOU CHOOSE
      loadingText: new Text('Starting RUFW Part 4'),
    );
  }
}