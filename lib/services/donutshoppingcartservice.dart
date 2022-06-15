import 'package:flutter/cupertino.dart';

import '../widgets/donutmodel.dart';

class DonutShoppingCartService extends ChangeNotifier {
  List<DonutModel> cartDonuts = [];

// Provider function to add items to the cart
  void addToCart(DonutModel donut) {
    cartDonuts.add(donut);
    notifyListeners();
  }

// Provider function to remove items from the cart... The item removed would be the name property of the donutmodel class
  void removeFromCart(DonutModel donut) {
    cartDonuts.removeWhere(((element) => element.name == donut.name));
    notifyListeners();
  }

// Provider function to clear items from the cart.
  void clearCart() {
    cartDonuts.clear();
    notifyListeners();
  }

  // Provider function to get the price of the item. This is a value returning function else the need for the return statement
  double getTotal() {
    double cartTotal = 0.0;
    for (var element in cartDonuts) {
      cartTotal += element.price!;
    }
    return cartTotal;
  }

//Provider function to get the existence of an item in the cart.
  bool isDonutInCart(DonutModel donut) {
    return cartDonuts.any((element) => element.name == donut.name);
  }
}
