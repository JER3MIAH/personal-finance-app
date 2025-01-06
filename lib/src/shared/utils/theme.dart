import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: appColors.beige100,
  textTheme: TextTheme().apply(
    fontFamily: publicSans,
  ),
  colorScheme: ColorScheme.light(
    surface: appColors.white,
    onSurface: appColors.black,
  ),
);

//* Typography
final textPreset1 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 32.0,
  height: 1.2,
  letterSpacing: 0.0,
  color: appColors.grey900,
);

final textPreset2 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
  height: 1.2,
  letterSpacing: 0.0,
  color: appColors.grey900,
);

final textPreset3 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16.0,
  height: 1.5,
  letterSpacing: 0.0,
  color: appColors.grey900,
);

final textPreset4 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14.0,
  height: 1.5,
  letterSpacing: 0.0,
  color: appColors.grey900,
);

final textPreset4Bold = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14.0,
  height: 1.5,
  letterSpacing: 0.0,
  color: appColors.grey900,
);

final textPreset5 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 12.0,
  height: 1.5,
  letterSpacing: 0.0,
  color: appColors.grey900,
);

final textPreset5Bold = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 12.0,
  height: 1.5,
  letterSpacing: 0.0,
  color: appColors.grey900,
);
