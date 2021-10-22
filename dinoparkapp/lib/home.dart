import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RU Fossil Park',
            style: TextStyle(
              color: #57150B,//ROWAN BROWN COLOR
              fontSize: 15.0,
              fontFamily: 'Roboto',
            )),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage('assets/logo.png'),
                  height: 150.0,
                  width: 150.0),
              TextButton(
                  child: Text('About RU Fossil Park',
                      style: TextStyle(
                        color: Colors.brown,//ROWAN BROWN COLOR
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                      )),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/about',
                    );
                  }),
              Text('Fossils Found at RU Dino Park',
                  style: TextStyle(
                    color: *****,//ROWAN BROWN COLOR
                    fontSize: 25.0,
                    fontFamily: 'Roboto',
                  )),
              TextButton(
                  child: Text('Invertebrates',
                      style: TextStyle(
                        color: *****,//ROWAN BROWN COLOR
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                      )),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/invertebrates',
                    );
                  }),
              TextButton(
                  child: Text('Vertebrates',
                      style: TextStyle(
                        color: *****,//ROWAN BROWN COLOR
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                      )),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/vertebrates',
                    );
                  }),
              TextButton(
                  child: Text('Non-Fossils',
                      style: TextStyle(
                        color: *****,//ROWAN BROWN COLOR
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                      )),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/nonfossils',
                    );
                  })
            ]),
      ),
    );
  }
}
