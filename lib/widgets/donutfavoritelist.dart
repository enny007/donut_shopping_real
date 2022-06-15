import 'package:donut_shopping/services/donutfavoriteservice.dart';
import 'package:donut_shopping/widgets/donutfavoritelistrow.dart';
import 'package:flutter/cupertino.dart';

import 'donutmodel.dart';

class DonutFavoriteList extends StatefulWidget {
  final List<DonutModel>? donutcart;
  final DonutFavoriteService? cartService;
  const DonutFavoriteList({Key? key, this.donutcart, this.cartService})
      : super(key: key);

  @override
  State<DonutFavoriteList> createState() => _DonutFavoriteListState();
}

class _DonutFavoriteListState extends State<DonutFavoriteList> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  List<DonutModel> insertedItems = [];

  @override
  void initState() {
    super.initState();
    unpopulateList();
  }

  void unpopulateList() {
    var future = Future(() {});
    for (int i = 0; i < widget.donutcart!.length; i++) {
      future = future.then((_) {
        Future.delayed(const Duration(milliseconds: 125), (() {
          insertedItems.add(widget.donutcart![i]);
          _key.currentState!.insertItem(i);
        }));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _key,
        initialItemCount: insertedItems.length,
        itemBuilder: (context, index, animation) {
          DonutModel currentDonut = widget.donutcart![index];
          return SlideTransition(
            position: Tween(
                    begin: const Offset(0.0, 0.2), end: const Offset(0.0, 0.0))
                .animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            ),
            child: FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
              child: DonutFavoriteListRow(
                donuts: currentDonut,
                onRemoveLike: () {
                  _key.currentState!
                      .removeItem(index, (context, animation) => Container());
                  widget.cartService!.removeFromCart(currentDonut);
                },
              ),
            ),
          );
        });
  }
}
