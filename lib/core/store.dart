import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalogue.dart';

class MyStore extends VxStore {
  late CatalogueModel catalogue;
  late CartModel cart;

  MyStore() {
    catalogue = CatalogueModel();
    cart = CartModel();
    cart.catalogue = catalogue;
  }
}
