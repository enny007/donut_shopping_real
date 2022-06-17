import 'package:donut_shopping/pages/donutshopdetails.dart';
import 'package:donut_shopping/pages/mainlandingpage.dart';
import 'package:donut_shopping/services/donutfavoriteservice.dart';
import 'package:donut_shopping/services/donutshoppingcartservice.dart';
import 'package:donut_shopping/utils/extensions.dart';
import 'package:donut_shopping/widgets/donutbaritems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/splashpage.dart';
import 'services/donutservice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DonutBottomBarSelectionService()),
        ChangeNotifierProvider(create: (_) => DonutService()),
        ChangeNotifierProvider(create: (_) => DonutShoppingCartService()),
        ChangeNotifierProvider(create: (_) => DonutFavoriteService())
      ],
      builder: (context, child) {
        return MaterialApp(
          initialRoute: '/',
          navigatorKey: Utils.mainAppNav,
          routes: {
            '/': ((context) => const SplashPage()),
            '/main': ((context) => const DonutLandingPage()),
            '/details': ((context) => const DonutShopDetails())
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
