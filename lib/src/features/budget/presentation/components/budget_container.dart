import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/features/budget/data/models/models.dart';
import 'package:personal_finance_app/src/features/home/logic/cubits/bottom_nav_bar_cubit.dart';
import 'package:personal_finance_app/src/features/transactions/data/models/transaction.dart';
import 'package:personal_finance_app/src/features/transactions/presentation/components/components.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class BudgetContainer extends StatelessWidget {
  final Budget budget;
  final List<Transaction> transactions;
  const BudgetContainer({
    super.key,
    required this.budget,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    final budgetTheme = getColorFromTheme(budget.theme);

    double percentage = (budget.spent / budget.maximum) * 100;

    void onTapEdit() {}
    void onTapDelete() {}

    return Container(
      margin: EdgeInsets.only(bottom: spacing200),
      padding: const EdgeInsets.all(spacing300),
      decoration: BoxDecoration(
        color: appColors.white,
        borderRadius: BorderRadius.circular(spacing150),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: spacing300,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBudgetTitle(
                title: budget.category,
                color: budgetTheme,
              ),
              EditAndDeletePopUpButton(
                title: 'Budget',
                onEdit: onTapEdit,
                onDelete: onTapDelete,
              ),
            ],
          ),
          //*-----
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing200,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Maximum of \$${budget.maximum}',
                    style: textPreset4.copyWith(
                      color: appColors.grey500,
                    ),
                  ),
                ],
              ),
              LinearProgressIndicator(
                backgroundColor: appColors.beige100,
                color: budgetTheme,
                value: percentage / 100,
                minHeight: 30,
                borderRadius: BorderRadius.circular(spacing50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: spacing100,
                children: [
                  _buildCont(isSpent: true),
                  _buildCont(isSpent: false),
                ],
              ),
            ],
          ),
          //*-----
          if (transactions.isNotEmpty)
            _buildLatestSpending(
              onSeeAll: () {
                context.read<BottomNavBarCubit>().setIndex(1);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildBudgetTitle({
    required String title,
    required Color color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: spacing100,
      children: [
        Container(
          width: spacing200,
          height: spacing200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        Text(
          title,
          style: textPreset2.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildCont({
    required bool isSpent,
  }) {
    return Expanded(
      child: SizedBox(
        height: 43,
        child: Row(
          spacing: spacing100,
          children: [
            Container(
              width: 4,
              height: 43,
              decoration: BoxDecoration(
                color: isSpent ? appColors.green : appColors.beige100,
                borderRadius: BorderRadius.circular(spacing200),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isSpent ? 'Spent' : 'Remaining',
                  style: textPreset5.copyWith(color: appColors.beige500),
                ),
                Text(
                  '\$${isSpent ? budget.spent : (budget.maximum - budget.spent)}',
                  style: textPreset4Bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLatestSpending({
    required VoidCallback onSeeAll,
  }) {
    return Container(
      padding: EdgeInsets.all(spacing250),
      decoration: BoxDecoration(
        color: appColors.beige100,
        borderRadius: BorderRadius.circular(spacing150),
      ),
      child: Column(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: onSeeAll,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Spending',
                    style: textPreset3,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'See All',
                        style: textPreset4.copyWith(
                          color: appColors.beige500,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: appColors.beige500,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ...List.generate(
            transactions.length > 3 ? 3 : transactions.length,
            (index) {
              return TransactionTile(
                transaction: transactions[index],
                borderColor: appColors.grey500,
                hasBorder: (index != transactions.length - 1),
              );
            },
          ),
        ],
      ),
    );
  }
}
