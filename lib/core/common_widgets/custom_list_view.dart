import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  final Axis scrollDirection;

  final double? separatorWidth;
  final double? separatorHeight;

  final double? height;
  final double? width;

  final bool shrinkWrap;

  final ScrollPhysics? physics;

  const CustomListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.scrollDirection = Axis.vertical,
    this.separatorWidth,
    this.separatorHeight,
    this.height,
    this.width,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView.separated(
        scrollDirection: scrollDirection,
        itemCount: itemCount,

        shrinkWrap: shrinkWrap,

        physics: physics,

        separatorBuilder: (context, index) {
          return SizedBox(width: separatorWidth, height: separatorHeight);
        },

        itemBuilder: itemBuilder,
      ),
    );
  }
}
