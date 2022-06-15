import 'package:flutter/material.dart';

class MyScrollable extends StatelessWidget {
  final Widget child;
  const MyScrollable({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: constraints.maxHeight),
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: child,
          ),
        ),
      );
    });
  }
}
