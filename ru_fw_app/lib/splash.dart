import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const RowanGold = const Color(0xFFFFCC00);
class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Lab 2',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primaryColor: Color(0xFFFFCC00)),
      home: new HomePage(),
      routes: {
        '/sponsors': (BuildContext context) => new SponsorsScreen(),
        '/schedule': (BuildContext context) => new ScheduleScreen(),

        '/twitter': (BuildContext context) => new WebviewScaffold(
          url: "https://twitter.com/RowanUniversity",
          appBar: new AppBar(
            title: new Text("RU Twitter Page"), //ROWAN GOLD BROWN
          ),
        ),
        '/facebook': (BuildContext context) => new WebviewScaffold(
          url: "https://www.facebook.com/RowanUniversity",
          appBar: new AppBar(
            title: new Text("RU Facebook Page"), //ROWAN GOLD BROWN
          ),
        ),
        '/family_weekend': (BuildContext context) => new WebviewScaffold(
          url: "https://sites.rowan.edu/parentsfamily/family-weekend/index.html",

          appBar: new AppBar(
            title: new Text("RU Family Weekend Page"), //ROWAN GOLD BROWN
          ),
        ),
        '/tickets': (BuildContext context) => new WebviewScaffold(
          url: "https://secure.visualzen.com/vzfamilyweekend/rowan",
          appBar: new AppBar(
            title: new Text("RU Ticket Page"), //ROWAN GOLD BROWN
          ),
        ),
      },
    );
  }
}


class ScheduleScreen extends StatefulWidget{
  final fridayEvents = ["Registration and Welcome", "\$5 Friday at the Glassworks Eatery","How to Create a Killer LinkedIn Profile That Will Get You Noticed",
    "Heather Ujiie: Dystopian Garden Paradise", "Rowan Division III Ice Hockey vs. Rutgers Camden","Laser Pink Floyd: Dark Side of the Moon - Planetarium Show",
    "Rowan Division II Ice Hockey vs. Virginia Tech","Laser Pink Floyd: Dark Side of the Moon - Planetarium Show", "Drive-in Movie", "Laser Pink Floyd: Dark Side of the Moon - Planetarium Show"
  ];
  final saturdayEvents = ["Registration and Welcome", "The SHOP (Students Helping Other Profs) Food Pantry Donations",
"They Fought We Ride, Run, or Walk",
"MARU (Museum of Anthropology at Rowan University) Tour",
 "WGLS-FM Radio Studio Tour",
"Heather Ujii: Dystopian Garden Paradise",
"Story Telling and Craft Time at Barnes and Noble",
"Instrument Petting Zoo",
 "Ingredients for a Great Career: Exploring OCA Services and Resources"
  ,
"Family Block Party/Vendor Fair",
"Flu Shots",
"Sweets in the Sukkah",
"Hollybush Tour",
"Rowan University Field Hockey vs. William Patterson University",
 "Profecy A Cappella Performance",
 "Liquid Nitrogen Ice Cream Demonstration",
 "Rowan Family Fossil Find",
 "Finance Lab Demonstration",
 "Black Holes - Planetarium Show",
 "Stars of the Pharaohs - Planetarium Show",
 "Rowan University Football vs. Christopher Newport University",
"Rowan University Men's Soccer vs. Kean University",
"Laser Queen - Planetarium Show",
 "Laser Queen - Planetarium Show",
"End of Summer Bingo",
 "Laser Queen - Planetarium Show"
  ];
  final sundayEvents = ["A Service of Many Faiths",
 "Black Jack Walk",
 "Sweet and Savory Brunch at the Glassworks Eatery",
"Hollybush Tour",
"Family Show - Planetarium Show",
"Stars of the Pharaohs - Planetarium Show",
  ];

