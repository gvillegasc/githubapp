import 'package:flutter/material.dart';

class InvisibleScroll extends StatelessWidget {
  const InvisibleScroll({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: child);
  }
}
