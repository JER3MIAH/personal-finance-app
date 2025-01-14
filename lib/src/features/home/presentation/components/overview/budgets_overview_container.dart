import 'package:flutter/widgets.dart';
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
          )
        ],
      ),
    );
  }
}
