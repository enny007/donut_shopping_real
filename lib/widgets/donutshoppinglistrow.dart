import 'package:flutter/material.dart';

import '../utils/extensions.dart';
import 'donutmodel.dart';

class DonutShoppingListRow extends StatelessWidget {
  final DonutModel? donuts;
  final Function onDeleteRow;
  const DonutShoppingListRow({this.donuts, Key? key, required this.onDeleteRow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
      child: Row(
        children: [
          Image.network(
            donuts!.imgUrl!,
            width: 80,
            height: 80,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  donuts!.name!,
                  style: const TextStyle(
                      color: Utils.mainDark,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 2,
                          color: Utils.mainDark.withOpacity(0.2),
                        ),
                      ),
                      child: Text(
                        '\$${donuts!.price!.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Utils.mainDark.withOpacity(0.4),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        onDeleteRow();
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Utils.mainColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
