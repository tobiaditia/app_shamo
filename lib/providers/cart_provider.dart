import 'package:app_shamo/models/cart_model.dart';
import 'package:app_shamo/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCarts(ProductModel product) {
    try {
      if (isOnCart(product)) {
        int index =
            _carts.indexWhere((element) => element.product.id == product.id);
        _carts[index].quantity++;
      } else {
        _carts.add(CartModel(id: _carts.length, product: product, quantity: 1));
      }

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  changeQuantity(int id, bool increase) {
    increase
        ? _carts[id].quantity++
        : _carts[id].quantity > 1
            ? _carts[id].quantity--
            : _carts[id].quantity;
    notifyListeners();
  }

  isOnCart(ProductModel product) {
    return _carts.indexWhere((element) => element.product.id == product.id) ==
            -1
        ? false
        : true;
  }

  totalItem() {
    int total = 0;
    _carts.forEach((element) => total += element.quantity);
    return total;
  }

  totalPrice() {
    double total = 0;
    _carts.forEach(
        (element) => total += element.product.price * element.quantity);
    return total;
  }
}
