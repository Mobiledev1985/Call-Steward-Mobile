import 'package:flutter/material.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffix;
  final bool readOnly;
  final String? title;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.controller,
    this.suffix,
    this.readOnly = false,
    this.title,
    this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorPalette.white, fontWeight: FontWeight.normal),
            ),
          ),
        const SpaceVertical(6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          readOnly: readOnly,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: ColorPalette.white),
          decoration: InputDecoration(
            suffix: suffix,
            hintText: hintText,
          ),
          validator: validator,
          obscureText: obscureText,
        ),
      ],
    );
  }
}
