import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/localization/app_messages_key.dart';

class OrView extends StatelessWidget {
  const OrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: ColorPalette.darkGray,
            thickness: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            AppMessagesKey.or.tr,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorPalette.white, fontWeight: FontWeight.w400),
          ),
        ),
        const Expanded(
          child: Divider(
            color: ColorPalette.darkGray,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
