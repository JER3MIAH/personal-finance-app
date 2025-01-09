import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:personal_finance_app/src/features/budget/data/models/budget.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class BudgetSummaryPieChart extends StatelessWidget {
  final List<Budget> budgets;
  const BudgetSummaryPieChart({
    super.key,
    required this.budgets,
  });

  @override
  Widget build(BuildContext context) {
    final max = budgets.fold(
      0.0,
      (prevValue, budget) => budget.maximum + prevValue,
    );
    final totalSpent = budgets.fold(
      0.0,
      (prevValue, budget) => budget.spent + prevValue,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 240,
          height: 240,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  sections: List.generate(
                    budgets.length,
                    (index) {
                      final budget = budgets[index];
                      return PieChartSectionData(
                        title: budget.category,
                        showTitle: false,
                        radius: 50,
                        color: getColorFromTheme(budget.theme),
                        value: (budget.spent / budget.maximum),
                      );
                    },
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AutoSizeText(
                    '\$$totalSpent',
                    maxLines: 1,
                    style: textPreset1,
                  ),
                  AutoSizeText(
                    'of \$$max limit',
                    maxLines: 1,
                    style: textPreset5.copyWith(color: appColors.beige500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
