import 'package:get/state_manager.dart';
import 'package:flutter_1/models/product.dart';
import 'package:flutter_1/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;

  double get totalPrice =>
      cartItems.value.fold(0, (sum, item) => sum + item.price);
  addToCart(Product product) {
    cartItems.add(product);
  }
}
