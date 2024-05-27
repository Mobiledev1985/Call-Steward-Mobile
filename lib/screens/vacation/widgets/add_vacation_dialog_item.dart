import 'package:flutter/material.dart';
import 'package:call_steward/screens/vacation/widgets/date_and_time_picker_textfield.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class AddVacationDialogItem extends StatelessWidget {
  final String lable;
  final bool isDate;
  final bool isStartDate;
  final TextEditingController controller;

  const AddVacationDialogItem({
    super.key,
    required this.lable,
    required this.isDate,
    required this.controller,
    this.isStartDate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$lable:',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorPalette.blueText,
                ),
          ),
          const SpaceVertical(12),
          DateAndTimePickerTextField(
            controller: controller,
            lable: lable,
            isDate: isDate,
            isEdit: false,
            width: 240,
            isStartDate: isStartDate,
          ),
        ],
      ),
    );
  }
}
