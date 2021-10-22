import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'home.dart';

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'RU Dino Park App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == '/invertebrates') {
          return MaterialPageRoute(builder: (context) => InvertebrateList());
        }
        if (settings.name == '/vertebrates') {
          return MaterialPageRoute(builder: (context) => VertibrateList());
        }
        if (settings.name == '/nonfossils') {
          return MaterialPageRoute(builder: (context) => NonFossilList());
        }

        if (settings.name == DetailScreen.routeName) {
          final ScreenArguments args = settings.arguments;

          return MaterialPageRoute(
              builder: (context) => DetailScreen(
                image: args.image,
                message: args.message,
                fossil: args.fossil,
              ));
        }
        if (settings.name == '/about') {
          return MaterialPageRoute(
            builder: (context) => new WebviewScaffold(
              url: "https://www.rowan.edu/fossils/",
              appBar: new AppBar(
                title: new Text("RU Fossil Park",
                    style: TextStyle(color: *********)), //ROWAN GOLD BROWN
              ),
            ),
          );
        }
        return MaterialPageRoute(builder: (context) => UnknownScreen());
      },
      theme: new ThemeData(primaryColor: *******),//ROWAN GOLD COLOR
      home: new HomePage(),
    );
  }
}


/**** USE THIS CLASS AS A TEMPLATE FOR OTHER CLASSES ****/
class InvertebrateList extends StatelessWidget {
  final invertebrates = [
    'Cucullaea (Clam)',
    'Crassatellites vadosus (Clam)',
    'Turritella vertebroides (Snail)',
    'Oleneothyris harlani (Brachiopod)',
    'Terebratulina atlantica (Brachiopod)',
    'Pycnodonte dissimilaris (Oysters)',
    'Gryphaeostrea vomeri (Oyster)',
    'Thalassinoides sp. Burrow',
    'Peridonella dichotoma (Sponge)',
    'Flabellum mortoni (Coral)'
  ];

  final invertebrateDescription = [/** ASSIGN DATA ****/];

  final invertebrateImage = [/** ASSIGN DATA ****/];

  @override
  Widget build(BuildContext context) {
    print("invertebrates");

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Invertebrates",
              textAlign: TextAlign.center,
              style: TextStyle(color: ******)),//ROWAN BROWN COLOR
          automaticallyImplyLeading: true,
        ),
        body: ListView.builder(
            itemCount: invertebrates.length,
            itemBuilder: (context, index) {
              var item = invertebrates[index];
              return Card(
                child: ListTile(
                    title: Text('$item',
                        style: TextStyle(color: ******)), //ROWAN BROWN COLOR
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailScreen.routeName,
                        arguments: ScreenArguments(
                            invertebrateDescription[index],
                            invertebrateImage[index],
                            item),
                      );
                    }),
              );
            }));
  }
}

class VertibrateList extends StatelessWidget {
  /*** YOUR CLASS CODE GOES HERE ***/
}

class NonFossilList extends StatelessWidget {
  /*** YOUR CLASS CODE GOES HERE ***/
}


/***** DO NOT EDIT ANYTHING BELOW THIS LINE ******/
class DetailScreen extends StatelessWidget {
  static const routeName = '/detailArguments';

  final String image;
  final String message;
  final String fossil;

  // This Widget accepts the arguments as constructor parameters. It does not
  // extract the arguments from the ModalRoute.
  //
  // The arguments are extracted by the onGenerateRoute function provided to the
  // MaterialApp widget.
  const DetailScreen({
    Key key,
    @required this.message,
    @required this.image,
    @required this.fossil,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RU Dino Park',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF57150B))),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(20),
                    child: Text(fossil,
                        style: TextStyle(
                            color: Color(0xFF57150B),
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0))),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Text(message,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF57150B)))),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Image(
                        image: AssetImage('assets/' + image),
                        height: 150.0,
                        width: 150.0)),
              ]),
        ));
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404!'),
      ),
    );
  }
}

class ScreenArguments {
  final String image;
  final String message;
  final String fossil;

  ScreenArguments(this.message, this.image, this.fossil);
}