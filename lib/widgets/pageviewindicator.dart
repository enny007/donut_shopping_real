import 'package:donut_shopping/utils/extensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PageViewIndicator extends StatelessWidget {
  int? numberofpages;
  int? currentpages;
  PageController? controller;
  PageViewIndicator(
      {this.controller, this.currentpages, this.numberofpages, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(numberofpages!, (index) {
        return GestureDetector(
          onTap: (() {
            controller!.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: 15,
            height: 15,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: currentpages == index
                  ? Utils.mainColor
                  : Colors.grey.withOpacity(0.2),
            ),
          ),
        );
      }),
    );
  }
}
