import 'package:donut_shopping/pages/donutfavoritepage.dart';
import 'package:donut_shopping/pages/donutmainpage.dart';
import 'package:donut_shopping/pages/donutshoppingcartpage.dart';
import 'package:donut_shopping/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../widgets/donutbottombar.dart';

class DonutLandingPage extends StatelessWidget {
  const DonutLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Utils.mainDark),
        centerTitle: true,
        title: const Image(
          image: NetworkImage(Utils.donutLogoRedText),
          width: 120,
        ),
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.all(40),
          color: Utils.mainDark,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Align(
                alignment: Alignment.topLeft,
                child: Image(
                  image: NetworkImage(Utils.donutLogoWhiteNoText),
                  width: 100,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Image(
                  image: NetworkImage(Utils.donutLogoWhiteText),
                  width: 150,
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Navigator(
              key: Utils.mainListNav,
              initialRoute: '/main',
              onGenerateRoute: (RouteSettings settings) {
                Widget page;
                // switching according to the current state of the navigator
                switch (settings.name) {
                  case '/main':
                    page = const DonutMainPage();
                    break;
                  case '/favorites':
                    page = const DonutFavoritePage();
                    break;
                  case '/shoppingcart':
                    page = const DonutShoppingCartPage();
                    break;
                  default:
                    page = const Center(
                      child: Text('main'),
                    );
                    break;
                }

                return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => page,
                  transitionDuration: const Duration(seconds: 0),
                );
              },
            ),
          ),
          const DonutBottomBar(),
          Container()
        ],
      ),
    );
  }
}