  final friDescription = [
  "Time: 4:00pm - 7:00pm \n \n Location: Atrium, Savitz Hall 2nd Floor \n \n Students or family members can pick up their reserved tickets or purchase tickets while supplies last.  We encourage guests to bring non-perishable food and toiletries donations for The Shop at Rowan" +
  "University (Students Helping Other Profs), serving Rowan University students faced with food insecurities.",
   "Time: 4:30pm - 7:30pm \n \n Location: Holly Pointe Commons \n \n Cost: \$5 - Adults, Children, Senior Citizens(Rowan students can use meal plans/special-priced meal.) \n \n " +
  "Enjoy a wide variety of selections in our newest all you can eat dining " +
  "facility including classic cuisine, pizza & pasta, soup & salad, traditional grill and more...",
  "Time: 4:00pm - 5:00pm \n \n Location: Office of Career Advancement, Savitz Hall 2nd Floor \n \n Cost: Free \n \n " +
  "Whether you are job or internship hunting, gathering leads, or networking in your career field, having a professional, eye-catching LinkedIn" +
  " profile is an excellent idea to make sure that you can be found by the right people at the right time.  come learn how to complete your LinkedIn " +
  "profile in a way that appeals to prospects that are quickly scanning to see if you have what they need.  ",
  "Time: 4:00pm - 7:00pm\n \n Location: Rowan University Art Gallery, 301 West High Street, Glassboro NJ\n \n Cost: Free\n \n Rowan University art " +
  "Gallery will be producing and presenting an interdisciplinary program that turns a lens on how fashion and textile design is translated " +
  "as a visual arts practice.  This program comes at a time when the arts and design sectors are blending creative principles and crossing over into the " +
  "multi-disciplinary practices.  Fashion design has crossed over into a platform where explorations into gender and cultural identity can reach a broader audience outside" +
  " the mainstream fashion and design sectors.  Artist Heather Ujiie's work speaks directly to issues that are currently relevant in our society: transgender, sexuality, environmental issues, science and technology.  ",
  "Time: 5:30pm - TBA\n \n Location: Hollydell Ice Arena, 600 Hollydell Drive, Sewell NJ\n \n Cost: \$5 - Adults, Free- Rowan Students(With ID) and children(Athletic passes included by the Athletic Department cannot be used for this event.)\n \n " +
  "Join Rowan's hockey club for its opening night for the 2018/19 season!",
  "Time: 7:00pm - TBA\n \n Location: Edelman Planetarium, Science Hall\n \n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n \n " +
  "Show details and ticket purchases can be found at www.rowan.edu/planetarium",
  "Time: 8:15pm - TBA\n \n Location: Hollydell Ice Arena, 600 Hollydell Drive, Sewell NJ\n \n Cost: \$5 - Adults, Free- Rowan Students(With ID) and children(Athletic passes included by the Athletic Department cannot be used for this event.)\n \n " +
  "Join Rowan's hockey club for its opening night for the 2018/19 season!",
  "Time: 8:30pm - TBA\n \n Location: Edelman Planetarium, Science Hall\n \n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n \n " +
  "Show details and ticket purchases can be found at www.rowan.edu/planetarium",
   "Time: 9:00pm - 1:00am\n \n Location: South Jersey Technology Park\n \n Cost: Free\n \n Enjoy a family friendly classic under the stars and go back to the days of drive-in movies.  No worries if you don't have a car, " +
  "a free shuttle will be provided from the Student Center Half-Circle starting at 8:30pm.  Enjoy free food and drinks while you watch.  ",
   "Time: 10:00pm - TBA\n \n Location: Edelman Planetarium, Science Hall\n \n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n \n " +
  "Show details and ticket purchases can be found at www.rowan.edu/planetarium",
  ];

