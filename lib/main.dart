// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home:  HomePage(),            //     open HomePage by default which is again done in route
      themeMode: ThemeMode.system,

      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: GoogleFonts.lato().fontFamily, // gives all font to lato
        //  primaryTextTheme: GoogleFonts.latoTextTheme()
      ), // google fonts packages imported in as dependency in yaml
      //                           // primaryswitch does color combi accrdng to specified color color theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        //                            // brightness for when system is dark
      ),

      initialRoute: "/login", //initially "/"
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(), // from routes.dart
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
