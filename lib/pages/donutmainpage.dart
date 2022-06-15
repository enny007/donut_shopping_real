import 'package:donut_shopping/widgets/donutfilterbar.dart';
import 'package:donut_shopping/widgets/donutlist.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/donutservice.dart';
import '../widgets/donutpager.dart';

class DonutMainPage extends StatelessWidget {
  const DonutMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DonutPager(),
        const DonutFilterPage(),
        Expanded(child: Consumer<DonutService>(
          builder: ((context, value, child) {
            return DonutList(
              donuts: value.filteredDonuts,
            );
          }),
        ))
      ],
    );
  }
}
