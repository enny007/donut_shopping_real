import 'package:donut_shopping/utils/extensions.dart';
import 'package:flutter/material.dart';

import 'donutmodel.dart';

class DonutFavoriteListRow extends StatelessWidget {
  final DonutModel? donuts;
  final Function onRemoveLike;
  const DonutFavoriteListRow(
      {Key? key, this.donuts, required this.onRemoveLike})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image.network(
            donuts!.imgUrl!,
            width: 80,
            height: 80,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            donuts!.name!,
            style: const TextStyle(
                color: Utils.mainDark,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                onRemoveLike();
              },
              icon: const Icon(
                Icons.favorite_outlined,
                color: Utils.mainColor,
              ),
            ),
          )
        ]));
  }
}
