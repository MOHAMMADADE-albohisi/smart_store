import 'package:flutter/material.dart';
class pageView extends StatelessWidget {
  const pageView({

    Key? key,
    required this.colors,
    this.marginEnd = 0,
  }) : super(key: key);
  final bool colors;
  final double marginEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      height: 4,
      width: 18,
      decoration: BoxDecoration(
        color: colors? const Color(0xFF6A90F2) : const Color(0xFFDDDDDD),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}