  final satDescription = [
    "Time: 9:00am - 12:30pm\n \n Location: The Registration Tent, Athletic Alumni Patio, Between the End Zone and John Green Team House\n \n Cost: Free\n \n " +
  "Students or family members can pick up their reserved tickets or purchase tickets while supplies last.  ",
 "Time: 9:00am - 12:30pm\n \n Location: The Registration Tent, Athletic Alumni Patio, Between the End Zone and John Green Team House\n \n Cost: Free\n \n " +
  "The SHOP is Rowans's on-campus food pantry and resource center available to students in need.  We encourage guests to bring non-perishable food items, toiletries and hygiene product donations to show your" +
  " support for our student community.  ",
 "ime: 9:30am - 12:00pm\n \n Location: Near the Registration Tent, Athletic Alumni Patio, Between the End Zone and John Green Team House\n \n Cost: Free, but a \$15 minimum or more donation is suggested, but not required to participate\n \n " +
  "Tune up your bicycle or lace up your running/walking shoes and participate in our veterans event!  A fun bike/run/walk that serves as a fundraiser for our veterans' initiatives.  the course follows the perimeter of our campus.  ",
"Time: 10:00am - 4:00pm\n \n Location: Robinson Hall, Room 205\n \n Cost: Free\n \n " +
  "Explore Rowan's very own anthropology museum!  The museum's mission is to promote discovery, learning and an appreciation of human origins and cultures, with collections including archaeological artifacts, human osteological and megafauna remains " +
  "and even an extensive human evolution series inaugurated in 2017 by Dr. Jane Hill and Rowan's Museum Studies students.  Dr. Maria A. Rosado will be on hand to discuss the collections and answer any questions you may have.  ",
"Time: 10:00am - 1:00pm\n \n Location: Bozorth Hall\n \n Cost: Free\n \n Explore Rowan's very own radio station headquarters!  WGLS-FM is regional radio service with a potential audience of almost 1.2 million people and has won over 245 national and " +
  "regional awards since 1993.  The broadcast covers South Jersey, parts of Philadelphia and Delaware.  WGLS-FM is licensed to the Rowan University Board of Trustees and is a non-profit organization.  Twenty-four hours a day a staff of independent volunteers " +
  "broadcast a variety of musical, cultural, educational, entertaining and informative programs of interest to the Rowan University and surrounding communities.  ",
 "Time: 10:00am - 7:00pm\n \n Location: Rowan University Art Gallery, 301 West High Street, Glassboro NJ\n \n Cost: Free\n \n Rowan University art " +
  "Gallery will be producing and presenting an interdisciplinary program that turns a lens on how fashion and textile design is translated " +
  "as a visual arts practice.  This program comes at a time when the arts and design sectors are blending creative principles and crossing over into the " +
  "multi-disciplinary practices.  Fashion design has crossed over into a platform where explorations into gender and cultural identity can reach a broader audience outside" +
  " the mainstream fashion and design sectors.  Artist Heather Ujiie's work speaks directly to issues that are currently relevant in our society: transgender, sexuality, environmental issues, science and technology.",
"Time: 10:30am - 12:00pm\n \n Location: Barnes and Noble, 201 Rowan Boulevard\n \n Cost: Free\n \n Barnes and Noble will feature new topical books of interest for students, as well as family PROF related crafts for the whole family to enjoy and take home.  ",
"Time: 10:00am - 12:00pm\n \n Location: Room 105, Harold Wilson Music Building\n \n Cost: Free\n \n Come expand your mind doing something relaxing, upbeat and productive.  What is it you say?  Music!  Try instruments, listen " +
  "to informal performances, ask questions about music, and learn about how you can be involved in music even as a non-music major.  if you love music, this is the place for you.  ",
 "Time: 10:30am - 2:00pm\n \n Location: Room 107, Harold Wilson Music Building\n \n Cost: Free\n \n " +
  "Join us to learn about Rowan University's Career Advancement center, alumni and community networks and the many ways for students to make lasting, valuable career connections.  Take an interactive tour and talk with students who have participated in" +
  " career development opportunities, internships, externships, job shadowing and more with the professional world.  ",
"Time: 11:00am - 2:30pm\n \n Location: Near the Picnic Tent, Athletic Alumni Patio, Between the End Zone and John Green Team House\n \n Cost: \$20 - Adults, \$17 - Children under 12 for pre-event registration (Day of ticket prices are \$25 for adults and \$20 for children under 12) " +
  "Rowan Students can use meal plans/special-priced meal.\n \n" +
  "Enjoy good food, music, family activities and good old fashion fun the Rowan way!  Festivities include balloon animals, caricaturist artists, crafts, face painting, local vendors, stilt walking entertainers, family photos, Gourmet Dining sponsored contests and more!  The Rowan " +
  "Family Tailgate menu will feature a variety of salads, sides, grilled entrees and assorted desserts.  (Vegan, vegetarian and gluten-free options are available)",
"Time: 11:00am - 2:30pm\n \n Location: Block Party Vendor Fair\n \n Cost: Free\n \n Please stop by for your free flu shot, with proof of insurance card!",
 "Time: 11:00am - 1:00pm\n \n Location: Sukkah Hut\n \n Cost: Free\n \n " +
  "Drop by and grab a sweet in the traditional Sukkah Hut (which commemorates the Jewish harvest festival).  Special activities will be available for children.  ",
"Time: 12:00pm - 2:00pm\n \n Location: The Hollybush Mansion at Rowan University\n \n Cost: Free\n \n " +
  "Join members of the Rowan History Department for an interactive tour of the Hollybush Mansion!  Hollybush has a long and varied history, first as the home of the prominent Whitney family of Glassboro in the mid-1800's, the site of a US and Russia Cold War Summit in 1967 " +
  "and later as a part of Rowan University.  ",
 "Time: 12::00pm - TBA\n \n Location: Richard Wacker Stadium\n \n Cost: Free\n \n ",
"Time: 1:00pm - 1:15pm\n \n Location: Block Party Vendor Fair\n \n Cost: Free\n \n " +
  "Check out Rowan's oldest all-male a cappella group who have competed in the International Championship of Collegiate A Cappella, performed in multiple states, and even released a music video!  These proud Rowan Profs pride themselves on promoting the enjoyment of contemporary " +
  "a cappella music and building life-long relationships with other musicians.  ",
 "Time: 1:00pm - 2:00pm\n \n Location: Room 107, Engineering Hall\n \n Cost: Free\n \n " +
  "Explore the science behind making homade ice cream using liquid nitrogen!  Engineering and chemistry can be used in everyday life, such as making delicious desserts.  feel free to add some " +
  "toppings to your ice cream and enjoy a quick presentation about the club, as well as interesting statistics about women in engineering.  ",
"Time: 2:00pm - 4:00\n \n Location: Edelman Fossil Park\n \n Cost: \$7 - Adults, \$5 - Children\n \n " +
  "Edelman Fossil Park invites Rowan University families for a fossil find event! Few other topics in science can compete with the wide appeal of fossils and their ability to engage the imagination.  This special Family Fossil Find, provides an unparalleled opportunity to do just that, bringing" +
  " the ancient past to life for hundreds of amateur explorers, young an old.  On site with us you will have the chance to interact with Rowan University scientists who will recount the tales of Cretaceous New Jersey and teach guests to excavate and identify their own marine fossils in Rowan's four-acre quarry.  " +
  "Nearly every participant will leave with a 65-million-year-old fossil that they dug with their own hands.  All will make an intimate connection with Earth's deep past.  \n \n ***A courtesy shuttle will escort registered guests to and from the park.***\n \n Ticket purchases can be made at www.rowan.edu/fossils",
 "Time: 2:30pm - 4:00pm\n \n Location: Finance Lab, Business Hall 107\n \n Cost: Free\n \n " +
  "The Bloomberg terminal enables financial professionals to access the Bloomberg Professional service through which users can monitor and analyze real-time financial market data movements.  It also provides news, price quotes, and messaging across its proprietary network, and news and analytics for over 174+ countries and 360+ exchanges.  ",
"Time: 4:00pm - TBA\n \n Location: Edelman Planetarium, Science Hall\n \n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n \n " +
  "Show details and ticket purchases can be found at www.rowan.edu/planetarium",
 "Time: 5:30pm - TBA\n \n Location: Edelman Planetarium, Science Hall\n \n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n \n " +
  "Show details and ticket purchases can be found at www.rowan.edu/planetarium",
"Time: 6:00pm - TBA\n \n Location: Richard Wacker Stadium\n \n Cost: \$8 - General Admission, \$5 - Visiting College Students with ID/Senior Citizens/Children ages 12 and under, Free - Rowan Students with ID, and Faculty and Staff with Athletic Pass\n \n " +
  "Beer garden entrance is included with ticket if over 21.  ",
 "Time: 7:00pm - TBA\n \n Location: Soccer Fields\n \n Cost: \$5 - General Admission, \$3 - Visiting College Students with ID/Senior Citizens/Children ages 12 and under, Free - Rowan Students with ID, and Faculty and Staff with Athletic Pass\n \n ",
"Time: 7:00pm - TBA\n \n Location: Edelman Planetarium, Science Hall\n \n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n \n " +
  "Show details and ticket purchases can be found at www.rowan.edu/planetarium",
 "Time: 8:30pm - TBA\n \n Location: Edelman Planetarium, Science Hall\n \n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n \n " +
  "Show details and ticket purchases can be found at www.rowan.edu/planetarium",
 "Time: 9:00pm - 1:00am\n \n Location: Chamberlain Student Center Pit\n \n Cost: Free\n \n " +
  "Bingo begins at 10:00pm- Say goodbye to summer and ease into the new school year with a night of prizes, giveaways, and more with everyone's favorite RAH game: BINGO!  Bring in a non-perishable food item to donate to The Shop for an extra bingo board.",
"Time: 10:00pm - TBA\n \n Location: Edelman Planetarium, Science Hall\n \n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n \n " +
  "Show details and ticket purchases can be found at www.rowan.edu/planetarium"
  ];

