import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalogue.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalogue_image.dart';

class CatalogueList extends StatelessWidget {
  const CatalogueList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogueModel.items.length,
      itemBuilder: (context, index) {
        final catalogue = CatalogueModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                      catalogue: catalogue,
                    ),
                  ),
                ),
            child: CatalogueItem(catalogue: catalogue));
      },
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
          Hero(
              tag: Key(catalogue.id.toString()),
              child: CatalogueImage(image: catalogue.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalogue.name.text.lg.color(context.accentColor).bold.make(),
              catalogue.desc.text.make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.m0,
                children: [
                  "\$${catalogue.price}".text.bold.xl.make(),
                  _AddToCart(catalogue: catalogue)
                ],
              ).pOnly(right: 8.0),
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalogue;

  const _AddToCart({
    Key? key,
    required this.catalogue,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalogue = CatalogueModel();
        final _cart = CartModel();
        _cart.catalogue = _catalogue;
        _cart.add(widget.catalogue);
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              // ignore: deprecated_member_use
              context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            // ignore: prefer_const_constructors
            StadiumBorder(),
          )),
      child: isAdded ? Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
