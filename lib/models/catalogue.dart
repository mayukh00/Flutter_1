class CatalogueModel {
  static final items = [
    Item(
        image:
            "https://guesseu.scene7.com/is/image/GuessEU/M63H24W7JF0-L302-ALTGHOST?wid=1500&fmt=jpeg&qlt=80&op_sharpen=0&op_usm=1.0,1.0,5,0&iccEmbed=0",
        name: "CHECK PRINT SHIRT",
        price: 110)
  ];
}

class Item {
  final String image;
  final String name;
  final num price;

  Item({
    required this.image,
    required this.name,
    required this.price,
  });
}
