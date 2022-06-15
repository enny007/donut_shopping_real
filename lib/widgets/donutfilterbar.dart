import 'package:donut_shopping/utils/extensions.dart';
import 'package:donut_shopping/widgets/donutfilterbaritem.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/donutservice.dart';

class DonutFilterPage extends StatelessWidget {
  const DonutFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Consumer<DonutService>(
        builder: (context, value, child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(value.filterbaritems.length, (index) {
                  DonutFilterBarItems items = value.filterbaritems[index];
                  return GestureDetector(
                    onTap: () {
                      value.filteredDonutsByType(items.id!);
                    },
                    child: Container(
                      child: Text(
                        '${items.label}',
                        style: TextStyle(
                            color: value.selectedDonutType == items.id
                                ? Utils.mainColor
                                : Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  AnimatedAlign(
                    alignment: alignmentBasedOnTap(value.selectedDonutType),
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: Container(
                      height: 5,
                      width: MediaQuery.of(context).size.height / 6 - 20,
                      decoration: BoxDecoration(
                          color: Utils.mainColor,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }

  Alignment alignmentBasedOnTap(filterBarId) {
    switch (filterBarId) {
      case 'classic':
        return Alignment.centerLeft;
      case 'sprinkled':
        return Alignment.center;
      case 'stuffed':
        return Alignment.centerRight;
      default:
        return Alignment.centerLeft;
    }
  }
}
