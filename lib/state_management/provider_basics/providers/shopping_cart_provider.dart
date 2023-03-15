import 'package:flutter/material.dart';

class ShoppingCart extends ChangeNotifier {
  final List<String> _shoppingCart = ["Apple", "Orange", "Grapes"];

  int get count => _shoppingCart.length;
  List<String> get cart => _shoppingCart;

  void addItem(String item) {
    _shoppingCart.add(item);
    notifyListeners();
    for (item in cart) ;
  }
}
