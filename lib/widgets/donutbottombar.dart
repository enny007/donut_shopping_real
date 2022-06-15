import 'package:donut_shopping/services/donutshoppingcartservice.dart';
import 'package:donut_shopping/widgets/donutbaritems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/extensions.dart';

class DonutBottomBar extends StatelessWidget {
  const DonutBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Consumer<DonutBottomBarSelectionService>(
        builder: ((context, value, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  value.setTabSelection('main');
                },
                icon: const Icon(Icons.trip_origin),
                color: value.tabSelection == 'main'
                    ? Utils.mainDark
                    : Utils.mainColor,
              ),
              IconButton(
                onPressed: () {
                  value.setTabSelection('favorites');
                },
                icon: const Icon(Icons.favorite),
                color: value.tabSelection == 'favorites'
                    ? Utils.mainDark
                    : Utils.mainColor,
              ),
              Consumer<DonutShoppingCartService>(
                builder: ((context, cartService, child) {
                  int cartItems = cartService.cartDonuts.length;
                  return Container(
                    constraints: const BoxConstraints(minHeight: 70),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: cartItems > 0
                          ? (value.tabSelection! == 'shopping'
                              ? Utils.mainDark
                              : Utils.mainColor)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        cartItems > 0
                            ? Text(
                                '$cartItems',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )
                            : const SizedBox(
                                height: 10,
                              ),
                        IconButton(
                            onPressed: () {
                              value.setTabSelection('shoppingcart');
                            },
                            icon: Icon(Icons.shopping_cart,
                                color: cartItems > 0
                                    ? Colors.white
                                    : (value.tabSelection! == 'shopping'
                                        ? Utils.mainDark
                                        : Utils.mainColor)))
                      ],
                    ),
                  );
                }),
              ),
            ],
          );
        }),
      ),
    );
  }
}
