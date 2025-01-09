import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

//* Spacing
const spacing50 = 4.0;
const spacing100 = 8.0;
const spacing150 = 12.0;
const spacing200 = 16.0;
const spacing250 = 20.0;
const spacing300 = 24.0;
const spacing400 = 32.0;
const spacing500 = 40.0;

const FILTER_OPTIONS = [
  'All Transactions',
  'General',
  'Entertainment',
  'Bills',
  'Groceries',
  'Dining Out',
  'Transportation',
  'Personal Care',
  'Education',
  'Lifestyle',
  'Shopping',
];
const SORT_OPTIONS = [
  'Latest',
  'Oldest',
  'A to Z',
  'Z to A',
  'Highest',
  'Lowest',
];

//*--------------------
final THEME_OPTIONS = {
  'Green': appColors.green,
  'Yellow': appColors.yellow,
  'Cyan': appColors.cyan,
  'Navy': appColors.navy,
  'Red': appColors.red,
  'Purple': appColors.purple,
  'Purple2': appColors.purple2,
  'Turquoise': appColors.turquoise,
  'Brown': appColors.brown,
  'Magneta': appColors.magenta,
  'Blue': appColors.blue,
  'Navy Grey': appColors.navyGrey,
  'Army Green': appColors.armyGreen,
  'Gold': appColors.gold,
  'Orange': appColors.orange,
};

Color getColorFromTheme(String themeName) {
  return THEME_OPTIONS[themeName] ?? Colors.black;
}
