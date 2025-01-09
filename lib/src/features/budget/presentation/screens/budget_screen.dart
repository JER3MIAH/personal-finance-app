import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceType(context).isMobile;

    void addBudget() {}

    return Scaffold(
      body: AppColumn(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AutoSizeText(
                  'Budgets',
                  style: textPreset1,
                  maxLines: 1,
                ),
              ),
              if (isMobile)
                AddButton(
                  onTap: addBudget,
                )
              else
                AppButton(
                  title: '+ Add New Budget',
                  color: appColors.grey900,
                  onTap: addBudget,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
