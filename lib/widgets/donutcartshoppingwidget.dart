import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/donutshoppingcartservice.dart';
import '../utils/extensions.dart';

class DonutShoppingCartWidget extends StatelessWidget {
  const DonutShoppingCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DonutShoppingCartService>(
      builder: (((context, value, child) {
        if (value.cartDonuts.isEmpty) {
          return const SizedBox();
        }
        return Transform.scale(
          scale: 0.7,
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Utils.mainColor,
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: [
                Text(
                  '${value.cartDonuts.length}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.shopping_cart,
                  size: 25,
                  color: Colors.white,
                )
              ],
            ),
          ),
        );
      })),
    );
  }
}
