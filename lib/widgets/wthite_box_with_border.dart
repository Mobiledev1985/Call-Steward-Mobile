import 'package:flutter/material.dart';
import 'package:call_steward/constants/colorpalette.dart';

class WhiteBoxWithBorder extends StatelessWidget {
  final Widget child;
  const WhiteBoxWithBorder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.1,
        ),
        color: ColorPalette.white,
        borderRadius: BorderRadius.circular(3),
      ),
      child: child,
    );
  }
}
