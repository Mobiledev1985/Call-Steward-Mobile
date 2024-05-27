import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/widgets/custom_expansion_pannel.dart';
import 'package:call_steward/widgets/job_call_item.dart';
import 'package:call_steward/widgets/space_vertical.dart';
import 'package:call_steward/widgets/wthite_box_with_border.dart';

class JobItem extends StatelessWidget {
  final String eventName;
  final String dateRange;
  final String location;
  final String steward;
  final GestureTapCallback? onTap;
  const JobItem(
      {super.key,
      required this.eventName,
      required this.dateRange,
      required this.location,
      required this.steward,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: CustomExpansionPanel(
        customIcon: onTap == null ? null : FontAwesomeIcons.trash,
        header: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(eventName),
            const SpaceVertical(4),
            Text.rich(
              TextSpan(
                text: '${AppMessagesKey.dateRange.tr} :',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                children: [
                  TextSpan(
                      text: dateRange,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: ColorPalette.blackText))
                ],
              ),
            )
          ],
        ),
        body: WhiteBoxWithBorder(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                JobCallItem(
                  title: AppMessagesKey.eventName.tr,
                  value: eventName,
                ),
                const SpaceVertical(18),
                JobCallItem(
                  title: AppMessagesKey.location.tr,
                  value: location,
                ),
                const SpaceVertical(18),
                JobCallItem(
                  title: AppMessagesKey.steward.tr,
                  value: steward,
                )
              ],
            ),
          ),
        ),
        onIconTap: onTap,
      ),
    );
  }
}
