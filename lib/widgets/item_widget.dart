// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalogue.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          onTap: () {},
          leading: Image.network(item.image),
          title: Text(item.name),
          trailing: Text(
            "\$${item.price.toString()}",
            textScaleFactor: 1.2,
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          )),
    );
  }
}
