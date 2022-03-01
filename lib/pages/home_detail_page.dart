import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalogue.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalogue;
  const HomeDetailPage({Key? key, required this.catalogue})
      : assert(catalogue != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.m0,
          children: [
            "\$${catalogue.price}".text.bold.xl4.red800.make(),
            AddToCart(
              catalogue: catalogue,
            ).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalogue.id.toString()),
              child: Image.network(catalogue.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: (Column(
                    children: [
                      catalogue.name.text.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalogue.desc.text.xl.make(),
                      10.heightBox,
                      "Ea invidunt invidunt at sadipscing stet sed. Et sed eos dolor dolore, diam nonumy. Sea lorem sed et no lorem ut, nonumy consetetur sit et voluptua gubergren kasd. Et est et et no sed gubergren magna, amet nonumy."
                          .text
                          .make()
                          .p16()
                    ],
                  ).py64()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
