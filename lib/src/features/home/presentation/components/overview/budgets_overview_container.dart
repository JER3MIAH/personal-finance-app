import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/features/budget/data/models/budget.dart';
import 'package:personal_finance_app/src/features/budget/logic/blocs/blocs.dart';
import 'package:personal_finance_app/src/features/budget/presentation/components/budget_summary_pie_chart.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

import 'see_details.dart';

class BudgetsOverviewContainer extends StatelessWidget {
  final VoidCallback onSeeDetails;
  const BudgetsOverviewContainer({
    super.key,
    required this.onSeeDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetBloc, BudgetState>(
      builder: (_, state) {
        final budgets = state.budgets;

        return Container(
          padding: EdgeInsets.all(spacing300),
          decoration: BoxDecoration(
            color: appColors.white,
            borderRadius: BorderRadius.circular(spacing150),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Budgets',
                    style: textPreset2,
                  ),
                  buildSeeDetails(
                    onTap: onSeeDetails,
                  ),
                ],
              ),
              YBox(spacing300),
              Row(
                spacing: spacing200,
                children: [
                  BudgetSummaryPieChart(budgets: budgets),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: spacing100,
                    children: List.generate(
                      budgets.length > 4 ? 4 : budgets.length,
                      (index) {
                        return _buildBudgetItem(
                          budget: budgets[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBudgetItem({
    required Budget budget,
  }) {
    return Row(
      spacing: spacing200,
      children: [
        Container(
          width: 4,
          height: 43,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: getColorFromTheme(budget.theme),
            borderRadius: BorderRadius.circular(spacing100),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              budget.category,
              style: textPreset5.copyWith(color: appColors.grey500),
            ),
            Text(
              budget.spent.toString(),
              style: textPreset4Bold,
            ),
          ],
        ),
      ],
    );
  }
}
