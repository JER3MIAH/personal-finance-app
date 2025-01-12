import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/features/transactions/data/models/models.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class AddTransactionDialog extends StatelessWidget {
  final Transaction? transaction;
  const AddTransactionDialog({
    super.key,
    this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    void closeModal() {
      AppNavigator(context).popDialog();
    }

    return Padding(
      padding: EdgeInsets.all(spacing300),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${transaction == null ? 'Add' : 'Edit'} Transaction',
                style: textPreset1,
              ),
              GestureDetector(
                onTap: closeModal,
                child: SvgAsset(iconCloseModal),
              ),
            ],
          ),
          Text(
            transaction == null
                ? 'Recorda your transaction'
                : 'Modify transaction',
            style: textPreset4.copyWith(color: appColors.grey500),
          ),
          //*

          //*
          AppButton(
            title: transaction == null ? 'Add Transaction' : 'Save Changes',
            color: appColors.black,
            onTap: () {},
            height: 53,
            expanded: true,
          ),
        ],
      ),
    );
  }
}
