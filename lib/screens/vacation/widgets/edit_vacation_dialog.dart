import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/utils/utilities.dart';
import 'package:call_steward/controller/vacation/vacation_controller.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/model/vacation/vacation.dart';
import 'package:call_steward/screens/vacation/widgets/add_vacation_item.dart';
import 'package:call_steward/widgets/loading.dart';
import 'package:call_steward/widgets/space_horizontal.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class EditVacationDialog extends StatefulWidget {
  final Ing vacation;
  const EditVacationDialog({super.key, required this.vacation});

  @override
  State<EditVacationDialog> createState() => _EditVacationDialogState();
}

class _EditVacationDialogState extends State<EditVacationDialog> {
  final VacationController vacationController = Get.find<VacationController>();
  @override
  void initState() {
    super.initState();
    vacationController.labelController.text = widget.vacation.label;
    final dateFormat = Utilities.getDateFormat(
        Get.find<VacationController>().employeeDetailModel.result!.dateFormat ??
            "");
    vacationController.startDateController.text =
        DateFormat(dateFormat).format(widget.vacation.start);
    vacationController.endDateController.text =
        DateFormat(dateFormat).format(widget.vacation.end);
    if (!Utilities.is24HourFormat(
        vacationController.employeeDetailModel.result!.timeFormat!)) {
      vacationController.startTimeController.text =
          DateFormat.jm().format(widget.vacation.start);
      vacationController.endTimeController.text =
          DateFormat.jm().format(widget.vacation.end);
    } else {
      vacationController.startTimeController.text =
          "${widget.vacation.start.hour}:${widget.vacation.start.minute}";
      DateFormat.jms().format(widget.vacation.start);
      vacationController.endTimeController.text =
          "${widget.vacation.end.hour}:${widget.vacation.end.minute}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: IntrinsicHeight(
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
                      AppMessagesKey.editVacation.tr,
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
              const SpaceVertical(12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                  data: ThemeData(
                    inputDecorationTheme: InputDecorationTheme(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppMessagesKey.label.tr,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SpaceVertical(10),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: vacationController.labelController,
                          maxLines: 3,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
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
                                  color: ColorPalette.black.withOpacity(0.6),
                                ),
                          ),
                        ),
                      ),
                      AddVacationItem(
                        controller: vacationController.startDateController,
                        lable: AppMessagesKey.startDate.tr,
                        isDate: true,
                        isEdit: true,
                        isStartDate: true,
                      ),
                      AddVacationItem(
                        controller: vacationController.startTimeController,
                        lable: AppMessagesKey.startTime.tr,
                        isDate: false,
                        isEdit: true,
                      ),
                      AddVacationItem(
                        controller: vacationController.endDateController,
                        lable: AppMessagesKey.endDate.tr,
                        isDate: true,
                        isEdit: true,
                      ),
                      AddVacationItem(
                        controller: vacationController.endTimeController,
                        lable: AppMessagesKey.endTime.tr,
                        isDate: false,
                        isEdit: true,
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
                    width: 120,
                    height: 40,
                    child: Obx(
                      () {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorPalette.green),
                          onPressed: vacationController.isLoadingEditVacation
                              ? () {}
                              : () {
                                  vacationController.editVacation(
                                      context, widget.vacation.id);
                                },
                          child: vacationController.isLoadingEditVacation
                              ? const Loading()
                              : Text(AppMessagesKey.submit.tr),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
