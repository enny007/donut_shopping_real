import 'package:flutter/material.dart';

import '../utils/extensions.dart';
import 'donutpage.dart';
import 'pageviewindicator.dart';

class DonutPager extends StatefulWidget {
  const DonutPager({Key? key}) : super(key: key);

  @override
  State<DonutPager> createState() => _DonutPagerState();
}

class _DonutPagerState extends State<DonutPager> {
  List<DonutPage> pages = [
    DonutPage(imgUrl: Utils.donutPromo1, logoImgUrl: Utils.donutLogoWhiteText),
    DonutPage(imgUrl: Utils.donutPromo2, logoImgUrl: Utils.donutLogoWhiteText),
    DonutPage(imgUrl: Utils.donutPromo3, logoImgUrl: Utils.donutLogoRedText)
  ];
  int currentPage = 0;
  PageController? controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: ((int page) {
                setState(() {
                  currentPage = page;
                });
              }),
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              controller: controller,
              children: List.generate(
                pages.length,
                ((index) {
                  DonutPage currentPage = pages[index];

                  return Container(
                    alignment: Alignment.bottomLeft,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0.0, 5.0))
                      ],
                      image: DecorationImage(
                          image: NetworkImage(currentPage.imgUrl!),
                          fit: BoxFit.cover),
                    ),
                    child: Image(
                      image: NetworkImage(currentPage.logoImgUrl!),
                      width: 120,
                    ),
                  );
                }),
              ),
            ),
          ),
          PageViewIndicator(
            controller: controller,
            currentpages: currentPage,
            numberofpages: pages.length,
          )
        ],
      ),
    );
  }
}
