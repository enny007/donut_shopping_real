import 'package:donut_shopping/services/donutshoppingcartservice.dart';
import 'package:donut_shopping/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/donutshoppinglist.dart';

class DonutShoppingCartPage extends StatefulWidget {
  const DonutShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<DonutShoppingCartPage> createState() => _DonutShoppingCartPageState();
}

class _DonutShoppingCartPageState extends State<DonutShoppingCartPage>
    with SingleTickerProviderStateMixin {
  AnimationController? titleController;

  @override
  void initState() {
    super.initState();
    titleController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..forward();
  }

  @override
  void dispose() {
    titleController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: titleController!, curve: Curves.easeInOut)),
            child: Image.network(
              Utils.donutTitleMyDonuts,
              width: 170,
            ),
          ),
          Expanded(
            child: Consumer<DonutShoppingCartService>(
              builder: (context, value, child) {
                if (value.cartDonuts.isEmpty) {
                  return Center(
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.grey[300],
                            size: 50,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'You don\'t have any items in your cart yet!',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return DonutShoppingList(
                  donutcart: value.cartDonuts,
                  cartService: value,
                );
              },
            ),
          ),
          Consumer<DonutShoppingCartService>(builder: (context, value, child) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  value.cartDonuts.isEmpty
                      ? const SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(color: Utils.mainDark),
                            ),
                            Text(
                              '\$${value.getTotal().toStringAsFixed(2)}',
                              style: const TextStyle(
                                  color: Utils.mainDark,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Material(
                      color: value.cartDonuts.isEmpty
                          ? Colors.grey[200]
                          : Utils.mainColor.withOpacity(0.2),
                      child: InkWell(
                        splashColor: Utils.mainDark.withOpacity(0.2),
                        highlightColor: Utils.mainDark.withOpacity(0.5),
                        onTap: () {
                          value.cartDonuts.isEmpty
                              ? null
                              : () {
                                  value.clearCart();
                                };
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.delete_forever,
                                color: value.cartDonuts.isEmpty
                                    ? Colors.grey
                                    : Utils.mainDark,
                              ),
                              Text(
                                'Clear Cart',
                                style: TextStyle(
                                  color: value.cartDonuts.isEmpty
                                      ? Colors.grey
                                      : Utils.mainDark,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]);
          })
        ]));
  }
}
