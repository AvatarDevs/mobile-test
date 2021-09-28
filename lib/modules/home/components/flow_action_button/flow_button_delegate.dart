import 'package:flutter/material.dart';

class FlowButtonDelegate extends FlowDelegate {
  final Animation<double> myAnimation;

  FlowButtonDelegate({required this.myAnimation}) : super(repaint: myAnimation);

  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i = context.childCount - 1; i >= 0; i--) {
      double dx = (context.getChildSize(i)!.height + 0) * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          i == 0
              ? context.getChildSize(i)!.width / 2
              : context.getChildSize(i)!.width - 5,
          (context.getChildSize(i)!.height*2) + (-dx * myAnimation.value + 10),
          0,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowButtonDelegate oldDelegate) {
    return myAnimation != oldDelegate.myAnimation;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(100.0, 200);
  }

  /// allowed size for children
  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return i == 0 ? constraints : BoxConstraints.tight(Size(50.0, 50.0));
  }
}
