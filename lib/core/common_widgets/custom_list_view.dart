import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  // CHANGED: Horizontal ya vertical list choose karne ke liye.
  final Axis scrollDirection;

  // CHANGED: Items ke darmiyan spacing ke liye.
  final double? separatorWidth;
  final double? separatorHeight;

  // CHANGED: List ki height/width customize karne ke liye.
  final double? height;
  final double? width;

  // CHANGED: Nested scroll situation mein useful.
  final bool shrinkWrap;

  // CHANGED: Scroll physics customize karne ke liye.
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
    // CHANGED: SizedBox se optional height/width control.
    return SizedBox(
      height: height,
      width: width,
      child: ListView.separated(
        scrollDirection: scrollDirection,
        itemCount: itemCount,

        // CHANGED: Nested ListView ke liye shrinkWrap support.
        shrinkWrap: shrinkWrap,

        // CHANGED: Scroll behavior customize karne ke liye.
        physics: physics,

        separatorBuilder: (context, index) {
          // CHANGED: Horizontal list mein width spacing,
          // vertical list mein height spacing.
          return SizedBox(
            width: separatorWidth,
            height: separatorHeight,
          );
        },

        itemBuilder: itemBuilder,
      ),
    );
  }
}