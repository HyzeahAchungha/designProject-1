import 'package:flutter/material.dart';
import 'package:lite_store/pages/utils/product.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    Product(
      name: 'Alienware-m18',
      price: 23000,
      discription: 'Some discriptional text about the product',
      imagePath: 'lib/images/alienware-m18.jpg',
    ),
    Product(
      name: 'Lenovo-yoga-9i',
      price: 123000,
      discription: 'Some discriptional text about the product',
      imagePath: 'lib/images/acer-chromebook-spin.jpg',
    ),
    Product(
      name: 'Dell-xps-17',
      price: 19000,
      discription: 'Some discriptional text about the product',
      imagePath: 'lib/images/dell-xps-17.jpg',
    ),
    Product(
      name: 'Lenovo-thinkpad',
      price: 90000,
      discription: 'Some discriptional text about the product',
      imagePath: 'lib/images/lenovo-thinkpad.jpg',
    ),
  ];

  // user cart
  final List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
