import 'package:flutter/widgets.dart';
import 'package:personal_finance_app/src/features/home/presentation/components/overview/see_details.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class TransactionsOverviewContainer extends StatelessWidget {
  final VoidCallback onSeeDetails;
  const TransactionsOverviewContainer({
    super.key,
    required this.onSeeDetails,
  });

  @override
  Widget build(BuildContext context) {
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
                'Transactions',
                style: textPreset2,
              ),
              buildSeeDetails(
                onTap: onSeeDetails,
                title: 'View All',
              ),
            ],
          )
        ],
      ),
    );
  }
}
