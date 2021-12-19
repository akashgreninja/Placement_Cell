// import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:placement_original/Board/Company.dart';
import 'package:placement_original/Contact/Contact_us.dart';
import 'package:placement_original/DashBoard/dashboard.dart';
import 'package:placement_original/Facilities/Facilities.dart';
import 'package:placement_original/Register/cybersec.dart';
import 'package:placement_original/Register/logIn.dart';
import 'package:placement_original/Register/razorpayWeb.dart';
import 'package:placement_original/Rotary/Placements.dart';
import 'package:placement_original/Rotary/prism.dart';
import 'package:placement_original/home/Home.dart';
import 'package:placement_original/home/homePage.dart';
import 'package:placement_original/Register/register.dart';
import 'package:placement_original/services/sharedPref.dart';
import 'package:placement_original/services/styles.dart';
import 'package:placement_original/home/Stats.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = new DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeProvider.darkTheme =
        await themeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => HomePage(),
              '/Placements': (context) => Placements(),
              '/Facilities': (context) => Facilities(),
              '/Company': (context) => Company(),
              '/contact_us': (context) => Contact_us(),
              '/register': (context) => Register(),
              '/login': (context) => SignIn(),
              '/dashboard': (context) => DashBoard(),

              '/payment': (context) => RazorPayWeb(),
               '/cybersec': (context) => CyberSec(),
              '/Stats':(context) =>Stats(),
            },
            initialRoute: '/',
            title: 'Placement Cell Of Bit',
            theme: Styles.themeData(themeProvider.darkTheme, context, true),
            // darkTheme: Styles.themeData(themeProvider.darkTheme, context, false),
          );
        },
      ),
    );
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  if (settings.name == '/foo') {
    // FooRoute constructor expects SomeObject
    // return _buildRoute(settings, new FooRoute(settings.arguments));
  }

  return null;
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return new MaterialPageRoute(
    settings: settings,
    builder: (ctx) => builder,
  );
}