  final sunDescription = [
  "Time: 9:00am - TBA\n \n Location: Chamberlain Student Center Pit\n \n Cost: Free\n \n " +
  "An all-faiths service where family members can explore and celebrate what they believe together as one community committed to supporting different faiths and religions.  ",
"Time: 11:00am - TBA\n \n Location: Student Recreation Center\n \n Cost: Free\n \n " +
  "Enjoy a 1.2-mile walk around campus, collect tokens/giveaways at  stations along the way.  Return to the Rec Center where you'll be dealt one blackjack hand for a chance to win raffles and prizes.  No start time - come anytime between 11:00am until 12:45pm",
"Time: 11:00am - 2:00pm\n \n Location: Holly Pointe Commons\n \n Cost: \$10 - Adults, \$7 - Children under 12 (Rowan Students can use meal plans)\n \n " +
  "Kick off your Sunday in style by joining us for our classic brunch, featuring all your favorite breakfast items, Chef action stations and more.  ",
 "Time: 12:00pm - 2:00pm\n \n Location: The Hollybush Mansion at Rowan University\n \n Cost: Free\n \n " +
  "Join members of the Rowan History Department for an interactive tour of the Hollybush Mansion!  Hollybush has a long and varied history, first as the home of the prominent Whitney family of Glassboro in the mid-1800's, the site of a US and Russia Cold War Summit in 1967 " +
  "and later as a part of Rowan University.  ",
"Time: 2:00 - TBA\n \n Location: Edelman Planetarium, Science Hall\n \n Cost: \$2 - Adults, Children and Senior Citizens (under 16 and over 60), and Rowan Students (with ID)\n \n " +
  "The Family Show series is reccomended for visitors with children 5-10 years old.  The show runs about a half hour, does not include a live presentation and costs only \$2 per person!\n \n Show details and ticket purchases can be found at www.rowan.edu/planetarium",
"Time: 3:00pm - TBA\n \n Location: Edelman Planetarium, Science Hall\n \n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n \n " +
  "Show details and ticket purchases can be found at www.rowan.edu/planetarium"
  ];





  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();





}

