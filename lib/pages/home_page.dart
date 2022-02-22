// ignore_for_file: prefer_const_declarations, prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catalogue.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:flutter_application_1/widgets/theme.dart';

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
    return Scaffold(
        backgroundColor: MyTheme.creamcolor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogueHeader(),
                if (CatalogueModel.items != null &&
                    CatalogueModel.items.isNotEmpty)
                  CatalogueList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

class CatalogueHeader extends StatelessWidget {
  const CatalogueHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //from velocity package
        "Catalog App".text.xl5.bold.color(MyTheme.darkbluish).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class CatalogueList extends StatelessWidget {
  const CatalogueList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalogue = CatalogueModel.items[index];
        return CatalogueItem(catalogue: catalogue);
      },
      itemCount: CatalogueModel.items.length,
    );
  }
}

class CatalogueItem extends StatelessWidget {
  final Item catalogue;

  const CatalogueItem({
    Key? key,
    required this.catalogue,
  })  : assert(catalogue != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Image.network(
          catalogue.image,
        ).box.p16.color(MyTheme.creamcolor).make()
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}
