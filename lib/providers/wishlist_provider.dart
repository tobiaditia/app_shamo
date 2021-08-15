import 'package:app_shamo/models/product_model.dart';
import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  List<ProductModel> _wishlist = [];

  List<ProductModel> get wishlist => _wishlist;

  set wishlist(List<ProductModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setProduct(ProductModel product) {
    if (!isOnWishlist(product)) {
      _wishlist.add(product);
    } else {
      _wishlist.removeWhere((element) => element.id == product.id);
    }

    print(_wishlist);

    notifyListeners();
  }

  isOnWishlist(ProductModel product) {
    return _wishlist.indexWhere((element) => element.id == product.id) == -1
        ? false
        : true;
  }
}
