import 'package:donut_shopping/services/donutfavoriteservice.dart';
import 'package:donut_shopping/services/donutshoppingcartservice.dart';
import 'package:donut_shopping/utils/extensions.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/donutservice.dart';
import '../widgets/donutcartshoppingwidget.dart';
import '../widgets/donutmodel.dart';
import '../widgets/myscrollable.dart';

class DonutShopDetails extends StatefulWidget {
  const DonutShopDetails({Key? key}) : super(key: key);

  @override
  State<DonutShopDetails> createState() => _DonutShopDetailsState();
}

class _DonutShopDetailsState extends State<DonutShopDetails>
    with SingleTickerProviderStateMixin {
  DonutModel? selectedDonut;
  AnimationController? controller;
  Animation<double>? rotationAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 20), vsync: this)
          ..repeat();
    rotationAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DonutService donutService = context.read<DonutService>();
    //Provider.of<DonutService>(context, listen: false);
    selectedDonut = donutService.getselectedDonut();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Utils.mainDark),
        centerTitle: true,
        title: Image.network(
          Utils.donutLogoRedText,
          width: 120,
        ),
        actions: const [DonutShoppingCartWidget()],
      ),
      body: MyScrollable(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                children: [
                  Positioned(
                    top: -40,
                    right: -120,
                    child: Hero(
                      tag: selectedDonut!.name!,
                      child: RotationTransition(
                        turns: rotationAnimation!,
                        child: Image.network(
                          selectedDonut!.imgUrl!,
                          width: MediaQuery.of(context).size.width * 1.25,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                selectedDonut!.name!,
                                style: const TextStyle(
                                    color: Utils.mainDark,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Consumer<DonutFavoriteService>(
                              builder: (context, value, child) {
                                if (!value.isDonutInCart(selectedDonut!)) {
                                  return IconButton(
                                    onPressed: () {
                                      value.addToCart(selectedDonut!);
                                    },
                                    icon: const Icon(
                                      Icons.favorite_outline,
                                      color: Utils.mainDark,
                                    ),
                                  );
                                }
                                return const Icon(
                                  Icons.favorite_outlined,
                                  color: Utils.mainDark,
                                );
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: Utils.mainDark,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            '\$${selectedDonut!.price!.toStringAsFixed(2)}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(selectedDonut!.description!),
                        Expanded(
                          child: Consumer<DonutShoppingCartService>(
                            builder: ((context, value, child) {
                              if (!value.isDonutInCart(selectedDonut!)) {
                                return GestureDetector(
                                  onTap: () {
                                    value.addToCart(selectedDonut!);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(top: 10),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Utils.mainDark.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.shopping_cart,
                                          color: Utils.mainDark,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'Add to Cart',
                                          style:
                                              TextStyle(color: Utils.mainDark),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  color: Utils.mainDark.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.check_rounded,
                                      color: Utils.mainDark,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Added to Cart',
                                      style: TextStyle(
                                          color: Utils.mainDark,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
