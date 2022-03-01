import 'package:flutter_application_1/models/catalogue.dart';

class CartModel {
  
  //catalogue field
  late CatalogueModel _catalogue;

  //Collection of IDs - store IDs of each item
  final List<int> _itemIds = [];

  //get catalog
  CatalogueModel get catalogue => _catalogue;

  //set catalog

  set catalogue(CatalogueModel newCatalogue) {
    assert(newCatalogue != null);
    _catalogue = newCatalogue;
  }

  //get items in cart
  List<Item> get items => _itemIds
      .map(
        (id) => _catalogue.getById(id),
      )
      .toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
