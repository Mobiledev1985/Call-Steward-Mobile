import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class JobCallItem extends StatelessWidget {
  final String title;
  final String value;
  final bool isHtmlText;
  const JobCallItem({
    super.key,
    required this.title,
    required this.value,
    this.isHtmlText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: ColorPalette.blueText,
              ),
        ),
        const SpaceVertical(6),
        isHtmlText
            ? Html(
                data: value,
                style: {
                  "*": Style(
                      fontSize: FontSize(12),
                      color: ColorPalette.blackText,
                      margin: Margins.zero)
                },
              )
            : Text(
                value,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorPalette.blackText,
                    ),
              ),
      ],
    );
  }
}
