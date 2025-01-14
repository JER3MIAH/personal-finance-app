import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/features/home/presentation/components/components.dart';
import 'package:personal_finance_app/src/features/transactions/logic/blocs/blocs.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceType(context).isMobile;

    return Scaffold(
      body: AppColumn(
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
        ],
      ),
    );
  }
}
