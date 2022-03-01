import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalogue.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalogue;
  const AddToCart({
    Key? key,
    required this.catalogue,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalogue) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _catalogue = CatalogueModel();

          _cart.catalogue = _catalogue;
          _cart.add(widget.catalogue);
          setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              // ignore: deprecated_member_use
              context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            // ignore: prefer_const_constructors
            StadiumBorder(),
          )),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
