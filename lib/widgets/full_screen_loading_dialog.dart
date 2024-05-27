import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/widgets/loading.dart';
import 'package:call_steward/widgets/space_horizontal.dart';
import 'package:flutter/material.dart';

class FullScreenLoadingDialog extends StatelessWidget {
  final String message;

  const FullScreenLoadingDialog({super.key, this.message = 'Loading...'});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Loading(
              color: ColorPalette.blue,
            ),
            const SpaceHorizontal(24),
            Text(
              message,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
