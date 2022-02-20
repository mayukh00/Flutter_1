// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalogue.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: CatalogueModel.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: CatalogueModel.items[index],
              );
            },
          ),
        ),
        drawer: MyDrawer());
  }
}
