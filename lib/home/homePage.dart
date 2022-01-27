import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:placement_original/footer.dart';
import 'package:placement_original/home/imageCarousal.dart';
import 'package:placement_original/services/Database.dart';
import 'package:placement_original/services/sharedPref.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:expansion_card/expansion_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <String> myitems=[
    'Placement',
    'placement2'
  ];

  String _valSemester = 'Placement ';



  List _listSemester = [
    "Placement ",
    "Placement Stats",
    "Alumani feedback",
    "Placement team",
    "Resources",

  ];



  ScrollController _scrollController;
  double _opacity = 0;
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _scrollListener();
    });

    super.initState();
  }

  void scrollCallBack(DragUpdateDetails dragUpdate) {
    setState(() {

      _scrollController.position.moveTo(dragUpdate.globalPosition.dy * 3.5);
    });
  }

  List _isHovering_people = [false, false];
  List _isHovering = [false, false, false, false, false, false, false];
  bool isPopped = false;



  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isScreenSmall = screenSize.width < 800;
    _opacity = _scrollPosition < screenSize.height * 0.4 ? 0.75 : 1.0;
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: isScreenSmall
          ? AppBar(


        title: Image.asset(
          'bitlogo.png',
          fit: BoxFit.contain,
          height: screenSize.height * 0.08,
        ),

        backgroundColor: Color.fromRGBO(42, 42, 114,0.9 ),
      )
          : PreferredSize(
        preferredSize: Size(screenSize.width, screenSize.height * 0.15),
        child: Container(
          height: screenSize.height*0.9,
          child: Card(

            elevation: 10,

            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end:Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.9),
                      Color.fromRGBO(42, 42, 114,0.9 ),
                    ]
                ),
              ),


              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 0, horizontal: screenSize.width * 0.1),

                child: Row(
                  children: [
                    Image.asset('bitlogo.png', height: 250.0),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/');
                            },
                            onHover: (ishoverd) {
                              setState(() {
                                _isHovering[0] = ishoverd;
                              });
                            },
                            child: Text(
                              'Home',
                              style: GoogleFonts.aBeeZee(
                                  color: _isHovering[0]
                                      ? Colors.white
                                      : Colors.white,

                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          SizedBox(width: screenSize.width / 20),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/Facilities');
                            },
                            onHover: (ishoverd) {
                              setState(() {
                                _isHovering[1] = ishoverd;
                              });
                            },
                            child: Text(
                              'Facilities and\nObjectives',
                              style: GoogleFonts.aBeeZee(
                                  color: _isHovering[1]
                                      ? Colors.white
                                      : Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(width: screenSize.width / 20),
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: false,


                              dropdownColor: Color.fromRGBO(42, 42, 114,0.9 ),
                              hint: Text("Pilih Semester"),
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 28,
                              value: _valSemester,

                              items: _listSemester.map((value) {
                                return DropdownMenuItem(


                                  child: Text(value,style: GoogleFonts.aBeeZee(
                                    color: _isHovering[1]
                                    ? Colors.white
                                        : Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600)),
                                  value: value,
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _valSemester = value.toString();
                                  {
                                    if (value == "Placement Stats") {
                                      Navigator.pushReplacementNamed(context, '/Stats');
                                    }

                                  if (value == "Alumani feedback") {
                                    Navigator.pushReplacementNamed(
                                        context, '/Alumani');
                                  }
                                  if (value == "Placement team") {
                                    Navigator.pushReplacementNamed(
                                        context, '/Stats');
                                  }
                                  if (value == "Statistics") {
                                    Navigator.pushReplacementNamed(
                                        context, '/Stats');
                                  }


                                  }


                                });
                              },
                            ),
                          ),

                          // Container(
                          //   height: screenSize.height*0.9,
                          //   width: screenSize.width*0.12,
                          //   child: Expanded(
                          //     child: ExpansionCard(
                          //       borderRadius: 1,
                          //
                          //       title:Row(
                          //         children: [
                          //           Text("Placement"),
                          //
                          //
                          //         ],),
                          //       children: [
                          //         Container(
                          //           height: 20,
                          //           color: Colors.black,
                          //             child: Text("heee;"))
                          //       ],
                          //
                          //
                          //       onExpansionChanged: (onExpand){
                          //         if(onExpand == true){
                          //           setState(() {
                          //
                          //           });
                          //
                          //         }else{
                          //           setState(() {
                          //             color:Colors.white;
                          //           });
                          //         }
                          //       },
                          //
                          //     ),
                          //   ),
                          // ),





                          SizedBox(width: screenSize.width / 20),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/Company');
                            },
                            onHover: (ishoverd) {
                              setState(() {
                                _isHovering[3] = ishoverd;
                              });
                            },
                            child: Text(
                              'Company\nDetails',
                              style: GoogleFonts.aBeeZee(
                                  color: _isHovering[3]
                                      ? Colors.white
                                      : Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600
                                //decoration: TextDecoration.underline
                              ),
                            ),
                          ),
                          SizedBox(width: screenSize.width / 20),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/contact_us');
                            },
                            onHover: (ishoverd) {
                              setState(() {
                                _isHovering[4] = ishoverd;
                              });
                            },
                            child: Text(
                              'Contact Us',
                              style: GoogleFonts.aBeeZee(
                                  color: _isHovering[4]
                                      ? Colors.white
                                      : Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    themeChange.isSignedIn
                        ? DropdownButton<String>(
                      // value: themeChange.username!=null && !themeChange.username.isEmpty?themeChange.username:'Loading',
                      iconSize: 0,
                      value: "DashBoard",
                      elevation: 8,
                      underline: Container(
                        height: 2,
                        color: Colors.transparent,
                      ),
                      onChanged: (val) {
                        setState(() {
                          if (val.compareTo("Sign Out") == 0) {
                            Database( "", "")
                                .signOut();
                            themeChange.username = "";
                            themeChange.email = "";
                            themeChange.isSignedIn = false;
                          } else if (val.compareTo("DashBoard") == 0)
                            Navigator.pushNamed(
                                context, '/dashboard');
                        });
                      },
                      style: GoogleFonts.montserrat(
                        color: Colors.orange,
                      ),
                      items: <String>[
                        'DashBoard',
                        'Sign Out'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                        : Row(
                      children: [


                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          onHover: (val) {
                            setState(() {
                              _isHovering[5] = val;
                            });
                          },


                          child: Text(
                            "Register",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                color: _isHovering[5]
                                    ? Colors.pink
                                    : Colors.orange,
                                fontSize: 17),
                          ),
                        ),



                        SizedBox(
                          width: screenSize.width * 0.01,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          onHover: (val) {
                            setState(() {
                              _isHovering[6] = val;
                            });
                          },
                          child: Text(
                            "Log In",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                color: _isHovering[6]
                                    ? Colors.pink
                                    : Colors.orange,
                                fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: screenSize.width * 0.01),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      drawer: isScreenSmall
          ? Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Image.asset('bitlogo.png',
                  height: 120.0, width: 250.0, scale: 0.1),
                  Text(''),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                 colors: [
                   Color.fromRGBO(0, 0, 0, 0.9),
                   Color.fromRGBO(42, 42, 114,0.9 ),
                 ]
                ),
              )
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home, color: Colors.grey),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Facilities'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pushNamed(context, '/Facilities');
              },
            ),
            ListTile(
              title: Text('Placements'),
              leading: Icon(Icons.calendar_today),
              onTap: () {
                Navigator.pushNamed(context, '/Placements');
              },
            ),
            ListTile(
              title: Text('Company\nDetails'),
              leading: Icon(Icons.people),
              onTap: () {
                Navigator.pushNamed(context, '/Company');
              },
            ),
            ListTile(
              title: Text('Contact us'),
              leading: Icon(Icons.contact_mail),
              onTap: () {
                Navigator.pushNamed(context, '/contact_us');
              },
            ),
            themeChange.isSignedIn
                ? Column(
              children: [
                ListTile(
                  title: Text('DashBoard'),
                  leading: Icon(Icons.person),
                  onTap: () {
                    Navigator.pushNamed(context, '/dashboard');
                  },
                ),
                ListTile(
                  title: Text('Sign Out'),
                  leading: Image.network(
                      'https://img.icons8.com/fluent-systems-regular/24/000000/exit.png'),
                  onTap: () {
                    Database("", "").signOut();
                    themeChange.username = "";
                    themeChange.email = "";
                    themeChange.isSignedIn = false;
                  },
                ),
              ],
            )
                : Column(
              children: [
                ListTile(
                  title: Text('Register'),
                  leading: Icon(Icons.person_add),
                  onTap: () {
                    Navigator.pushNamed(context, '/');

                  },
                ),
                ListTile(
                  title: Text('Log In'),
                  leading: Icon(Icons.person),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ],
            ),
          ],
        ),
      )
          : null,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: Stack(children: [
          Center(
            child: Opacity(
                opacity: 0.4,

                child: Image.asset('college2.jpg',height: 1000,width: 750, )

            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              // color: Theme.of(context).backgroundColor,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        child: SizedBox(
                          width: screenSize.width,
                          height: isScreenSmall
                              ? screenSize.height * 0.1
                              : screenSize.height * 0.1,

                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: isScreenSmall
                            ? screenSize.height * 0.001
                            : screenSize.height * 0.1,
                        left: screenSize.width * 0.1,
                        right: screenSize.width * 0.1),

                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: isScreenSmall
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,

                      children: [




                                 Column(


                                  children: [


                                    Text("congratulations XYZ",style: GoogleFonts.medulaOne(

                                      fontSize: 100.0,letterSpacing: 2.0,
                                      color: Colors.blue[900],

                                    ),

                                    ),


                                    SizedBox(

                                      height: isScreenSmall
                                          ? screenSize.height * 0.3
                                          : screenSize.height * 0.7,
                                      width: isScreenSmall
                                          ? screenSize.width * 0.3
                                          : screenSize.width * 0.3,

                                      child:
                                      Image.asset(
                                        'principal.jpg',

                                        height: isScreenSmall?
                                            screenSize.height*0.2

                                        :screenSize.height*0.5,
                                        width: isScreenSmall?
                                            screenSize.width*0.2
                                        :screenSize.width*0.2,

                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white60,
                                      child:
                                      Text("For securing a package of 20 lakhs",style: GoogleFonts.medulaOne(fontSize: 40,),
                                      ),

                                    )

                                  ],
                                ),




                      ],
                    ),
                  ),

                  SizedBox(height: 100.0),

                  Container(

                    child: ImageCarousal(),
                    height: isScreenSmall
                        ? screenSize.height * 0.3
                        : screenSize.height * 0.7,
                  ),
                  SizedBox(height: isScreenSmall ? 0 : screenSize.height * 0.1),
                  isScreenSmall
                      ? Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        onHover: (isHover) {
                          setState(() {
                            _isHovering_people[0] = isHover;
                          });
                        },
                        child: Card(
                          elevation: _isHovering_people[0] ? 20 : 0,
                          shadowColor: themeChange.darkTheme
                              ? Colors.blue
                              : Colors.orange,
                        )
                      ),

                    ],
                  )
                      : Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [




                      InkWell(
                        onTap: () {},
                        onHover: (isHover) {
                          setState(() {
                            _isHovering_people[1] = isHover;
                          });
                        },

                        child: Card(
                          elevation: _isHovering_people[1] ? 20 : 0,
                          // shadowColor: themeChange.darkTheme
                          //     ? Colors.blue
                          //     : Colors.orange,
                          child: Column(
                            children: [

                              SizedBox(
                                child:
                                Image.asset(
                                  'our-recruiters.jpg',
                                  height: isScreenSmall?
                                      screenSize.height*0.3
                                      :screenSize.height*1.8,


                                ),
                              ),
                              SizedBox(height: 10,),

                              Padding(
                                padding:  EdgeInsets.all(20.0),
                                child: Container(
                                  // color: themeChange.darkTheme
                                  //     ? Colors.blue
                                  //     : Colors.orange,
                                  width: screenSize.width * 0.2,
                                  height: screenSize.height * 0.1,

                                  child: Center(
                                    child: Text(
                                      'Our Recruiters',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.monda(
                                          fontSize: 26.0,
                                          color: themeChange.darkTheme
                                              ? Colors.white
                                              : Colors.grey[900]),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [




                      InkWell(
                        onTap: () {},
                        onHover: (isHover) {
                          setState(() {
                            _isHovering_people[1] = isHover;
                          });
                        },

                        child: Card(
                          elevation: 2.0,
                          child: Row(
                            children: [

                              SizedBox(
                                child:
                                Image.asset(
                                  'rotary_pres.jpg',
                                  height: screenSize.height * 0.1,
                                  width: screenSize.width * 0.2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10,),

                              Padding(
                                padding:  EdgeInsets.all(40.0),
                                child: Container(
                                  width: screenSize.width * 0.2,
                                  height: screenSize.height * 0.1,

                                  child: Center(
                                    child: Text(
                                      'avinash',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.monda(
                                          fontSize: 22.0,
                                          color: themeChange.darkTheme
                                              ? Colors.white
                                              : Colors.grey[900]),
                                    ),
                                  ),

                                ),
                              ),






                            ],
                          ),

                        ),

                      )




                    ],

                  ),
                  Row(

                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [




                      InkWell(
                        onTap: () {},
                        onHover: (isHover) {
                          setState(() {
                            _isHovering_people[1] = isHover;
                          });
                        },

                        child: Card(
                          elevation: 2.0,
                          // shadowColor: themeChange.darkTheme
                          //     ? Colors.blue
                          //     : Colors.orange,
                          child: Row(
                            children: [

                              SizedBox(
                                child:
                                Image.asset(
                                  '',
                                  height: screenSize.height * 0.1,
                                  width: screenSize.width * 0.2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10,),

                              Padding(
                                padding:  EdgeInsets.all(40.0),
                                child:
                                Container(

                                  width: screenSize.width * 0.2,
                                  height: screenSize.height * 0.1,



                                  child:
                                  Center(
                                    child: Text(
                                      'avinash',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.monda(
                                          fontSize: 22.0,
                                          color: themeChange.darkTheme
                                              ? Colors.white
                                              : Colors.grey[900]),
                                    ),
                                  ),

                                ),
                              ),






                            ],
                          ),

                        ),

                      )




                    ],

                  ),








                  Footer()
                ],
              ),
            ),
          ),

        ]),
      ),
      floatingActionButton: isScreenSmall
          ? FloatingActionButton(
        backgroundColor:
        themeChange.darkTheme ? Colors.grey : Colors.black12,
        onPressed: () {
          themeChange.darkTheme = !themeChange.darkTheme;
        },
        child: Icon(Icons.brightness_medium,
            color:
            themeChange.darkTheme ? Colors.white : Colors.grey[800]),
      )
          : null,
    );
  }
}
