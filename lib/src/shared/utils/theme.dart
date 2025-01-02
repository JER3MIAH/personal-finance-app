import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: appColors.white,
  textTheme: TextTheme().apply(
    fontFamily: publicSans,
  ),
  colorScheme: ColorScheme.light(
    surface: appColors.white,
    onSurface: appColors.black,
  ),
);
