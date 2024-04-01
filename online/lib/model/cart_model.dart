import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Palm butter", "10000", "lib/assets/dish.jpg", Colors.green],
     ["Roasted Fish", "20000", "lib/assets/fish.jpg", Colors.green],
  ["Kala", "10000", "lib/assets/cala.jpg", Colors.green],
   ["Peper Fish", "10000", "lib/assets/plantain.jpg", Colors.green],
   ["Rice", "5000", "lib/assets/rice.jpg", Colors.green],
   ["Roasted Fish", "10000", "lib/assets/soup.jpg", Colors.green],
   ["Okra Soup", "60000", "lib/assets/okra.jpg", Colors.green],
  ["Palm Buter", "80000", "lib/assets/palm.jpg", Colors.green],
  ["Eddoes Soup", "90000", "lib/assets/pizza.jpg", Colors.green],
  ["Roasted Fish", "20000", "lib/assets/smoke.jpg", Colors.green],
 ["Palm butter", "10000", "lib/assets/dish.jpg", Colors.green],
     ["Roasted Fish", "20000", "lib/assets/fish.jpg", Colors.green],
  ["Kala", "10000", "lib/assets/cala.jpg", Colors.green],
   ["Peper Fish", "10000", "lib/assets/plantain.jpg", Colors.green],
   ["Rice", "5000", "lib/assets/rice.jpg", Colors.green],
   ["Roasted Fish", "10000", "lib/assets/soup.jpg", Colors.green],
   ["Okra Soup", "60000", "lib/assets/okra.jpg", Colors.green],
  ["Palm Buter", "80000", "lib/assets/palm.jpg", Colors.green],
  ["Eddoes Soup", "90000", "lib/assets/pizza.jpg", Colors.green],
  ["Roasted Fish", "20000", "lib/assets/smoke.jpg", Colors.green],
 
  ];

  // list of cart items
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
