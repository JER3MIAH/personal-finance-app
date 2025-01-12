import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/features/budget/data/models/budget.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class AddBudgetDialog extends StatelessWidget {
  final Budget? budget;
  const AddBudgetDialog({
    super.key,
    required this.budget,
  });

  @override
  Widget build(BuildContext context) {
    void closeModal() {
      AppNavigator(context).popDialog();
    }

    return Padding(
      padding: EdgeInsets.all(spacing300),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${budget == null ? 'Add' : 'Edit'} Budget',
                style: textPreset1,
              ),
              GestureDetector(
                onTap: closeModal,
                child: SvgAsset(iconCloseModal),
              ),
            ],
          ),
          Text(
            budget == null
                ? 'Choose a category to set a spending budget. These categories can help you monitor spending.'
                : 'As your budgets change, feel free to update your spending limits.',
            style: textPreset4.copyWith(color: appColors.grey500),
          ),
          //*

          //*
          AppButton(
            title: budget == null ? 'Add Budget' : 'Save Changes',
            color: appColors.black,
            onTap: () {},
            height: 53,
            expanded: true,
          ),
        ],
      ),
    );
  }
}
