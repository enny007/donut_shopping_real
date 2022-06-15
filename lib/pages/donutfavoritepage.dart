import 'package:donut_shopping/services/donutfavoriteservice.dart';
import 'package:donut_shopping/utils/extensions.dart';
import 'package:donut_shopping/widgets/donutfavoritelist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutFavoritePage extends StatelessWidget {
  const DonutFavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            Utils.donutTitleFavorites,
            width: 180,
          ),
          Expanded(
            child: Consumer<DonutFavoriteService>(
              builder: (context, value, child) {
                if (value.favDonuts.isEmpty) {
                  return Center(
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_border,
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
                return DonutFavoriteList(
                  donutcart: value.favDonuts,
                  cartService: value,
                );
              },
            ),
          ),
          Consumer<DonutFavoriteService>(builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Material(
                    color: value.favDonuts.isEmpty
                        ? Colors.grey[300]
                        : Utils.mainColor.withOpacity(0.2),
                    child: InkWell(
                      highlightColor: Utils.mainDark.withOpacity(0.5),
                      splashColor: Utils.mainDark.withOpacity(0.2),
                      onTap: () {
                        value.favDonuts.isEmpty
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
                              color: value.favDonuts.isEmpty
                                  ? Colors.grey
                                  : Utils.mainDark,
                            ),
                            Text(
                              'Clear Favorites',
                              style: TextStyle(
                                color: value.favDonuts.isEmpty
                                    ? Colors.grey
                                    : Utils.mainDark,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          })
        ],
      ),
    );
  }
}
