import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'splash.dart';

void main() {
  runApp(new MaterialApp(
      home: new MyApp(),
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primaryColor: /**PUT ROWAN GOLD COLOR HERE */)));
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
        'Your Name' +
            '\n\n\n\n' +
            'RU Dino Park App' +
            '\n\n\n\n' +
            '?? ??, 2021',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: ****** ),//ROWAN BROWN COLOR
      ),
      image: new Image.asset('assets/logo.png', height: 150.0, width: 150.0),
      backgroundColor: ******, //ROWAN GOLD COLOR
      styleTextUnderTheLoader: new TextStyle(),
      loaderColor: ******, //ROWAN BROWN COLOR
      loadingText: new Text('Starting RU Dino Park App'),
    );
  }
}