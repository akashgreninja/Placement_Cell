import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class ggs extends StatefulWidget {

  @override
  _ggsState createState() => _ggsState();
}
_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _ggsState extends State<ggs> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class BottomBarColumn extends StatelessWidget {
  final String s1;
  final String s3;

  BottomBarColumn({
    this.s1,
    this.s3,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {Navigator.pushNamed(context, '/contact_us');
            },
            child: Text(
              s1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () {
    _launchURL('https://goo.gl/maps/eVQKLJzCEko4wxed9');
    },

            child: Text(
              s3,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomBarRow extends StatelessWidget {
  final String s1;
  final String s3;

  BottomBarRow({
    this.s1,
    this.s3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Center(
        child: Column(
          children: [

            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {Navigator.pushNamed(context, '/contact_us');
                    },
                    child: Text(
                      s1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      _launchURL('https://goo.gl/maps/eVQKLJzCEko4wxed9');

                    },
                    child: Text(
                      s3,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}