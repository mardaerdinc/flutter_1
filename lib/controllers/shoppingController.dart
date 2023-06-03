import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:flutter_1/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about 1.product',
          productImage: 'abd',
          productName: '1. product'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about 2.product',
          productImage: 'abd',
          productName: '2. product'),
      Product(
          id: 3,
          price: 49.5,
          productDescription: 'some description about 3.product',
          productImage: 'abd',
          productName: '3. product'),
    ];

    products.value = productResult;
  }
}
