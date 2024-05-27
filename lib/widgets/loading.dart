import 'package:flutter/material.dart';
import 'package:call_steward/constants/colorpalette.dart';

class Loading extends StatelessWidget {
  final Color color;
  const Loading({super.key, this.color = ColorPalette.white});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
    );
  }
}
