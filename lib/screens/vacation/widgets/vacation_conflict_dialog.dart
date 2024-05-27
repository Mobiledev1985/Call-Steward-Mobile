import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:call_steward/controller/vacation/vacation_controller.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class VacationConflictDialog extends StatelessWidget {
  const VacationConflictDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final VacationController vacationController =
        Get.find<VacationController>();
    return Dialog(
      child: IntrinsicHeight(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(child: Text(AppMessagesKey.vacation.tr)),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
            const Divider(),
            const SpaceVertical(10),
            Text(
              AppMessagesKey.contactYourDispatcher.tr,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
            const SpaceVertical(2),
            Text.rich(
              TextSpan(
                text:
                    "${vacationController.startDateController.text} ${vacationController.startTimeController.text} ",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                children: [
                  TextSpan(
                    text: AppMessagesKey.to.tr,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  TextSpan(
                    text:
                        " ${vacationController.endDateController.text} ${vacationController.endTimeController.text}",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ],
              ),
            ),
            const SpaceVertical(30),
          ],
        ),
      ),
    );
  }
}
