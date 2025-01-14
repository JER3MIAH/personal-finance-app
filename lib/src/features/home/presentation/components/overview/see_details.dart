import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

Widget buildSeeDetails({required VoidCallback onTap, String? title}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          Text(
            title ?? 'See Details',
            style: textPreset4.copyWith(color: appColors.grey500),
          ),
          SvgAsset(iconCaretRight),
        ],
      ),
    ),
  );
}
