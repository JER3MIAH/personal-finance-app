import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/features/budget/logic/blocs/blocs.dart';
import 'package:personal_finance_app/src/features/budget/presentation/components/components.dart';
import 'package:personal_finance_app/src/features/transactions/logic/blocs/blocs.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceType(context).isMobile;
    final isDesktop = DeviceType(context).isDesktop;

    void addBudget() {
      AppDialog.dialog(context, AddBudgetDialog());
    }

    return Scaffold(
      body: BlocBuilder<BudgetBloc, BudgetState>(
        builder: (_, budgetState) {
          final budgets = budgetState.budgets;
          return BlocBuilder<TransactionBloc, TransactionState>(
            builder: (_, transactionState) {
              final transactions = transactionState.transactions;

              return AppColumn(
                shouldScroll: false,
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
                  YBox(20),
                  if (budgets.isEmpty)
                    EmptyStateContainer(
                      title: 'You currently have no budgets created.',
                    ),
                  if (isDesktop && budgets.isNotEmpty)
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BudgetSummaryContainer(),
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: NoThumbScrollBehavior(),
                              child: ListView.builder(
                                itemCount: budgets.length,
                                itemBuilder: (_, index) {
                                  final budget = budgets[index];
                                  return BudgetContainer(
                                    budget: budget,
                                    transactions: transactions
                                        .where((t) =>
                                            t.category == budget.category)
                                        .toList(),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: NoThumbScrollBehavior(),
                        child: ListView.builder(
                          itemCount: budgets.length + 1,
                          itemBuilder: (_, index) {
                            if (index == 0) {
                              return budgets.isEmpty
                                  ? SizedBox.shrink()
                                  : BudgetSummaryContainer();
                            }
                            final budget = budgets[index - 1];
                            return BudgetContainer(
                              budget: budget,
                              transactions: transactions
                                  .where((t) => t.category == budget.category)
                                  .toList(),
                            );
                          },
                        ),
                      ),
                    )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
