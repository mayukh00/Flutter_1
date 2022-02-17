// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String dayss = "First";

    //Color c;
    return Scaffold(
      appBar: AppBar(
        title: Text(" Mayukh's App"),
        centerTitle: true,
        // backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $dayss app"),
        ),
      ),
      drawer:
          const Drawer(), //                      //Drawer : menu bar at top left
    );
  }
}
