import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    // Product 1
    Product(
      name: 'Bolt 101',
      price: 3499.68,
      description: 'Unleash speed. Lightweight sneakers with propulsion tech.',
      imagePath: 'assets/1.png',
    ),
    // Product 2
    Product(
        name: 'Circuit 68',
        price: 2499.99,
        description:
            'Leave a mark. Reflective upper, premium materials, minimalist style.',
        imagePath: 'assets/2.png'),
    // Product 3
    Product(
        name: 'Forge One',
        price: 1999.99,
        description:
            'Conquer any terrain. Rugged, weatherproof, superior traction.',
        imagePath: 'assets/3.png'),
    // Product 4
    Product(
        name: 'Spectre V2',
        price: 2799.99,
        description: 'Navigate the city. Tech-knit upper, tracks activity',
        imagePath: 'assets/4.png'),
  ];

  //User Cart
  List<Product> _cart = [];

  //get Product
  List<Product> get shop => _shop;

  //get User Cart
  List<Product> get cart => _cart;

  //add Item To cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item  From Cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
