import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class BalanceContainer extends StatelessWidget {
  final String title;
  final double balance;
  const BalanceContainer({
    super.key,
    required this.title,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    final startsWithC = title.toLowerCase().startsWith('c');
    final isMobile = DeviceType(context).isMobile;
    final body = Container(
      width: isMobile ? double.infinity : null,
      padding: EdgeInsets.all(spacing300),
      decoration: BoxDecoration(
        color: startsWithC ? appColors.grey900 : appColors.white,
        borderRadius: BorderRadius.circular(spacing150),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textPreset4.copyWith(
              color: startsWithC ? appColors.white : null,
            ),
          ),
          Text(
            '\$${formatNumber(balance)}',
            style: textPreset1.copyWith(
              color: startsWithC ? appColors.white : null,
            ),
          ),
        ],
      ),
    );
    if (DeviceType(context).isMobile) {
      return body;
    }
    return Expanded(
      child: body,
    );
  }
}
