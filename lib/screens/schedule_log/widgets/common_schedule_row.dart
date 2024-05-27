import 'package:flutter/material.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class CommonScheduleRow extends StatelessWidget {
  final String firsTitle;
  final String firstSubtitle;
  final String secondTitle;
  final String seconfSubtitle;
  const CommonScheduleRow(
      {super.key,
      required this.firsTitle,
      required this.firstSubtitle,
      required this.secondTitle,
      required this.seconfSubtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$firsTitle:",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorPalette.blueText,
                      ),
                ),
                const SpaceVertical(4),
                Text(
                  firstSubtitle,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorPalette.blackText,
                      ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$secondTitle:',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorPalette.blueText,
                      ),
                ),
                const SpaceVertical(4),
                Text(
                  seconfSubtitle,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorPalette.blackText,
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
