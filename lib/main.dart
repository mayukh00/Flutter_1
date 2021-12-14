import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int days = 1;
    // String dayss = "first";
    // bool isEmpty = true;
    // num intAndfloat = 30.5;
    // const pi = 3.14;

    // var day1 = "Thu"; //general variable type

    return MaterialApp(
                                      //wrap with widget/ with center shortcut-- ctrl+ .
      home: HomePage(),
    );
  }
}
