import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/features/home/presentation/components/overview/see_details.dart';
import 'package:personal_finance_app/src/features/transactions/logic/blocs/blocs.dart';
import 'package:personal_finance_app/src/features/transactions/presentation/components/components.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class TransactionsOverviewContainer extends StatelessWidget {
  final VoidCallback onSeeDetails;
  const TransactionsOverviewContainer({
    super.key,
    required this.onSeeDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (_, state) {
        final transactions = state.transactions;

        return Container(
          padding: EdgeInsets.all(spacing300),
          decoration: BoxDecoration(
            color: appColors.white,
            borderRadius: BorderRadius.circular(spacing150),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing150,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transactions',
                    style: textPreset2,
                  ),
                  buildSeeDetails(
                    onTap: onSeeDetails,
                    title: 'View All',
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  transactions.length > 6 ? 6 : transactions.length,
                  (index) => TransactionTile(
                    transaction: transactions[index],
                    hasBorder: index != (transactions.length - 1),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
