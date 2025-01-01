import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/utils/colors.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: appColors.white,
  colorScheme: ColorScheme.light(
    surface: appColors.white,
    onSurface: appColors.black,
  ),
);
