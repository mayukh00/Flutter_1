import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //                                       //wrap with widget/ with center shortcut-- ctrl+ .
    return MaterialApp(
      // home:  HomePage(),            //     open HomePage by default which is again done in route
      themeMode: ThemeMode.system,
      //                             //ThemeMode.system, changes theme to dark or light accordingly
      theme: ThemeData(primarySwatch: Colors.red),
      //                           // primaryswitch does color combi accrdng to amber coor theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        //                            // brightness for when system is dark
      ),

      initialRoute: "/login", //initially "/"
      routes: {
        "/": (context) => const HomePage(),
        //                                        // initial route "/" imples default page.
        "/login": (context) => LoginPage(),
      },
    );
  }
}
