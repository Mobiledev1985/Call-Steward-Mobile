import 'package:call_steward/controller/vacation/vacation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:call_steward/utils/utilities.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/widgets/space_horizontal.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class ViewHistoryDialog extends StatelessWidget {
  const ViewHistoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final VacationController vacationController =
        Get.find<VacationController>();
    return Dialog(
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: double.infinity,
              color: ColorPalette.blue,
              child: Row(
                children: [
                  const SpaceHorizontal(20),
                  Text(
                    AppMessagesKey.vacationHistory.tr,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorPalette.white,
                        ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
            const SpaceVertical(12),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: 250,
                child: Obx(
                  () {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView.separated(
                        itemBuilder: (_, index) {
                          final currentData =
                              vacationController.vacationHistory[index];
                          final startText = DateFormat(
                            Utilities.getDateFormat(vacationController
                                    .employeeDetailModel.result!.dateFormat ??
                                ""),
                          ).format(currentData.start);
                          final endText = DateFormat(
                            Utilities.getDateFormat(vacationController
                                    .employeeDetailModel.result!.dateFormat ??
                                ""),
                          ).format(currentData.end);
                          return Text.rich(
                            TextSpan(
                              text: '${AppMessagesKey.tookLeaveFrom.tr} ',
                              style: Theme.of(context).textTheme.bodySmall!,
                              children: [
                                TextSpan(
                                  text: startText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                    text: " ${AppMessagesKey.to.tr} ",
                                    style:
                                        Theme.of(context).textTheme.bodySmall!),
                                TextSpan(
                                  text: endText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          );
                          // return const Text(
                          //     'Took leave from July 28 2022to July 28 2022.', );
                        },
                        separatorBuilder: (_, __) => const Divider(),
                        itemCount: vacationController.vacationHistory.length,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
