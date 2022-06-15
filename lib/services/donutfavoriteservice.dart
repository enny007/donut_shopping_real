import 'package:donut_shopping/widgets/donutmodel.dart';
import 'package:flutter/cupertino.dart';

class DonutFavoriteService extends ChangeNotifier {
  List<DonutModel> favDonuts = [];

  void addToCart(DonutModel donut) {
    favDonuts.add(donut);
    notifyListeners();
  }

  void removeFromCart(DonutModel donut) {
    favDonuts.removeWhere((element) {
      return element.name == donut.name;
    });
    notifyListeners();
  }

  void clearCart() {
    favDonuts.clear();
    notifyListeners();
  }

  bool isDonutInCart(DonutModel donut) {
    return favDonuts.any((element) => element.name == donut.name);
  }
}
