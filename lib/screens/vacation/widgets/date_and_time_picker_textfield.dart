import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:call_steward/controller/vacation/vacation_controller.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/utils/utilities.dart';
import 'package:call_steward/utils/validators/validators.dart';

class DateAndTimePickerTextField extends StatelessWidget {
  final String lable;
  final TextEditingController controller;
  final bool isDate;
  final bool isStartDate;
  final bool isEdit;
  final double width;
  const DateAndTimePickerTextField({
    super.key,
    required this.lable,
    required this.controller,
    required this.isDate,
    required this.isEdit,
    this.isStartDate = false,
    this.width = 175,
  });

  @override
  Widget build(BuildContext context) {
    final VacationController vacationController =
        Get.find<VacationController>();
    return SizedBox(
      width: width,
      child: TextFormField(
        onTap: () async {
          FocusScope.of(context).unfocus();
          if (isDate) {
            final DateTime? date = await showDatePicker(
              context: context,
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: ColorPalette.blue, // header background color
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor:
                            ColorPalette.green, // button text color
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
              initialDate: controller.text.isEmpty
                  ? DateTime.now()
                  : DateFormat(
                      Utilities.getDateFormat(vacationController
                              .employeeDetailModel.result!.dateFormat ??
                          ""),
                    ).parse(controller.text),
              firstDate: isStartDate ||
                      vacationController.startDateController.text.isEmpty
                  ? DateTime.now()
                  : DateFormat(
                      Utilities.getDateFormat(vacationController
                              .employeeDetailModel.result!.dateFormat ??
                          ""),
                    ).parse(vacationController.startDateController.text),
              lastDate: DateTime(2100),
            );
            if (date != null) {
              final String formatedDate = DateFormat(Utilities.getDateFormat(
                      vacationController
                              .employeeDetailModel.result!.dateFormat ??
                          ""))
                  .format(date);
              controller.text = formatedDate;
              if (isStartDate) {
                vacationController.endDateController.text = formatedDate;
              }
            }
          } else {
            final TimeOfDay? time = await showTimePicker(
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    alwaysUse24HourFormat: Utilities.is24HourFormat(
                        vacationController
                                .employeeDetailModel.result!.timeFormat ??
                            'HH:mm'),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: ColorPalette.blue, // header background color
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor:
                              ColorPalette.green, // button text color
                        ),
                      ),
                    ),
                    child: child!,
                  ),
                );
              },
              initialEntryMode: Utilities.is24HourFormat(vacationController
                          .employeeDetailModel.result!.timeFormat ??
                      'HH:mm')
                  ? TimePickerEntryMode.inputOnly
                  : TimePickerEntryMode
                      .dialOnly, // Display the numeric keyboard for hour input
              context: context,
              initialTime: controller.text.isEmpty
                  ? TimeOfDay.now()
                  : Utilities.is24HourFormat(vacationController
                          .employeeDetailModel.result!.timeFormat!)
                      ? Utilities.stringToTimeOfDayFor24Hours(controller.text)
                      : Utilities.stringToTimeOfDay(controller.text),
            );
            if (time != null) {
              DateFormat inputFormatter = DateFormat('h:mm a');
              DateFormat outputFormatter = DateFormat(
                  vacationController.employeeDetailModel.result!.timeFormat!);
              DateTime parsedTime =
                  inputFormatter.parse(time.format(Get.context ?? context));
              controller.text = outputFormatter.format(parsedTime);
            }
          }
        },
        controller: controller,
        readOnly: true,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: ColorPalette.black,
              fontWeight: isEdit ? FontWeight.bold : null,
            ),
        textInputAction: TextInputAction.next,
        validator: Validators.emptyValidator,
        decoration: InputDecoration(
          hintText: lable,
          isDense: true,
          suffixIcon: Visibility(
            visible: !isEdit,
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                FontAwesomeIcons.calendarDays,
                color: ColorPalette.blueText,
              ),
            ),
          ),
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 20,
          ),
          contentPadding: const EdgeInsets.all(8),
          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: ColorPalette.black.withOpacity(0.6),
              ),
        ),
      ),
    );
  }
}
