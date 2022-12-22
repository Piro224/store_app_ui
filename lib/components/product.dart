import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  final List _products = [
    [Colors.purpleAccent, "Avocado", "45.50", "assets/images/avocado.png"],
    [Colors.blueAccent, "Banana", "50.50", "assets/images/banana.png"],
    [Colors.greenAccent, "Chicken", "70.50", "assets/images/chicken.png"],
    [Colors.redAccent, "Water", "80.50", "assets/images/water.png"],
  ];

  final List _cartItems = [];

  //To add item to cart
  void addItems(int index) {
    _cartItems.add(products[index]);
    notifyListeners();
  }

  //To remove item from cart
  void deleteCartItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate totalPrice
  String calculatePrice() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][2]);
    }
    return totalPrice.toStringAsFixed(2);
  }

  get products => _products;

  get cartItems => _cartItems;
}
