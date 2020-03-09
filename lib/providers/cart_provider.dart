import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final String imageUrl;
  final int quantity;
  final double price;

  CartItem({
     this.id,
     this.price,
     this.title,
     this.imageUrl,
     this.quantity,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItem {
    return {..._cartItems};
  }

  int get itemCount {
    return _cartItems.length;
  }

  double get totalAmount {
    double total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String id, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(id)) {
      //change quantity
      _cartItems.update(
        id,
        (exitingCartItem) => CartItem(
          id: exitingCartItem.id,
          title: exitingCartItem.title,
          imageUrl: exitingCartItem.imageUrl,
          quantity: exitingCartItem.quantity + 1,
          price: exitingCartItem.price,
        ),
      );
    } else {
      //add item
      _cartItems.putIfAbsent(
        id,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          imageUrl: imageUrl,
          quantity: 1,
          price: price,
        ),
      );
    }
    notifyListeners();
  }

   removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

   clearCart(){
     _cartItems = {};
     notifyListeners();
   }
}
