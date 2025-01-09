import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/features/budget/data/models/budget.dart';
import 'package:personal_finance_app/src/features/budget/logic/blocs/blocs.dart';
import 'package:personal_finance_app/src/features/budget/presentation/components/budget_summary_pie_chart.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class BudgetSummaryContainer extends StatelessWidget {
  const BudgetSummaryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = DeviceType(context).isDesktop;

    return BlocBuilder<BudgetBloc, BudgetState>(
      builder: (_, budgetState) {
        final budgets = budgetState.budgets;

        return Container(
          width: 328,
          margin: EdgeInsets.only(
            bottom: spacing200,
            right: isDesktop ? spacing200 : 0,
          ),
          padding: const EdgeInsets.all(spacing300),
          decoration: BoxDecoration(
            color: appColors.white,
            borderRadius: BorderRadius.circular(spacing150),
          ),
          child: Column(
            spacing: spacing200,
            children: [
              BudgetSummaryPieChart(
                budgets: budgets,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Spending Summary',
                    style: textPreset2,
                  ),
                ],
              ),
              ...List.generate(
                budgets.length,
                (index) {
                  return _buildSummaryItem(
                    budget: budgets[index],
                    hasBorder: index != (budgets.length - 1),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildSummaryItem({
    required Budget budget,
    bool hasBorder = true,
  }) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        border: hasBorder
            ? Border(
                bottom: BorderSide(
                  width: 1,
                  color: appColors.grey100,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 21,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: getColorFromTheme(budget.theme),
              borderRadius: BorderRadius.circular(spacing100),
            ),
          ),
          XBox(5),
          Text(
            budget.category,
            style: textPreset4.copyWith(color: appColors.beige500),
          ),
          Spacer(),
          Text.rich(
            TextSpan(
              text: '\$${budget.spent} ',
              style: textPreset3,
              children: [
                TextSpan(
                  text: 'of \$${budget.maximum}',
                  style: textPreset5.copyWith(color: appColors.beige500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
