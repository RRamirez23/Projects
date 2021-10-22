import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}
const RowanBrown = const Color(0xFF57150B);
const RowanGold = const Color(0xFFFFCC00);

class HomePageState extends State<HomePage> {
// Define variables that will change here

/*

 dataType someVariable = some initial value;

*/

// Format for method using setState() to change some variable's value

/*

void someMethod(){
  setState((){
	someVariable = newValue;
  });
}

*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
            child: ListView(
              children: [
              Container(
                color: RowanGold,
                padding: EdgeInsets.all(10),
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 4,
                        child: Image( image: AssetImage('assets/torch_48.png'))),
                    Expanded(
                      flex: 3,
                        child: Text('RU Family Weekend')),
                    Expanded(
                      flex: 3,
                        child: Text('September 28-30, 2018',))
                ],
              ),
            )
            ,
              Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: Image( image: AssetImage('assets/info.png')),
                title: Text('General Info'),
                onTap: () => { },
              ),
              ListTile(
                leading: Image( image: AssetImage('assets/schedule.png')),
                title: Text('Schedule'),
                onTap: () => {
                  Navigator.pushNamed(context, '/schedule')
                },
              ),
              ListTile(
                leading: Image( image: AssetImage('assets/tickets-30.png')),
                title: Text('Tickets'),
                onTap: () => {
                  Navigator.pushNamed(context, '/tickets')
                },
              ),
              ListTile(
                leading: Image( image: AssetImage('assets/sponsors.png')),
                title: Text('Sponsors'),
                onTap: () => {
                  Navigator.pushNamed(context, '/sponsors')
                },
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),

              ListTile(
                title: Text('RU on Social Media'),
                onTap: () => { },
              ),
              ListTile(
                leading: Image( image: AssetImage('assets/fb.png')),
                title: Text('Facebook'),
                onTap: () => {
                  Navigator.pushNamed(context, '/facebook')
                },
              ),
              ListTile(
                leading: Image( image: AssetImage('assets/twitter.png')),
                title: Text('Twitter'),
                onTap: () => {
                  Navigator.pushNamed(context, '/twitter')
                },
              ),
              ListTile(
                leading: Image( image: AssetImage('assets/internet-32.png')),
                title: Text('Family Weekend'),
                onTap: () => {
                  Navigator.pushNamed(context, '/family_weekend')
                },
              )
            ],
        )),
      ),
      appBar: AppBar(
        title: Text('RU Family Weekend 2018',
          style: TextStyle(
            color: RowanBrown,
            fontSize: 20.0,
            fontFamily: 'Roboto',

          )),
      ),
      body: Container(
        color: RowanGold,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Image(
                image: AssetImage('assets/rufwpic.png')
              ),
            ),
            Text('2018 Family Weekend General Info',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: RowanBrown,
                fontSize: 30
              )
            ),
            Container(
              height: 150,
              alignment: Alignment.center,
              child: Text('Click the Sidebar Menu for information, Schedule, and Tickets',
                  style: TextStyle(color: RowanBrown,)
              )
            )
          ],
        ),
      ),
    );
  }
}