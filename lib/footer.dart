import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'bottomBarColumn.dart';
class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
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
    bool isScreenSmall = screenSize.width<800;
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(0, 0, 0, 0.9),
            Color.fromRGBO(42, 42, 114,0.9 ),
          ]
        ),
      ),

      child: isScreenSmall? Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarColumn(
                // heading: 'About Us',
                s1: 'Contact Us',
                // s2: 'About Us',
                s3: 'Locate Us',
              )
            ],
          ),
         
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/linkedin-2.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('https://www.linkedin.com/company/training-and-placement-cell-bit-bangalore/');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              ),
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/gmail.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('mailto:placementcellbit2021@gmail.com,');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              ),
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/twitter.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('https://twitter.com/bitsince1979');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              ),
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/facebook-new.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('https://www.facebook.com/bitsince1979');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              )
            ],
          )
        ],
      ):Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          Container(height: 200,
              child: Image.asset('bitlogo.png')),
          Text("© 2021 BIT. All rights reserved.\n Bangalore Institute of Technology (BIT)"),

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: BottomBarRow(
                  // heading: 'About Us',
                  s1: 'Contact Us',
                  //s2: 'About Us',
                  s3: 'Locate Us',
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // TODO : order of Gmail, linkedin, insta, whatsapp
            children: [
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/color/48/000000/instagram-new.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                  width: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('https://www.instagram.com/bitsince1979/');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              ),
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/linkedin-2.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('https://www.linkedin.com/company/training-and-placement-cell-bit-bangalore/');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              ),
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/gmail.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('mailto:placementcellbit2021@gmail.com,');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              ),
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/twitter.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('https://twitter.com/bitsince1979');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              ),
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/facebook-new.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('https://www.facebook.com/bitsince1979');
                },
                hoverColor: Colors.transparent,
              ),

              SizedBox(
                width: screenSize.width*0.02,
              )
            ],
          )
        ],
      ),
    );
  }
}
