import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/donutservice.dart';
import '../utils/extensions.dart';
import 'donutmodel.dart';

class DonutCard extends StatelessWidget {
  final DonutModel? donutInfo;
  const DonutCard({this.donutInfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var donutService = Provider.of<DonutService>(context, listen: false);
        donutService.onSelectedDonut(donutInfo!);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: 150,
            margin:
                const EdgeInsets.only(top: 40, left: 10, bottom: 0, right: 10),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0.0, 0.4))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  donutInfo!.name!,
                  style: const TextStyle(
                      color: Utils.mainDark,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, right: 10, left: 10),
                  decoration: BoxDecoration(
                      color: Utils.mainColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    donutInfo!.price!.toStringAsFixed(2),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: Hero(
              tag: donutInfo!.name!,
              child: Image.network(
                donutInfo!.imgUrl!,
                fit: BoxFit.contain,
                width: 130,
                height: 130,
              ),
            ),
          )
        ],
      ),
    );
  }
}