class _ScheduleScreenState extends State<ScheduleScreen>{
  var number = 0;

  List<String> getList(){

    switch(number){
      case 1:
        return (widget.fridayEvents);
        break;
      case 2:
        return widget.saturdayEvents;
        break;
      case 3:
        return widget.sundayEvents;
        break;
      default:
        return [];

    }
  }

  List<String> getDescription(){
    switch(number){
      case 1:
        return (widget.friDescription);
        break;
      case 2:
        return widget.satDescription;
        break;
      case 3:
        return widget.sunDescription;
        break;
      default:
        return [];

    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("2018 Family Weekend Dates",
              textAlign: TextAlign.center,
              style: TextStyle(color:RowanBrown)),//ROWAN BROWN COLOR
          automaticallyImplyLeading: true,
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){
                    setState(() {
                      number = 1;

                    });

                  }, child: Text('28th',
                      style: TextStyle(
                          color: RowanBrown
                      )
                  )),
                  TextButton(onPressed: (){ setState(() {
                    number = 2;
                  });}, child: Text('29th',
                      style: TextStyle(
                          color: RowanBrown
                      ))),
                  TextButton(onPressed: (){ setState(() {
                    number = 3;
                  });}, child: Text('30th',
                      style: TextStyle(
                          color: RowanBrown
                      )))

                ],
              ),
              Expanded(child:
              ListView.builder(
                itemCount: getList().length,
                itemBuilder: (context, index){
                  return GestureDetector(
                      child:Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(getList()[index], style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), ),
                        ),

                     ),
                    onTap: () => {
                      showDialog(context: context, builder: (_)=>
                        AlertDialog(
                          title: Text('Event Details'),
                          content: Text(getDescription()[index]),
                          actions: [
                            TextButton(onPressed: (){Navigator.of(context, rootNavigator: true).pop();}, child: Text('Close',
                                style: TextStyle(
                                    color: RowanGold
                                )
                            ))
                          ],
                        )
                      )
                    },
                  );
                },
              )

              )
            ],
          ),
        ));
  }

}

