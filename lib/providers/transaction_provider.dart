import 'package:app_shamo/models/cart_model.dart';
import 'package:app_shamo/services/transaction_service.dart';
import 'package:flutter/cupertino.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(String token, List<CartModel> carts, double totalPrice,
      double shippingPrice) async {
    try {
      if (await TransactionService()
          .checkout(token, carts, totalPrice, shippingPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
