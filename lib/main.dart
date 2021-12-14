import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //wrap with widget/ with center shortcut-- ctrl+ .
      home: Material(
        child: Center(
          child: Container(
            child: Text("Welcome to First app"),
          ),
        ),
      ),
    );
  }
}
