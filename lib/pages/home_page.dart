// ignore_for_file: prefer_const_declarations, prefer_const_constructors, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalogue.dart';
import 'package:flutter_application_1/pages/login_page.dart';
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
    await Future.delayed(Duration(seconds: 2));
    var catalogueJson =
        await rootBundle.loadString("assets/files/catalogue.json");
    var decodeData = jsonDecode(catalogueJson);
    var productData = decodeData["products"];
    CatalogueModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final String dayss = "First";

    //Color c;
    return Scaffold(
        appBar: AppBar(
          title: Text("$name's App"),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: (CatalogueModel.items != null &&
                    CatalogueModel.items.isNotEmpty)
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      final item = CatalogueModel.items[index];
                      return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: GridTile(
                              header: Container(
                                child: Text(
                                  item.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(color: Colors.teal),
                              ),
                              child: Image.network(item.image),
                              footer: Text(item.price.toString())));
                    },
                    itemCount: CatalogueModel.items.length,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )),
        drawer: MyDrawer());
  }
}
