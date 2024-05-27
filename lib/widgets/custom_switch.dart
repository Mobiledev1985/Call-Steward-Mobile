import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:call_steward/constants/colorpalette.dart';

class CustomSwitch extends StatelessWidget {
  final String title;
  final bool isActive;
  final void Function(bool)? onChanged;
  const CustomSwitch({
    super.key,
    required this.title,
    required this.isActive,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 30,
          child: FittedBox(
            fit: BoxFit.fill,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: onChanged,
            ),
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: ColorPalette.blackText,
              ),
        )
      ],
    );
  }
}
