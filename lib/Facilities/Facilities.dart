import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:placement_original/event.dart';
import 'package:placement_original/footer.dart';
import 'package:placement_original/services/Database.dart';
import 'package:placement_original/services/sharedPref.dart';

import 'package:url_launcher/url_launcher.dart';

class Facilities extends StatefulWidget {
  @override
  _FacilitiesState createState() => _FacilitiesState();
}

class _FacilitiesState extends State<Facilities> {
  ScrollController _scrollController;
  double _opacity = 0;
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  List _isHovering = [false, false, false, false, false, false, false];
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isScreenSmall = screenSize.width < 800;
    _opacity = _scrollPosition < screenSize.height * 0.4 ? 0.75 : 1.0;
    // print(screenSize.height*0.45);
    // print(screenSize.width);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    // Future.delayed(
    //     Duration.zero,
    //     () => !isPopped
    //         ? showDialog(
    //             context: context,
    //             builder: (context) => AlertDialog(
    //                   title: Container(
    //                       height: 600,
    //                       width: 480,
    //                       child:
    //                           Center(child: Image.asset('Trade-itional.png'))),
    //                   actions: [
    //                     TextButton(
    //                         onPressed: () {
    //                           Navigator.of(context).pop();
    //
    //                           setState(() {
    //                             isPopped = true;
    //                           });
    //                         },
    //                         child: Text('Close'))
    //                   ],
    //                 ))
    //         : null);
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: isScreenSmall
          ? AppBar(
        title: Image.asset(
          'bitlogo.png',
          fit: BoxFit.contain,
          height: screenSize.height * 0.08,
        ),
        backgroundColor: Colors.grey.withOpacity(_opacity),
      )
          : PreferredSize(
        preferredSize: Size(screenSize.width, screenSize.height * 0.15),
        child: Card(

          elevation: 10,

          // color: Color.fromRGBO(0, 51, 102, 0.9),
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
                            Navigator.pushNamed(context, '/events');
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
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/Placements');
                          },
                          onHover: (ishoverd) {
                            setState(() {
                              _isHovering[2] = ishoverd;
                            });
                          },
                          child:

                          Text(
                            'Placements',
                            style: GoogleFonts.aBeeZee(
                                color: _isHovering[2]
                                    ? Colors.white
                                    : Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600),


                          ),

                        ),

