import 'package:call_steward/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/constants/ui_constant.dart';

// Global theme
mixin AppThemeMixin {
  ThemeData appTheme(BuildContext context) => ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              Size(Utilities.isTablet() ? 600 : double.infinity, 55),
            ),
            maximumSize: MaterialStateProperty.all<Size>(
              const Size(double.infinity, 55),
            ),
            alignment: Alignment.center,
            textStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            backgroundColor: MaterialStateProperty.all(ColorPalette.blue),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorPalette.darkBlue,
          contentPadding: const EdgeInsets.fromLTRB(12, 4, 18, 4),
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorPalette.darkGray,
              ),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.6),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.6),
              borderRadius: BorderRadius.circular(8)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.6),
              borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.6),
              borderRadius: BorderRadius.circular(8)),
          suffixStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: ColorPalette.green),
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: ColorPalette.black, fontSize: 12),
          bodyMedium: TextStyle(color: ColorPalette.black, fontSize: 14),
          titleLarge: TextStyle(color: ColorPalette.black, fontSize: 16),
          headlineSmall: TextStyle(color: ColorPalette.black, fontSize: 18),
          headlineMedium: TextStyle(color: ColorPalette.black, fontSize: 20),
          displaySmall: TextStyle(color: ColorPalette.black, fontSize: 22),
          displayMedium: TextStyle(color: ColorPalette.black, fontSize: 24),
          displayLarge: TextStyle(color: ColorPalette.black, fontSize: 26),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: ColorPalette.blue,
          titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: ColorPalette.white,
              ),
          actionsIconTheme: const IconThemeData(
            color: ColorPalette.white,
          ),
        ),
      );
}
