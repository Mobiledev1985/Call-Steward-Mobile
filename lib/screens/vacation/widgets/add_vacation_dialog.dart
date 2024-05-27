import 'package:call_steward/screens/vacation/widgets/add_vacation_dialog_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/controller/vacation/vacation_controller.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/widgets/loading.dart';
import 'package:call_steward/widgets/space_horizontal.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class AddVacationDialog extends StatelessWidget {
  const AddVacationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final VacationController vacationController =
        Get.find<VacationController>();
    return Dialog(
      child: IntrinsicHeight(
        child: Form(
          key: vacationController.formForAddDialog,
          child: SingleChildScrollView(
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
                        AppMessagesKey.addVacation.tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: ColorPalette.white,
                            ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          vacationController.clearTextField();
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
                Theme(
                  data: ThemeData(
                    inputDecorationTheme: InputDecorationTheme(
                      contentPadding: const EdgeInsets.fromLTRB(12, 0, 18, 0),
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: ColorPalette.darkGray,
                              ),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(4)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(4)),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(4)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppMessagesKey.label.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: ColorPalette.blueText),
                            ),
                            const SpaceVertical(12),
                            SizedBox(
                              width: 240,
                              child: TextFormField(
                                controller: vacationController.labelController,
                                maxLines: 3,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: ColorPalette.black,
                                    ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  hintText: AppMessagesKey.textArea.tr,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color:
                                            ColorPalette.black.withOpacity(0.6),
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        AddVacationDialogItem(
                          controller: vacationController.startDateController,
                          lable: AppMessagesKey.startDate.tr,
                          isDate: true,
                          isStartDate: true,
                        ),
                        AddVacationDialogItem(
                          controller: vacationController.startTimeController,
                          lable: AppMessagesKey.startTime.tr,
                          isDate: false,
                        ),
                        AddVacationDialogItem(
                          controller: vacationController.endDateController,
                          lable: AppMessagesKey.endDate.tr,
                          isDate: true,
                        ),
                        AddVacationDialogItem(
                          controller: vacationController.endTimeController,
                          lable: AppMessagesKey.endTime.tr,
                          isDate: false,
                        ),
                        const SpaceVertical(20),
                        const Divider(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 150,
                      height: 40,
                      child: Obx(
                        () {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPalette.green),
                            onPressed: vacationController.isLoading
                                ? () {}
                                : () {
                                    vacationController.addVacation(
                                        context, true);
                                  },
                            child: vacationController.isLoading
                                ? const Loading()
                                : Text(AppMessagesKey.submit.tr),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
