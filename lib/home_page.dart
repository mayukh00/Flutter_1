import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String dayss = "First";

    return Scaffold(
      appBar: AppBar(
          title: Text(" Mayukh's App"), //creates the top bar
          

      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $dayss app"),
        ),
      ),
      drawer: Drawer(), //menu bar at top left
      backgroundColor: Colors.pink[100],
    );
  }
}
