import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:placement_original/DashBoard/dashboard.dart';
import 'package:placement_original/Loading/loading.dart';
import 'package:placement_original/Register/razorpayWeb.dart';
import 'package:placement_original/footer.dart';
import 'package:placement_original/services/Database.dart';
import 'package:placement_original/services/sharedPref.dart';
import 'package:url_launcher/url_launcher.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  ScrollController _scrollController;
  double _opacity = 0;
  double _scrollPosition = 0;
  final _formKey = GlobalKey<FormState>();

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  List _isHovering = [false, false, false, false, false, false];
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
  }

  String name = "";
  String email = "";
  String usn = "";
  String phone = "";
  String conf_phone = "";
  String registeration_id = "";
  String password = "";
  String conf_pass = "";
  bool _isLoading = false;
  bool _hasError = false;
  bool _isDone = false;
  List<bool> _isHoveringOptions = [false, false];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isScreenSmall = screenSize.width < 800;
    _opacity = _scrollPosition < screenSize.height * 0.4 ? 0.75 : 1;
    final themeChange = Provider.of<DarkThemeProvider>(context);
    Map arguments = ModalRoute.of(context).settings.arguments as Map;
    _hasError = arguments == null || arguments.length == 0
        ? _hasError
        : arguments['hasError'];
    _isDone = arguments == null || arguments.length == 0
        ? _isDone
        : arguments['isDone'];
    registeration_id = arguments == null || arguments.length < 2
        ? registeration_id
        : arguments['regisration_id'];
    // print(_hasError);
    return themeChange.isSignedIn
        ? DashBoard()
        : Scaffold(
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
        preferredSize:
        Size(screenSize.width, screenSize.height * 0.15),
        child: Card(
          // color: Colors.grey[900].withOpacity(_opacity),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.9),
                  Color.fromRGBO(42, 42, 114,0.9 ),
                ]
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: screenSize.width * 0.1),
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
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600),
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
                            'Facilities',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(width: screenSize.width / 20),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/placements');
                          },
                          onHover: (ishoverd) {
                            setState(() {
                              _isHovering[2] = ishoverd;
                            });
                          },
                          child: Text(
                            'placements',
                            style: TextStyle(
                                color: Colors.white,
                                decoration:
                                TextDecoration.underline,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
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
                            'Company\ndetails',
                            style: TextStyle(
                                color:Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(width: screenSize.width / 20),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/contact_us');
                          },
                          onHover: (ishoverd) {
                            setState(() {
                              _isHovering[4] = ishoverd;
                            });
                          },
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    onHover: (val) {
                      setState(() {
                        _isHovering[5] = val;
                      });
                    },
                    child: Text(
                      "Log In",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w400,
                          color: _isHovering[5]
                              ? Colors.pink
                              : Colors.orange,
                          fontSize: 17),
                    ),
                  ),
                  SizedBox(width: screenSize.width * 0.01),
                  IconButton(
                    icon: Icon(Icons.brightness_medium,
                        color: themeChange.darkTheme
                            ? Colors.white
                            : Colors.grey[400]),
                    onPressed: () {
                      themeChange.darkTheme =
                      !themeChange.darkTheme;
                    },
                  )
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
                  Image.asset('',
                      height: 120.0, width: 250.0, scale: 0.1),
                  Text('waaa'),
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
              leading: Icon(Icons.settings),
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
                    Navigator.pushNamed(
                        context, '/dashboard');
                  },
                ),
                ListTile(
                  title: Text('Sign Out'),
                  leading: Image.network(
                      'https://img.icons8.com/fluent-systems-regular/24/000000/exit.png'),
                  onTap: () {
                    Database("", "", "", "", "", "")
                        .signOut();
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
                  leading: Icon(Icons.person_add,
                      color: Colors.orange),
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
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
          Center(
            child: Opacity(
              opacity: 0.4,
              // child: themeChange.darkTheme
              //     ? Image.asset('rcbit_logo.png')
              //     : Image.asset('blue_rcbit_logo.png'),
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
                        height: isScreenSmall
                            ? screenSize.height * 0.40
                            : screenSize.height * 0.001,
                        width: screenSize.width,
                        // child: Image.asset(
                        //     themeChange.darkTheme
                        //         ? 'celeberation_image.webp'
                        //         : 'celeberation_image_orange.webp',
                        //     fit: isScreenSmall
                        //         ? BoxFit.fill
                        //         : BoxFit.cover),
                      )
                    ],
                  ),
                  isScreenSmall
                      ? _isLoading
                      ? Container(
                    height: MediaQuery.of(context).size.height*0.01,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: SpinKitRing(
                        color: Colors.lightGreenAccent,
                        size: 50.0,
                      ),
                    ),
                  )
                      : _hasError
                      ? Container(
                    child: SelectableText(
                        'Hey $name, Thank you for trying but we faced some technical issues. Please try again and if any amount is deducted then it will be refunded within 5-7 business days. '),
                  )
                      : Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: isScreenSmall
                            ? screenSize.height * 0.05
                            : screenSize.height * 0.2,
                        horizontal: 16),
                    child: _isDone
                        ? Container(
                      height: screenSize.height * 0.5,
                      width: screenSize.width,
                      child: Column(
                        mainAxisSize:
                        MainAxisSize.max,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rtr. $name, Welcome to Rotaract Family. Your application id is :\n",
                            style: TextStyle(
                                fontSize: 20),
                          ),
                          SelectableText(
                            registeration_id ==
                                null ||
                                registeration_id
                                    .length ==
                                    0
                                ? "Not generated yet, It will be sent you soon"
                                : registeration_id,
                            style: GoogleFonts
                                .montserrat(
                                fontSize: 22),
                          ),
                          SizedBox(
                            height:
                            screenSize.height *
                                0.02,
                          ),
                          RaisedButton(
                            elevation: 2,
                            color:
                            themeChange.darkTheme
                                ? Colors.orange
                                : Colors.white,
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(
                                      text:
                                      registeration_id));
                            },
                            child: Text(
                              "Copy to Clipboard",
                              style: GoogleFonts.roboto(
                                  fontWeight:
                                  FontWeight.w600,
                                  fontSize: 16,
                                  color: themeChange
                                      .darkTheme
                                      ? Colors
                                      .grey[400]
                                      : Colors.blue),
                            ),
                          ),
                          SizedBox(
                            height:
                            screenSize.height *
                                0.1,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize:
                              MainAxisSize.max,
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceAround,
                              children: [
                                InkWell(
                                  onHover: (val) {
                                    setState(() {
                                      _isHoveringOptions[
                                      0] = val;
                                    });
                                  },
                                  child: Text(
                                    "New Registeration",
                                    style: TextStyle(
                                        color: _isHoveringOptions[
                                        0]
                                            ? Colors.blue[
                                        800]
                                            : Colors
                                            .orange,
                                        fontSize: 20),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      Navigator
                                          .pushReplacementNamed(
                                          context,
                                          '/register');
                                    });
                                  },
                                ),
                                InkWell(
                                  onHover: (val) {
                                    setState(() {
                                      _isHoveringOptions[
                                      1] = val;
                                    });
                                  },
                                  child: Text(
                                    "Go Back to Home",
                                    style: TextStyle(
                                        color: _isHoveringOptions[
                                        1]
                                            ? Colors.blue[
                                        800]
                                            : Colors
                                            .orange,
                                        fontSize: 20),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      Navigator
                                          .pushReplacementNamed(
                                          context,
                                          '/');
                                    });
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                        : Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: GoogleFonts
                                .montserrat(
                                fontSize: 24),
                          ),
                          TextFormField(
                            keyboardType:
                            TextInputType.name,
                            decoration:
                            InputDecoration(
                              hintText:
                              'Enter Your Name',
                            ),
                            onChanged: (val) {
                              setState(() {
                                name = val;
                              });
                            },
                            maxLines: 1,
                            autovalidate: false,
                          ),
                          SizedBox(
                            height:
                            screenSize.height *
                                0.08,
                          ),
                          Text(
                            'Email-Id',
                            style: GoogleFonts
                                .montserrat(
                                fontSize: 24),
                          ),
                          TextFormField(
                            keyboardType:
                            TextInputType
                                .emailAddress,
                            decoration:
                            InputDecoration(
                              hintText:
                              'Enter your email id',
                            ),
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            maxLines: 1,
                            autovalidate: true,
                          ),
                          SizedBox(
                            height:
                            screenSize.height *
                                0.08,
                          ),
                          Text(
                            'Phone number',
                            style: GoogleFonts
                                .montserrat(
                                fontSize: 24),
                          ),
                          TextFormField(
                            minLines: 1,
                            validator: (val) => val
                                .length ==
                                10
                                ? null
                                : "Enter Valid mobile number",
                            keyboardType:
                            TextInputType.phone,
                            inputFormatters: [
                              WhitelistingTextInputFormatter(
                                  RegExp(
                                      r'^[0-9]*$')),
                              LengthLimitingTextInputFormatter(
                                  10)
                            ],
                            decoration:
                            InputDecoration(
                              hintText:
                              'Enter Phone number',
                            ),
                            onChanged: (val) {
                              setState(() {
                                phone = val;
                              });
                            },
                            onSaved: (val) {
                              setState(() {
                                phone = val;
                                print(phone);
                              });
                            },
                            obscureText: true,
                            autovalidate: true,
                          ),
                          SizedBox(
                            height:
                            screenSize.height *
                                0.08,
                          ),
                          Text(
                            'Confirm Phone number',
                            style: GoogleFonts
                                .montserrat(
                                fontSize: 24),
                          ),
                          TextFormField(
                            keyboardType:
                            TextInputType
                                .emailAddress,
                            decoration:
                            InputDecoration(
                              hintText:
                              'Confirm your phone number',
                            ),
                            validator: (val) => val ==
                                phone
                                ? null
                                : "Phone number not matched",
                            onChanged: (val) {
                              setState(() {
                                conf_phone = val;
                              });
                            },
                            autovalidate: false,
                          ),
                          SizedBox(
                            height:
                            screenSize.height *
                                0.08,
                          ),
                          Text(
                            'USN (1st Year students write \'NA\')',
                            style: GoogleFonts
                                .montserrat(
                                fontSize: 24),
                          ),
                          TextFormField(
                            keyboardType:
                            TextInputType
                                .emailAddress,
                            decoration:
                            InputDecoration(
                              hintText:
                              'Enter your University Serial number',
                            ),
                            onChanged: (val) {
                              setState(() {
                                usn = val;
                              });
                            },
                            validator: (val) => val
                                .length ==
                                10 ||
                                val.toString() ==
                                    'NA'
                                ? null
                                : "Enter Correct USN",
                            autovalidate: false,
                          ),
                          SizedBox(
                            height:
                            screenSize.height *
                                0.02,
                          ),
                          // Text(
                          //   'Password',
                          //   style: GoogleFonts.montserrat(
                          //       fontSize: 22
                          //   ),
                          // ),
                          // TextFormField(
                          //   minLines: 1,
                          //   validator: (val) => val.length==10?null:"Enter Strong Password",
                          //   keyboardType: TextInputType.phone,
                          //   decoration: InputDecoration(
                          //     hintText: 'Enter Strong Password',
                          //   ),
                          //   onChanged: (val) {
                          //     setState(() {
                          //       password = val;
                          //     });
                          //   },
                          //   onSaved: (val) {
                          //     setState(() {
                          //       password = val;
                          //     });
                          //   },
                          //   obscureText: true,
                          //   autovalidate: true,
                          // ),
                          // SizedBox(
                          //   height: screenSize.height*0.08 ,
                          // ),
                          // Text(
                          //   'Confirm Password',
                          //   style: GoogleFonts.montserrat(
                          //       fontSize: 22
                          //   ),
                          // ),
                          // TextFormField(
                          //   keyboardType: TextInputType.emailAddress,
                          //   decoration: InputDecoration(
                          //     hintText: 'Confirm Password',
                          //   ),
                          //   validator: (val) => val==password?null: "Phone number not matched",
                          //   onChanged: (val) {
                          //     setState(() {
                          //       conf_pass = val;
                          //     });
                          //   },
                          //   autovalidate: false,
                          // ),
                          // SizedBox(
                          //   height: screenSize.height*0.08 ,
                          // ),
                          Padding(
                              padding:
                              EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  RaisedButton(
                                    color: themeChange
                                        .darkTheme
                                        ? Colors.orange
                                        : Colors.white,
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                          color: themeChange
                                              .darkTheme
                                              ? Colors
                                              .grey[400]
                                              : Colors
                                              .blue),
                                    ),
                                    elevation: 2,
                                    onPressed: () {
                                      if (_formKey
                                          .currentState
                                          .validate()) {
                                        print(name);
                                        Navigator.pushNamed(
                                            context,
                                            '/payment',
                                            arguments: {
                                              'name': name,
                                              'email':
                                              email,
                                              'phone':
                                              phone,
                                              'usn': usn,
                                            });
                                      }
                                    },
                                    // onPressed: () async {
                                    //   if(_formKey.currentState.validate()){
                                    //     dynamic res = await Database(name, phone, email, usn,password, "").register();
                                    //     setState(() {
                                    //       _isLoading = true;
                                    //     });

                                    //     if(res == null){
                                    //       setState(() {
                                    //         _isLoading=false;
                                    //         _hasError = true;
                                    //         _isDone = false;
                                    //       });
                                    //     }
                                    //     else{
                                    //       print(res.toString());
                                    //       registeration_id = res.toString().split('/')[1].substring(0,20);
                                    //       _isDone = true;
                                    //       _hasError = false;
                                    //       _isLoading = false;
                                    //     }
                                    //   }
                                    // },
                                  ),
                                  Text('If you face any problem then Please click here')
                                ],
                              )
                          )
                        ],
                      ),
                    ),
                  )
                      : _isLoading
                      ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: SpinKitRing(
                        color: Colors.lightGreenAccent,
                        size: 50.0,
                      ),
                    ),
                  )
                      : _hasError
                      ? Container(
                    child: SelectableText(
                        'Hey $name, Thank you for trying but we faced some technical issues. Please try again and if any amount is deducted then it will be refunded within 5-7 business days. '),
                  )
                      : Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenSize.height * 0.2,
                        horizontal: screenSize.width * 0.3),
                    child: _isDone
                        ? Container(
                      height: screenSize.height * 0.5,
                      width: screenSize.width,
                      child: Column(
                        mainAxisSize:
                        MainAxisSize.max,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your application id is :\n",
                            style: TextStyle(
                                fontSize: 20),
                          ),
                          SelectableText(
                            registeration_id ==
                                null ||
                                registeration_id
                                    .length ==
                                    0
                                ? "Not generated yet, It will be sent you soon"
                                : registeration_id,
                            style: GoogleFonts
                                .montserrat(
                                fontSize: 22),
                          ),
                          SizedBox(
                            height:
                            screenSize.height *
                                0.02,
                          ),
                          RaisedButton(
                            elevation: 2,
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(
                                      text:
                                      registeration_id));
                            },
                            child: Text(
                              "Copy to Clipboard",
                              style: GoogleFonts.roboto(
                                  fontWeight:
                                  FontWeight.w600,
                                  fontSize: 16,
                                  color: themeChange
                                      .darkTheme
                                      ? Colors
                                      .grey[400]
                                      : Colors.blue),
                            ),
                          ),
                          SizedBox(
                            height:
                            screenSize.height *
                                0.1,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize:
                              MainAxisSize.max,
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceAround,
                              children: [
                                InkWell(
                                  onHover: (val) {
                                    setState(() {
                                      _isHoveringOptions[
                                      0] = val;
                                    });
                                  },
                                  child: Text(
                                    "New Registeration",
                                    style: TextStyle(
                                        color: _isHoveringOptions[
                                        0]
                                            ? Colors.blue[
                                        800]
                                            : Colors
                                            .orange,
                                        fontSize: 20),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      Navigator
                                          .pushReplacementNamed(
                                          context,
                                          '/register');
                                    });
                                  },
                                ),
                                InkWell(
                                  onHover: (val) {
                                    setState(() {
                                      _isHoveringOptions[
                                      1] = val;
                                    });
                                  },
                                  child: Text(
                                    "Go Back to Home",
                                    style: TextStyle(
                                        color: _isHoveringOptions[
                                        1]
                                            ? Colors.blue[
                                        800]
                                            : Colors
                                            .orange,
                                        fontSize: 20),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      Navigator
                                          .pushReplacementNamed(
                                          context,
                                          '/');
                                    });
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                        : Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: GoogleFonts
                                .montserrat(
                                fontSize: 24),
                          ),
                          TextFormField(
                            keyboardType:
                            TextInputType.name,
                            decoration:
                            InputDecoration(
                              hintText:
                              'Enter Your Name',
                            ),
                            onChanged: (val) {
                              setState(() {
                                name = val;
                              });
                            },
                            maxLines: 1,
                            autovalidate: false,
                          ),
                          SizedBox(
                            height:
                            screenSize.height *
                                0.08,
                          ),
                          Text(
                            'Email-Id',
                            style: GoogleFonts
                                .montserrat(
                                fontSize: 24),
                          ),
                          TextFormField(
                            keyboardType:
                            TextInputType
                                .emailAddress,
                            decoration:
                            InputDecoration(
                              hintText:
                              'Enter your email id',
                            ),
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            maxLines: 1,
                            autovalidate: true,
                          ),
                          SizedBox(
                            height:
                            screenSize.height *
                                0.08,
                          ),
                          Text(
                            'Phone number',
                            style: GoogleFonts
                                .montserrat(
                                fontSize: 24),
                          ),
                          TextFormField(
                            minLines: 1,
                            validator: (val) => val
                                .length ==
                                10
                                ? null
                                : "Enter Valid mobile number",
                            keyboardType:
                            TextInputType.phone,
                            inputFormatters: [
                              WhitelistingTextInputFormatter(
                                  RegExp(
                                      r'^[0-9]*$')),
                              LengthLimitingTextInputFormatter(
                                  10)
                            ],
                            decoration:
                            InputDecoration(
                              hintText:
                              'Enter Phone number',
                            ),
                            onChanged: (val) {
                              setState(() {
                                phone = val;
                              });
                            },
                            onSaved: (val) {
                              setState(() {
                                phone = val;
                                print(phone);
                              });
                            },
                            obscureText: true,
                            autovalidate: true,
                          ),
                          SizedBox(
                            height:
                            screenSize.height *
                                0.08,
                          ),
                          Text(
                            'Confirm Phone number',
                            style: GoogleFonts
                                .montserrat(
                                fontSize: 24),
                          ),
                          TextFormField(
                            keyboardType:
                            TextInputType
                                .emailAddress,
                            decoration:
                            InputDecoration(
                              hintText:
                              'Confirm your phone number',
                            ),
                            validator: (val) => val ==
                                phone
                                ? null
                                : "Phone number not matched",
                            onChanged: (val) {
                              setState(() {
                                conf_phone = val;
                              });
                            },
                            autovalidate: false,
                          ),
                          SizedBox(
                            height:
                            screenSize.height *
                                0.08,
                          ),
                          Text(
                            'USN (1st Year students write \'NA\')',
                            style: GoogleFonts
                                .montserrat(
                                fontSize: 24),
                          ),
                          TextFormField(
                            keyboardType:
                            TextInputType
                                .emailAddress,
                            decoration:
                            InputDecoration(
                              hintText:
                              'Enter your University Serial number',
                            ),
                            onChanged: (val) {
                              setState(() {
                                usn = val;
                              });
                            },
                            validator: (val) => val
                                .length ==
                                10 ||
                                val.toString() ==
                                    'NA'
                                ? null
                                : "Enter Correct USN",
                            autovalidate: false,
                          ),
                          SizedBox(
                            height:
                            screenSize.height *
                                0.02,
                          ),
                          // Text(
                          //   'Password',
                          //   style: GoogleFonts.montserrat(
                          //       fontSize: 22
                          //   ),
                          // ),
                          // Container(
                          //   child: TextFormField(
                          //     minLines: 1,
                          //     validator: (val) => val.length==10?null:"Enter Strong Password",
                          //     keyboardType: TextInputType.phone,
                          //     decoration: InputDecoration(
                          //       hintText: 'Enter Strong Password',
                          //     ),
                          //     onChanged: (val) {
                          //       setState(() {
                          //         password = val;
                          //       });
                          //     },
                          //     onSaved: (val) {
                          //       setState(() {
                          //         password = val;
                          //       });
                          //     },
                          //     obscureText: true,
                          //     autovalidate: true,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: screenSize.height*0.08 ,
                          // ),
                          // Text(
                          //   'Confirm Password',
                          //   style: GoogleFonts.montserrat(
                          //       fontSize: 22
                          //   ),
                          // ),
                          // Container(
                          //   child: TextFormField(
                          //     keyboardType: TextInputType.emailAddress,
                          //     decoration: InputDecoration(
                          //       hintText: 'Confirm Password',
                          //     ),
                          //     validator: (val) => val==password?null: "Phone number not matched",
                          //     onChanged: (val) {
                          //       setState(() {
                          //         conf_pass = val;
                          //       });
                          //     },
                          //     autovalidate: false,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: screenSize.height*0.08 ,
                          // ),
                          Padding(
                            padding:
                            EdgeInsets.all(8),
                            child: RaisedButton(
                              color: themeChange
                                  .darkTheme
                                  ? Colors.orange
                                  : Colors.white,
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: themeChange
                                        .darkTheme
                                        ? Colors.white
                                        : Colors
                                        .blue),
                              ),
                              elevation: 2,
                              onPressed: () {
                                if (_formKey
                                    .currentState
                                    .validate()) {
                                  Navigator.pushNamed(
                                      context,
                                      '/payment',
                                      arguments: {
                                        'name': name,
                                        'email':
                                        email,
                                        'phone':
                                        phone,
                                        'usn': usn,
                                      });
                                }
                              },
                              // onPressed: () async {
                              //   if (_formKey.currentState
                              //       .validate()) {
                              //     dynamic res =
                              //         await Database(
                              //                 name,
                              //                 phone,
                              //                 email,
                              //                 usn,
                              //                 password,
                              //                 "")
                              //             .register();
                              //     setState(() {
                              //       _isLoading = true;
                              //     });

                              //     if (res == null) {
                              //       print("error");
                              //       setState(() {
                              //         _isLoading = false;
                              //         _hasError = true;
                              //         _isDone = false;
                              //       });
                              //     } else {
                              //       print(res.toString());
                              //       registeration_id = res
                              //           .toString()
                              //           .split('/')[1]
                              //           .substring(0, 20);
                              //       _isDone = true;
                              //       _hasError = false;
                              //       _isLoading = false;
                              //     }
                              //   }
                              // },
                            ),
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
            color: themeChange.darkTheme
                ? Colors.white
                : Colors.grey[600]),
      )
          : null,
    );
  }
}
