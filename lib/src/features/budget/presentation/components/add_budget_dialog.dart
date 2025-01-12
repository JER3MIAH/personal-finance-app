import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_finance_app/src/features/budget/data/models/budget.dart';
import 'package:personal_finance_app/src/features/budget/logic/blocs/blocs.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class AddBudgetDialog extends HookWidget {
  final Budget? budget;
  const AddBudgetDialog({
    super.key,
    this.budget,
  });

  @override
  Widget build(BuildContext context) {
    final budgetBloc = context.read<BudgetBloc>();
    final maximumSpendController =
        useTextEditingController(text: budget?.maximum.toString());
    final budgetCategory =
        useState<String>(budget?.category ?? FILTER_OPTIONS[0]);
    final budgettheme =
        useState<String>(budget?.theme ?? THEME_OPTIONS.keys.toList()[0]);

    void closeModal() {
      AppNavigator(context).popDialog();
    }

    void addBudget() {
      budgetBloc.add(
        AddNewBudget(
          budget: Budget(
            category: budgetCategory.value,
            maximum: double.tryParse(maximumSpendController.text.trim()) ?? 0.0,
            theme: budgettheme.value,
            spent: 0,
          ),
        ),
      );
    }

    void editBudget() {
      budgetBloc.add(
        EditBudget(
          budgetCategory: budget!.category,
          editedBudget: Budget(
            category: budgetCategory.value,
            maximum: double.tryParse(maximumSpendController.text.trim()) ?? 0.0,
            theme: budgettheme.value,
            spent: 0,
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(spacing300),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              TitledWidget(
                title: 'Budget Category',
                widget: AppDropdown(
                  dropdownValue: budgetCategory,
                  items: FILTER_OPTIONS,
                  disbledItems:
                      budgetBloc.state.budgets.map((b) => b.category).toList(),
                ),
              ),
              TitledWidget(
                title: 'Maximum Spend',
                widget: AppTextField(
                  controller: maximumSpendController,
                  keyboardType: TextInputType.number,
                  hintText: '\$',
                ),
              ),
              TitledWidget(
                title: 'Theme',
                widget: ThemeDropdown(
                  dropdownValue: budgettheme,
                  items: THEME_OPTIONS.keys.toList(),
                  disbledItems:
                      budgetBloc.state.budgets.map((b) => b.theme).toList(),
                ),
              ),
            ],
          ),
          //*
          AppButton(
            title: budget == null ? 'Add Budget' : 'Save Changes',
            color: appColors.black,
            onTap: () {
              if (maximumSpendController.text.trim().isEmpty ||
                  budgetCategory.value.isEmpty ||
                  budgettheme.value.isEmpty ||
                  budgetBloc.state.budgets
                      .map((b) => b.category)
                      .toList()
                      .contains(budgetCategory.value) ||
                  budgetBloc.state.budgets
                      .map((b) => b.theme)
                      .toList()
                      .contains(budgettheme.value)) {
                return;
              }
              AppNavigator(context).popDialog();
              if (budget == null) {
                addBudget();
              } else {
                editBudget();
              }
            },
            height: 53,
            expanded: true,
          ),
        ],
      ),
    );
  }
}
