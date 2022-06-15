import 'package:donut_shopping/utils/extensions.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController? donutController;
  Animation<double>? rotationAnimation;
  @override
  void initState() {
    //initstate initial state of the widget tree
    super.initState();
    donutController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this)
          ..repeat();

    rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: donutController!, curve: Curves.linear));
  }

  @override
  void dispose() {
    donutController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), (() {
      Utils.mainAppNav.currentState!.pushReplacementNamed('/main');
    }));
    return Scaffold(
      backgroundColor: Utils.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: rotationAnimation!,
              child: const Image(
                image: NetworkImage(Utils.donutLogoWhiteNoText),
                width: 150,
                height: 100,
              ),
            ),
            const Image(
              image: NetworkImage(Utils.donutLogoWhiteText),
              width: 150,
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
