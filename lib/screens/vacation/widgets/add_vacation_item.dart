import 'package:flutter/material.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/screens/vacation/widgets/date_and_time_picker_textfield.dart';
import 'package:call_steward/widgets/space_horizontal.dart';

class AddVacationItem extends StatelessWidget {
  final String lable;
  final bool isDate;
  final TextEditingController controller;
  final bool isEdit;
  final bool isStartDate;
  const AddVacationItem({
    super.key,
    required this.lable,
    required this.isDate,
    required this.isEdit,
    required this.controller,
    this.isStartDate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment:
            isEdit ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            '$lable:',
            maxLines: 1,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: isEdit ? ColorPalette.black : ColorPalette.blueText,
                  fontWeight: isEdit ? FontWeight.bold : null,
                ),
          ),
          const Expanded(
            child: SpaceHorizontal(double.infinity),
          ),
          DateAndTimePickerTextField(
            controller: controller,
            lable: lable,
            isDate: isDate,
            isEdit: false,
            isStartDate: isStartDate,
          ),
        ],
      ),
    );
  }
}
