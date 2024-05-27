import 'package:flutter/material.dart';
import 'package:call_steward/constants/colorpalette.dart';

class SelectServerRadioWidget extends StatelessWidget {
  final String title;
  final String groupValue;
  final void Function(String?)? onChanged;
  const SelectServerRadioWidget(
      {super.key,
      required this.title,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            value: title,
            groupValue: groupValue,
            onChanged: onChanged,
            title: Text(title),
            activeColor: ColorPalette.blue,
          ),
        )
      ],
    );
  }
}