class SponsorsScreen extends StatelessWidget{
// final fridayEvents = ["Registration and Welcome", "5 Friday at the Glassworks Eatery","How to Create a Killer LinkedIn Profile That Will Get You Noticed",
//   "Heather Ujiie: Dystopian Garden Paradise", "Rowan Division III Ice Hockey vs. Rutgers Camden","Laser Pink Floyd: Dark Side of the Moon - Planetarium Show",
//   "Rowan Division II Ice Hockey vs. Virginia Tech","Laser Pink Floyd: Dark Side of the Moon - Planetarium Show", "Drive-in Movie", "Laser Pink Floyd: Dark Side of the Moon - Planetarium Show"
// ];
   final sponsorNames = [
     "Alumni Engagement", "Athletics", "Barnes & Noble", "Edelman Planetarium", "GourmetDining",
   "Harley E. Flack Student Mentoring Program", "History Department", "Office of Career Advancement",
  "Social Justice, Inclusion & Conflict Resolution", "Orientation & Student Leadership Programs",
  "Parent & Family Connections", "Rohrer College of Business", "Rowan University Art Gallery", "Rowan After Hours",
  "Chamberlain Student Center & Campus Activities", "Campus Recreation",
  "WGLS-FM Radio Station", "Museum of Anthropology at Rowan University", "Edelman Fossil Park", "College of Performing Arts", "Wellness Center", "Veterans Affairs", "GreekLife"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("2018 Family Weekend Sponsors",
              textAlign: TextAlign.center,
              style: TextStyle(color:RowanBrown)),//ROWAN BROWN COLOR
          automaticallyImplyLeading: true,
        ),
        body: ListView.builder(
          itemCount: sponsorNames.length,
          itemBuilder: (context, index){
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(sponsorNames[index], style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), ),
              ),
            );
          },
        ));
  }

}