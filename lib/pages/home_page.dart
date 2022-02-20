// ignore_for_file: prefer_const_declarations, prefer_const_constructors, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalogue.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogueJson =
        await rootBundle.loadString("assets/files/catalogue.json");
    var decodeData = jsonDecode(catalogueJson);
    var productData = decodeData["products"];
  }

  @override
  Widget build(BuildContext context) {
    final String dayss = "First";

    //Color c;
    return Scaffold(
        appBar: AppBar(
          title: Text(" Mayukh's App"),
          centerTitle: true,
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
