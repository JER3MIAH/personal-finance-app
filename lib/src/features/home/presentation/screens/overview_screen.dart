import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/features/home/logic/cubits/bottom_nav_bar_cubit.dart';
import 'package:personal_finance_app/src/features/home/presentation/components/components.dart';
import 'package:personal_finance_app/src/features/transactions/logic/blocs/blocs.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navBloc = context.read<BottomNavBarCubit>();
    final isMobile = DeviceType(context).isMobile;
    final isDesktop = DeviceType(context).isDesktop;

    return AppColumn(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overview',
              style: textPreset1,
            ),
          ],
        ),
        YBox(20),
        BlocBuilder<TransactionBloc, TransactionState>(
          builder: (_, transactionState) {
            final transactions = transactionState.transactions;
            final income = transactions.where((t) => !t.debit).fold(
                  0.0,
                  (prev, trans) => prev + trans.amount,
                );
            final expenses = transactions.where((t) => t.debit).fold(
                  0.0,
                  (prev, trans) => prev + trans.amount,
                );
            final children = [
              BalanceContainer(
                title: 'Current Balance',
                balance: (income - expenses),
              ),
              BalanceContainer(
                title: 'Income',
                balance: income,
              ),
              BalanceContainer(
                title: 'Expenses',
                balance: expenses,
              ),
            ];
            if (isMobile) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                spacing: spacing150,
                children: children,
              );
            }
            return Row(
              spacing: spacing150,
              children: children,
            );
          },
        ),
        YBox(spacing150),
        if (isDesktop)
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing150,
            children: [
              PotsOverviewContainer(
                onSeeDetails: () => navBloc.setIndex(3),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TransactionsOverviewContainer(
                      onSeeDetails: () => navBloc.setIndex(1),
                    ),
                  ),
                  XBox(spacing150),
                  Expanded(
                    child: BudgetsOverviewContainer(
                      onSeeDetails: () => navBloc.setIndex(2),
                    ),
                  ),
                ],
              ),
            ],
          )
        else
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing150,
            children: [
              PotsOverviewContainer(
                onSeeDetails: () => navBloc.setIndex(3),
              ),
              TransactionsOverviewContainer(
                onSeeDetails: () => navBloc.setIndex(1),
              ),
              BudgetsOverviewContainer(
                onSeeDetails: () => navBloc.setIndex(2),
              ),
            ],
          ),
      ],
    );
  }
}
