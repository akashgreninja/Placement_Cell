import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:placement_original/event.dart';
import 'package:placement_original/footer.dart';
import 'package:placement_original/services/Database.dart';
import 'package:placement_original/services/sharedPref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_launcher/url_launcher.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey <FormState> createProfileKey = new GlobalKey <FormState> ();

  String name;
  String phno;
  String usn;

  String branch;

  static List <String> branches=[
    'CS',
  'AI',
  'EC',
  'EEE',
  'AI',
  'MECH'
  ];

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

        backgroundColor: Color.fromRGBO(42, 42, 114,0.9 ),
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
                          Database("", "", "", "", "", "")
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
                          _launchURL(
                              'https://rzp.io/l/rotaractRegistration');
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

                  Container(
                    child: Form(
                      key: createProfileKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:10,left:30),
                            child: Text("Enter Your name",style: GoogleFonts.montserrat(fontSize: 22)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5 ),

                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 100, 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter name ",
                                  //labelText: "Full Usn",
                                 focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(width: 3)








                                  ),


                                ),
                                validator: (name) {
                                  if(name.isEmpty){
                                    return "Full name is Required";
                                  }
                                  return null;

                                },
                                onSaved: (val) {
                                  name = val;

                                } ,
                              ),

                            ),

                            ),

                          Padding(
                            padding: const EdgeInsets.only(top:10,left:30),
                            child: Text("Enter Your Phone number",style: GoogleFonts.montserrat(fontSize: 22)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5 ),

                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 100, 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "9845122345 ",
                                  //labelText: "Full Usn",
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(width: 3)
                                  ),
                                ),
                                validator: (phno) {
                                  if(phno.isEmpty){
                                    return "proper usn is Required";
                                  }
                                  if(phno.length !=  10){
                                    return 'invalid Usn';
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  phno = val;

                                } ,
                              ),

                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:10,left:30),
                            child: Text("Enter Your Usn",style: GoogleFonts.montserrat(fontSize: 22)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5 ),

                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 100, 10),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                maxLines: 1,


                                decoration: InputDecoration(
                                  hintText: "9845122345 ",
                                  //labelText: "Full Usn",
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(width: 3)
                                  ),


                                ),
                                validator: (usn) {
                                  if(usn.isEmpty){
                                    return "proper phone number is Required";
                                  }
                                  if(usn.length !=  10){
                                    return 'invalid phno';
                                  }
                                  return null;

                                },
                                onSaved: (val) {
                                  usn = val;

                                } ,
                              ),

                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:10,left:30),
                            child: Text("Enter Your Branch",style: GoogleFonts.montserrat(fontSize: 22)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5 ),

                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 100, 10),
                              child: Autocomplete<String>(
                                optionsBuilder: (TextEditingValue textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<String>.empty();
                                  }
                                  return branches.where((String option) {
                                    return option.toLowerCase()
                                        .startsWith(textEditingValue.text.toLowerCase());
                                  });
                                },
                                onSelected: (String val) {

                                  branch = val;
                                  debugPrint("you selected $branch");

                                },

                              ),

                            ),

                          ),



                          Column(
                            children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.blue),
                              ),
                              onPressed: () {
                                createProfileKey.currentState.save();
                                if(createProfileKey.currentState.validate()){
                                  debugPrint("sucessfully validated");
                                  var uData ={
                                    "name":name,
                                    "phonenumber":phno,
                                    "usn":usn,
                                    "branch":branch,


                                  };
                                  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                                  firebaseFirestore.collection('users').add(uData);

                                }else
                                  {
                                    debugPrint('Please fill the form again');
                                  }
                                // print(name);
                                // print(phno);
                                // print(usn);
                                // print(branch);
                              },
                              child: Text("create profile"),
                            ),
      ],
                          )
                        ],
                      ),
                    ),
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
