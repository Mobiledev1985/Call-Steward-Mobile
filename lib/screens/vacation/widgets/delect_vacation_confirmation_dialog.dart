import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/widgets/space_horizontal.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class DeleteVacationConfirmationDialog extends StatelessWidget {
  final GestureTapCallback onTap;
  const DeleteVacationConfirmationDialog({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: IntrinsicHeight(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Text(
                AppMessagesKey.warning.tr,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(),
              ),
            ),
            const Divider(
              thickness: 1.3,
              height: 0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: ColorPalette.orange,
                    radius: 12,
                    child: Icon(
                      FontAwesomeIcons.exclamation,
                      color: ColorPalette.white,
                      size: 14,
                    ),
                  ),
                  const SpaceHorizontal(8),
                  Expanded(
                    child: Text(
                      AppMessagesKey.thisWillDelete.tr,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 1.3,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      AppMessagesKey.cancel.tr,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: ColorPalette.blueText,
                          ),
                    ),
                  ),
                ),
                Container(
                  width: 1.3,
                  height: 40,
                  color: Theme.of(context).dividerColor,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                      onTap.call();
                    },
                    child: Text(
                      AppMessagesKey.ok.tr,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: ColorPalette.blueText,
                          ),
                    ),
                  ),
                )
              ],
            ),
            const SpaceVertical(10)
          ],
        ),
      ),
    );
  }
}
