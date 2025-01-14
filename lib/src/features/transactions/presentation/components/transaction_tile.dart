import 'package:flutter/widgets.dart';
import 'package:personal_finance_app/src/features/transactions/data/models/models.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  final bool hasBorder;
  final Color? borderColor;
  const TransactionTile({
    super.key,
    required this.transaction,
    this.hasBorder = true,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: hasBorder
            ? Border(
                bottom: BorderSide(
                  color: borderColor ?? appColors.grey100,
                ),
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: textPreset4Bold,
                ),
                Text(
                  transaction.category,
                  style: textPreset5.copyWith(
                    color: appColors.beige500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${transaction.debit ? '-' : '+'}\$${transaction.amount.toString().replaceAll('-', '')}',
                  style: textPreset4Bold.copyWith(
                    color: !transaction.debit ? appColors.green : null,
                  ),
                ),
                Text(
                  formatDate(transaction.date),
                  style: textPreset5.copyWith(
                    color: appColors.beige500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TableRow transactionHeader() {
  return TableRow(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: appColors.grey100,
        ),
      ),
    ),
    children: [
      _tableCell(
        'Title',
        style: textPreset5.copyWith(
          color: appColors.beige500,
        ),
      ),
      XBox(5),
      _tableCell(
        'Category',
        style: textPreset5.copyWith(
          color: appColors.beige500,
        ),
      ),
      _tableCell(
        'Transaction Date',
        style: textPreset5.copyWith(
          color: appColors.beige500,
        ),
      ),
      _tableCell(
        'Amount',
        style: textPreset5.copyWith(
          color: appColors.beige500,
        ),
      ),
    ],
  );
}

TableRow transactionRow({
  required Transaction transaction,
}) {
  return TableRow(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: appColors.grey100,
        ),
      ),
    ),
    children: [
      _tableCell(
        transaction.title,
        style: textPreset4Bold,
      ),
      XBox(5),
      _tableCell(
        transaction.category,
        style: textPreset5.copyWith(
          color: appColors.beige500,
        ),
      ),
      _tableCell(
        formatDate(transaction.date),
        style: textPreset5.copyWith(
          color: appColors.beige500,
        ),
      ),
      _tableCell(
        '${transaction.debit ? '-' : '+'}\$${transaction.amount.toString().replaceAll('-', '')}',
        style: textPreset4Bold.copyWith(
          color: !transaction.debit ? appColors.green : null,
        ),
      ),
    ],
  );
}

Widget _tableCell(
  String title, {
  required TextStyle style,
}) {
  return TableCell(
    verticalAlignment: TableCellVerticalAlignment.middle,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: style,
      ),
    ),
  );
}

/*
import 'package:flutter/widgets.dart';
import 'package:personal_finance_app/src/features/transactions/data/models/models.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class TransactionHeader extends StatelessWidget {
  const TransactionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceType(context).isMobile;

    if (isMobile) {
      return SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appColors.grey100,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Title',
            style: textPreset5.copyWith(
              color: appColors.beige500,
            ),
          ),
          Text(
            'Category',
            style: textPreset5.copyWith(
              color: appColors.beige500,
            ),
          ),
          Text(
            'Transaction Date',
            style: textPreset5.copyWith(
              color: appColors.beige500,
            ),
          ),
          Text(
            'Amount',
            style: textPreset5.copyWith(
              color: appColors.beige500,
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  const TransactionTile({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceType(context).isMobile;
    if (isMobile) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: appColors.grey100,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.title,
                    style: textPreset4Bold,
                  ),
                  Text(
                    transaction.category,
                    style: textPreset5.copyWith(
                      color: appColors.beige500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${transaction.debit ? '-' : '+'}\$${transaction.amount}',
                    style: textPreset4Bold.copyWith(
                      color: !transaction.debit ? appColors.green : null,
                    ),
                  ),
                  Text(
                    formatDate(transaction.date),
                    style: textPreset5.copyWith(
                      color: appColors.beige500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appColors.grey100,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            transaction.title,
            style: textPreset4Bold,
          ),
          Text(
            transaction.category,
            style: textPreset5.copyWith(
              color: appColors.beige500,
            ),
          ),
          Text(
            formatDate(transaction.date),
            style: textPreset5.copyWith(
              color: appColors.beige500,
            ),
          ),
          Text(
            '${transaction.debit ? '-' : '+'}\$${transaction.amount}',
            style: textPreset4Bold.copyWith(
              color: !transaction.debit ? appColors.green : null,
            ),
          ),
        ],
      ),
    );
  }
}

*/
