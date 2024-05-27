import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SpaceVertical(30),
          const FaIcon(
            FontAwesomeIcons.faceFrown,
            size: 35,
            color: ColorPalette.orange,
          ),
          const SpaceVertical(10),
          Text(
            'No Data Stored',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          )
        ],
      ),
    );
  }
}
