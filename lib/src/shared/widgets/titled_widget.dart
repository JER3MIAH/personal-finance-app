import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class TitledWidget extends StatelessWidget {
  final String title;
  final Widget widget;
  const TitledWidget({
    super.key,
    required this.title,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textPreset5Bold.copyWith(
            color: appColors.grey500,
          ),
        ),
        widget,
      ],
    );
  }
}
