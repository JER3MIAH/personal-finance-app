import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class BudgetSummaryContainer extends StatelessWidget {
  const BudgetSummaryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = DeviceType(context).isDesktop;

    return Container(
      width: 328,
      height: 500,
      margin: EdgeInsets.only(
        bottom: spacing200,
        right: isDesktop ? spacing200 : 0,
      ),
      padding: const EdgeInsets.all(spacing300),
      decoration: BoxDecoration(
        color: appColors.white,
        borderRadius: BorderRadius.circular(spacing150),
      ),
    );
  }
}