                        IconButton(onPressed: () {
                          Navigator.pushNamed(context, '/Stats');
                        },

                            icon:Icon(Icons.arrow_drop_down)),
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
                  // themeChange.isSignedIn
                  //     ? DropdownButton<String>(
                  //         // value: themeChange.username!=null && !themeChange.username.isEmpty?themeChange.username:'Loading',
                  //         iconSize: 0,
                  //         value: "DashBoard",
                  //         elevation: 8,
                  //         underline: Container(
                  //           height: 2,
                  //           color: Colors.transparent,
                  //         ),
                  //         onChanged: (val) {
                  //           setState(() {
                  //             if (val.compareTo("Sign Out") == 0) {
                  //               Database("", "", "", "", "", "")
                  //                   .signOut();
                  //               themeChange.username = "";
                  //               themeChange.email = "";
                  //               themeChange.isSignedIn = false;
                  //             } else if (val.compareTo("DashBoard") == 0)
                  //               Navigator.pushNamed(
                  //                   context, '/dashboard');
                  //           });
                  //         },
                  //         style: GoogleFonts.montserrat(
                  //           color: Colors.orange,
                  //         ),
                  //         items: <String>[
                  //           'DashBoard',
                  //           'Sign Out'
                  //         ].map<DropdownMenuItem<String>>((String value) {
                  //           return DropdownMenuItem<String>(
                  //             value: value,
                  //             child: Text(value),
                  //           );
                  //         }).toList(),
                  //       )
                  //     : Row(
                  //         children: [
                  //           InkWell(
                  //             onTap: () {
                  //               _launchURL(
                  //                   'https://rzp.io/l/rotaractRegistration');
                  //             },
                  //             onHover: (val) {
                  //               setState(() {
                  //                 _isHovering[5] = val;
                  //               });
                  //             },
                  //             child: Text(
                  //               "Register",
                  //               style: GoogleFonts.openSans(
                  //                   fontWeight: FontWeight.w400,
                  //                   color: _isHovering[5]
                  //                       ? Colors.pink
                  //                       : Colors.orange,
                  //                   fontSize: 17),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: screenSize.width * 0.01,
                  //           ),
                  //           InkWell(
                  //             onTap: () {
                  //               Navigator.pushNamed(context, '/login');
                  //             },
                  //             onHover: (val) {
                  //               setState(() {
                  //                 _isHovering[6] = val;
                  //               });
                  //             },
                  //             child: Text(
                  //               "Log In",
                  //               style: GoogleFonts.openSans(
                  //                   fontWeight: FontWeight.w400,
                  //                   color: _isHovering[6]
                  //                       ? Colors.pink
                  //                       : Colors.orange,
                  //                   fontSize: 17),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  // SizedBox(width: screenSize.width * 0.01),
                  // IconButton(
                  //   icon: Icon(Icons.brightness_medium,
                  //       color: themeChange.darkTheme
                  //           ? Colors.white
                  //           : Colors.grey[400]),
                  //   onPressed: () {
                  //     themeChange.darkTheme = !themeChange.darkTheme;
                  //   },
                  // )
                ],
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
                  Text('henloooooo'),
                ],
              ),
              decoration: BoxDecoration(
                  color: themeChange.darkTheme
                      ? Colors.grey[400]
                      : Colors.grey[900],
                  shape: BoxShape.rectangle),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Rotary'),
              leading: Icon(Icons.settings, color: Colors.orange),
              onTap: () {
                Navigator.pushNamed(context, '/rotary');
              },
              focusColor: Colors.grey[600],
            ),
            ListTile(
              title: Text('Events'),
              leading: Icon(Icons.calendar_today),
              onTap: () {
                Navigator.pushNamed(context, '/events');
              },
            ),
            ListTile(
              title: Text('Board'),
              leading: Icon(Icons.people),
              onTap: () {
                Navigator.pushNamed(context, '/board');
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
                    Database("", "", "", "", "", "").signOut();
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
                    _launchURL(
                        'https://rzp.io/l/rotaractRegistration');
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
      // extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).backgroundColor,

      body: Stack(
        children: [
          // Center(
          //   child: Opacity(
          //     opacity: 0.4,
          //     child: themeChange.darkTheme
          //         ? Image.asset('roarlikeone.png')
          //         : Image.asset('roarlikeone.png'),
          //   ),
          // ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              // color: Theme.of(context).backgroundColor,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding:EdgeInsets.all(10),
                        child: Container(
                          height: screenSize.height*0.1,


                          width: screenSize.width,
                          // child: Image.asset(
                          //   themeChange.darkTheme
                          //       ? 'placementgraph3.jpg'
                          //       : 'placementgraph3.jpg',
                          //   height: screenSize.height * 0.9,
                          //   width: screenSize.width * 0.9,
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                    ],
                  ),

                     Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: screenSize.height * 0.01,
                          horizontal:
                          isScreenSmall ? 16 : screenSize.width * 0.2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [


                          SizedBox(height: 60,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [


                                 Image.asset('pic2.jpg',
                                    fit: BoxFit.contain, width: 300.0, scale: 0.01),
                                


                            ],
                          ),


                           Text("Placement cell",style:GoogleFonts.lato(fontSize: 30,letterSpacing: 2.0,color: Colors.blue,fontWeight: FontWeight.bold),),
                          SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff000000),
                                      width: 2,

                                    )),
                              child:Image.asset('pic2.jpg',fit: BoxFit.contain, width: 300.0, scale: 0.01),),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff000000),
                                      width: 2,

                                    )),
                                child:Image.asset('pic2.jpg',fit: BoxFit.contain, width: 300.0, scale: 0.01),),











                            ],
                          ),
                          SizedBox(height: 50,),




                          // Container(
                          //   color: Colors.blue,
                          //   padding: EdgeInsets.symmetric(
                          //       vertical: 10.0, horizontal: 11.0),
                          //   child: FlatButton(
                          //     onPressed: () {
                          //
                          //     },
                          //     child: Text(
                          //       'Placement Statistics In The Recent Years',
                          //       style: TextStyle(
                          //           color: themeChange.darkTheme
                          //               ? Colors.black
                          //               : Colors.black,
                          //           fontSize: 40.0,
                          //           letterSpacing: 2.0,fontWeight: FontWeight.bold),
                          //     ),
                          //   ),
                          //
                          //
                          // ),
                          // SizedBox(height: 10,),
                          // FlatButton(
                          //   onPressed: () {_launchURL('https://bit-bangalore.edu.in/wp-content/uploads/2021/10/PLACEMENTS.pdf');
                          //
                          //   },
                          //   child:  Text("Companies that visited BIT to recruit students of 2022 batch",style:
                          //   TextStyle(fontSize: 20),
                          //   ),
                          // ),
                          // SizedBox(height: 5),
                          // FlatButton(
                          //   onPressed: () {_launchURL('https://bit-bangalore.edu.in/wp-content/uploads/2021/07/Companies-during-2021.pdf');
                          //
                          //   },
                          //   child:  Text("Companies that visited BIT to recruit students of 2021 batch",style:
                          //   TextStyle(fontSize: 20),
                          //   ),
                          // ),
                          // SizedBox(height: 5),
                          // FlatButton(
                          //   onPressed: () {_launchURL('https://bit-bangalore.edu.in/wp-content/uploads/2021/07/Companies-during-2020.pdf');
                          //
                          //   },
                          //   child:  Text("Companies that visited BIT to recruit students of 2020 batch",style:
                          //   TextStyle(fontSize: 20),
                          //   ),
                          // ),
                          // SizedBox(height: 5),
                          // FlatButton(
                          //   onPressed: () {_launchURL('https://bit-bangalore.edu.in/wp-content/uploads/2020/12/Companies-during-2019.pdf');
                          //
                          //   },
                          //   child:  Text("Companies that visited BIT to recruit students of 2019 batch",style:
                          //   TextStyle(fontSize: 20),
                          //   ),
                          // ),
                          // SizedBox(height: 5),
                          // FlatButton(
                          //   onPressed: () {_launchURL('https://bit-bangalore.edu.in/wp-content/uploads/2020/11/Companies-during-2018new.pdf');
                          //
                          //   },
                          //   child:  Text("Companies that visited BIT to recruit students of 2018 batch",style:
                          //   TextStyle(fontSize: 20),
                          //   ),
                          // ),
                          // SizedBox(height: 5),
                          // FlatButton(
                          //   onPressed: () {_launchURL('https://bit-bangalore.edu.in/wp-content/uploads/2020/11/Companies-during-2017.pdf');
                          //
                          //   },
                          //   child:  Text("Companies that visited BIT to recruit students of 2017 batch",style:
                          //   TextStyle(fontSize: 20),
                          //   ),
                          // ),
                          // Container(
                          //   color: Colors.blue,
                          //   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          //   child:  Text("BATCH WISE PLACEMENTS",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,letterSpacing: 2.0),),
                          //
                          // ),
                          // SizedBox(height: 5),
                          // FlatButton(
                          //   onPressed: () {_launchURL('https://bit-bangalore.edu.in/wp-content/uploads/2021/06/Placement-Details-2020.xlsx-Sheet2.pdf');
                          //
                          //   },
                          //   child:  Text("Placement Details-2020",style:
                          //   TextStyle(fontSize: 20),
                          //   ),
                          // ),
                          // SizedBox(height: 5),
                          // FlatButton(
                          //   onPressed: () {_launchURL('https://bit-bangalore.edu.in/wp-content/uploads/2019/08/Placemnet-Details-2019-2019-final-1.pdf');
                          //
                          //   },
                          //   child:  Text('Placement Details-2019',style:
                          //   TextStyle(fontSize: 20),
                          //   ),
                          // ),
                          // SizedBox(height: 5),
                          // FlatButton(
                          //   onPressed: () {_launchURL('https://bit-bangalore.edu.in/wp-content/uploads/2019/09/Placemnet-Details-2018-Final-.pdf');
                          //
                          //   },
                          //   child:  Text("Placement Details-2018",style:
                          //   TextStyle(fontSize: 20),
                          //   ),
                          // ),
                          // SizedBox(height: 5),
                          // FlatButton(
                          //   onPressed: () {_launchURL('https://bit-bangalore.edu.in/wp-content/uploads/2019/09/Placemnet-Details-2018-Final-.pdf');
                          //
                          //   },
                          //   child:  Text("Companies that visited BIT to recruit students of 2017 batch",style:
                          //   TextStyle(fontSize: 20),
                          //   ),
                          // ),
                          // Image.asset("placementgraph.jpg"),
                          //  SizedBox(height: 50.0),
                          //  Text(
                          //      'Rotary was founded in the early 1900s in Chicago Illinois by Paul Harris. The origin of the name is that the meetings would rotate between the Members of individual offices, once the club became too big for this they chose a permanent location for their meetings. Rotary is divided into a federalist or charter system with 35,000 clubs that meet every week all around the world; 530 districts that manage individual clubs, charter new ones, and maintain the link between Rotary International and the clubs. Moreover, there are 34 zones that break up the world in manageable chunks and help with some of the international functions as well as the infrastructure needed by the districts and clubs.',
                          //      style: GoogleFonts.poppins(
                          //        // fontFamily: 'Bahnschrift',
                          //        //sans can also be tried
                          //          fontSize: 20.0,
                          //          letterSpacing: 0.5,
                          //          color: themeChange.darkTheme
                          //              ? Colors.grey[400]
                          //              : Colors.grey[900])),
                          //  SizedBox(height: 100.0),
                          //  Image.asset('rbse_logo.png',
                          //      width: 450.0, fit: BoxFit.contain, scale: 0.01),
                          //  Container(
                          //    color: Theme.of(context).buttonColor,
                          //    padding: EdgeInsets.symmetric(
                          //        vertical: 10.0, horizontal: 11.0),
                          //    child: FlatButton(
                          //      onPressed: () {
                          //        _launchURL(
                          //            'https://www.instagram.com/p/CCymeL_gJEv/');
                          //      },
                          //      child: Text(
                          //        'Rotary Bangalore Agneya',
                          //        style: TextStyle(
                          //          fontFamily: 'Bahnschrift',
                          //          //sans can also be tried
                          //          fontSize: 20.0,
                          //          letterSpacing: 0.5,
                          //          color: themeChange.darkTheme
                          //              ? Colors.orange
                          //              : Color(0xff3B3B3B),
                          //        ),
                          //      ),
                          //    ),
                          //  ),
                          //  SizedBox(height: 50.0),
                          //  Text(
                          //      "Rotary Bangalore Agneya (RBA) is a club under the umbrella of Rotary International, a non-profit organization. Rotary International is perhaps the largest collection of organized volunteers in the world. Rotary International is divided into districts, which are then sub-divided into clubs.\nRBSE was chartered in the year 2000 as a Rotary club, a mark to begin the millennium. The club today, has 30 members and over the years executed thousands of non-profit projects along with its various youth wings.\nCurrently, the youth wings under RBSE are:",
                          //      style: GoogleFonts.poppins(
                          //        // fontFamily: 'Bahnschrift',
                          //        //sans can also be tried
                          //          fontSize: 20.0,
                          //          letterSpacing: 0.5,
                          //          color: themeChange.darkTheme
                          //              ? Colors.grey[400]
                          //              : Colors.grey[900])),
                          //  SizedBox(
                          //    height: 10,
                          //  ),
                          //  Padding(
                          //    padding: EdgeInsets.symmetric(
                          //        horizontal: isScreenSmall
                          //            ? 16
                          //            : screenSize.width * 0.04),
                          //    child: Column(
                          //      crossAxisAlignment: CrossAxisAlignment.start,
                          //      children: [
                          //        Text('1. Rotaract Club of Bangalore B.I.T.',
                          //            style: GoogleFonts.robotoCondensed(
                          //              // fontFamily: 'Bahnschrift',
                          //              //sans can also be tried
                          //                fontSize: 24,
                          //                letterSpacing: 0.8,
                          //                color: themeChange.darkTheme
                          //                    ? Colors.grey[400]
                          //                    : Colors.grey[900])),
                          //        Text(
                          //            '2. Rotaract Club of Bangalore South East.',
                          //            style: GoogleFonts.robotoCondensed(
                          //              // fontFamily: 'Bahnschrift',
                          //              //sans can also be tried
                          //                fontSize: 24,
                          //                letterSpacing: 0.8,
                          //                color: themeChange.darkTheme
                          //                    ? Colors.grey[400]
                          //                    : Colors.grey[900])),
                          //        // Text(
                          //        //     '3. Interact club of Shantiniketan Educational Institutions.',
                          //        //     style: GoogleFonts.robotoCondensed(
                          //        //       // fontFamily: 'Bahnschrift',
                          //        //       //sans can also be tried
                          //        //         fontSize: 24,
                          //        //         letterSpacing: 0.8,
                          //        //         color: themeChange.darkTheme
                          //        //             ? Colors.grey[400]
                          //        //             : Colors.grey[900])),
                          //      ],
                          //    ),
                          //  ),
                          //  SizedBox(
                          //    height: 10,
                          // ),
                          // Text(
                          //     "We at RBSE, have been instrumental in many signature projects along with our enthusiastic youth wings. Some of them are:-",
                          //     style: GoogleFonts.poppins(
                          //       // fontFamily: 'Bahnschrift',
                          //       //sans can also be tried
                          //         fontSize: 20.0,
                          //         letterSpacing: 0.5,
                          //         color: themeChange.darkTheme
                          //             ? Colors.grey[400]
                          //             : Colors.grey[900])),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: isScreenSmall
                          //           ? 16
                          //           : screenSize.width * 0.04,
                          //       vertical: 10),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       InkWell(
                          //         child: Text(
                          //             '1. PRISM(Pro-active Rotary Innovative Science and Math) centres in Government High Schools. Read More...',
                          //             style: GoogleFonts.robotoCondensed(
                          //               // fontFamily: 'Bahnschrift',
                          //               //sans can also be tried
                          //                 fontSize: 22,
                          //                 letterSpacing: 0.8,
                          //                 color: themeChange.darkTheme
                          //                     ? Colors.grey[400]
                          //                     : Colors.grey[900])),
                          //         onHover: null,
                          //         onTap: () {
                          //           Navigator.pushNamed(context, '/prism');
                          //         },
                          //       ),
                          //       Text(
                          //           '2. SME(Small and medium-sized enterprises) awards',
                          //           style: GoogleFonts.robotoCondensed(
                          //             // fontFamily: 'Bahnschrift',
                          //             //sans can also be tried
                          //               fontSize: 22,
                          //               letterSpacing: 0.8,
                          //               color: themeChange.darkTheme
                          //                   ? Colors.grey[400]
                          //                   : Colors.grey[900])),
                          //       Text(
                          //           '3. Musical Concerts- RB Burman team, SP Balasubhramanyam etc.',
                          //           style: GoogleFonts.robotoCondensed(
                          //             // fontFamily: 'Bahnschrift',
                          //             //sans can also be tried
                          //               fontSize: 22,
                          //               letterSpacing: 0.8,
                          //               color: themeChange.darkTheme
                          //                   ? Colors.grey[400]
                          //                   : Colors.grey[900])),
                          //       Text(
                          //           '4. NID (National Immunization Day): Eradication of Polio through yearly pulse polio drive.',
                          //           style: GoogleFonts.robotoCondensed(
                          //             // fontFamily: 'Bahnschrift',
                          //             //sans can also be tried
                          //               fontSize: 22,
                          //               letterSpacing: 0.8,
                          //               color: themeChange.darkTheme
                          //                   ? Colors.grey[400]
                          //                   : Colors.grey[900])),
                          //       Text(
                          //           '5. Teachers Recognitions: Nation Builder Award, Gurudakshine',
                          //           style: GoogleFonts.robotoCondensed(
                          //             // fontFamily: 'Bahnschrift',
                          //             //sans can also be tried
                          //               fontSize: 22,
                          //               letterSpacing: 0.8,
                          //               color: themeChange.darkTheme
                          //                   ? Colors.grey[400]
                          //                   : Colors.grey[900])),
                          //     ],
                          //   ),
                          // ),
                          // Text(
                          //     "Similarly, each of our youth wings have their own projects that happen every year with a fresh Board of Directors. The board is formed internally by the students or the teachers and an experience of professionalism and philanthropy follows during their tenure.\nRBSE will always strive to make the world a joyous place for everyone, irrespective of religion, colour, gender or age. The lasting impression Rotary imbibes on its members, youth participants, volunteers and teachers is truly remarkable and a driving factor in all our philanthropic and personal successes. Join us, on this wonderful journey that lasts a lifetime to change innumerable lives for the better.",
                          //     style: GoogleFonts.poppins(
                          //       // fontFamily: 'Bahnschrift',
                          //       //sans can also be tried
                          //         fontSize: 20.0,
                          //         letterSpacing: 0.5,
                          //         color: themeChange.darkTheme
                          //             ? Colors.grey[400]
                          //             : Colors.grey[900])),
                          // SizedBox(height: 100.0),
                          // Image.asset('title_logo.png',
                          //     width: 650.0, scale: 0.01),
                          // Container(
                          //   color: Theme.of(context).buttonColor,
                          //   padding: EdgeInsets.symmetric(
                          //       vertical: 10.0, horizontal: 11.0),
                          //   child: FlatButton(
                          //     onPressed: () {
                          //       Navigator.pushReplacementNamed(context, '/');
                          //     },
                          //     child: Text(
                          //       'Rotaract Club of Bangalore B.I.T.',
                          //       style: TextStyle(
                          //         fontSize: 18.0,
                          //         color: themeChange.darkTheme
                          //             ? Colors.orange
                          //             : Color(0xff3B3B3B),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(height: 50.0),
                          // Text(
                          //     "Rotaract Club of Bangalore BIT was founded in 2011. It is a part of global effort to bring peace and happiness though service, by the students of Bangalore Institute of Technology, with the support of Rotaract. It is affiliated to Rotary International District 3190 and it’s one of the most active clubs in the college which brings together students to take action in their communities, develop their leadership and professional skills. The club is sponsored by Rotary Bangalore Agneya, our parent Rotary Club. Our club gives an opportunity to connect with young leaders in the community, while simultaneously building personal skills.",
                          //     style: GoogleFonts.poppins(
                          //       // fontFamily: 'Bahnschrift',
                          //       //sans can also be tried
                          //         fontSize: 20.0,
                          //         letterSpacing: 0.5,
                          //         color: themeChange.darkTheme
                          //             ? Colors.grey[400]
                          //             : Colors.grey[900])),

                        ],
                      ),

                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 5, 5, 5),
                        child: Text("Objectives :-",style: TextStyle(
                          fontSize: 70,decoration: TextDecoration.underline,
                        ),),
                      ),
                    ],
                  ),


                  Footer()
                ],
              ),
            ),
          ),
        ],
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
