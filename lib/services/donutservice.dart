import 'package:donut_shopping/utils/extensions.dart';
import 'package:donut_shopping/widgets/donutfilterbaritem.dart';
import 'package:donut_shopping/widgets/donutmodel.dart';
import 'package:flutter/material.dart';

class DonutService extends ChangeNotifier {
  List<DonutFilterBarItems> filterbaritems = [
    DonutFilterBarItems(id: 'classic', label: 'Classic'),
    DonutFilterBarItems(id: 'sprinkled', label: 'Sprinkled'),
    DonutFilterBarItems(id: 'stuffed', label: 'Stuffed')
  ];
  String? selectedDonutType;
  List<DonutModel> filteredDonuts = [];
  late DonutModel selectedDonut;

  DonutModel getselectedDonut() {
    return selectedDonut;
  }

  DonutService() {
    selectedDonutType = filterbaritems.first.id;
    filteredDonutsByType(selectedDonutType!);
  }

  void onSelectedDonut(DonutModel donut) {
    selectedDonut = donut;
    Utils.mainAppNav.currentState!.pushNamed('/details');
  }

  void filteredDonutsByType(String type) {
    selectedDonutType = type;
    filteredDonuts = Utils.donuts
        .where((element) => element.type == selectedDonutType)
        .toList();
    notifyListeners();
  }
}
