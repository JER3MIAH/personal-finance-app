import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_finance_app/src/features/transactions/data/models/models.dart';
import 'package:personal_finance_app/src/features/transactions/logic/blocs/blocs.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class AddTransactionDialog extends HookWidget {
  final Transaction? transaction;
  const AddTransactionDialog({
    super.key,
    this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    final transactionBloc = context.read<TransactionBloc>();
    final transactionCategory =
        useState<String>(transaction?.category ?? FILTER_OPTIONS[0]);
    final titleController = useTextEditingController(text: transaction?.title);
    final amountController =
        useTextEditingController(text: transaction?.amount.toString());

    void addTransaction() {
      final amount = double.tryParse(amountController.text.trim()) ?? 0;
      transactionBloc.add(
        AddNewTransaction(
          transaction: Transaction(
            id: getUniqueId(),
            category: transactionCategory.value,
            title: titleController.text.trim(),
            amount: double.tryParse(amountController.text.trim()) ?? 0,
            date: DateTime.now(),
            debit: amount < 0,
          ),
        ),
      );
    }

    void editTransaction() {
      final amount = double.tryParse(amountController.text.trim()) ?? 0;
      transactionBloc.add(
        EditTransaction(
          transactionId: transaction!.id,
          category: transactionCategory.value,
          title: titleController.text.trim(),
          amount: double.tryParse(amountController.text.trim()) ?? 0,
          date: DateTime.now(),
          debit: amount < 0,
        ),
      );
    }

    void closeModal() {
      AppNavigator(context).popDialog();
    }

    return Padding(
      padding: EdgeInsets.all(spacing300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                ? 'Record your transaction'
                : 'Modify transaction',
            style: textPreset4.copyWith(color: appColors.grey500),
          ),
          //*
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              TitledWidget(
                title: 'Transaction Title',
                widget: AppTextField(
                  controller: titleController,
                  hintText: 'e.g Electricity Bill',
                ),
              ),
              TitledWidget(
                title: 'Transaction Category',
                widget: AppDropdown(
                  dropdownValue: transactionCategory,
                  items: FILTER_OPTIONS,
                ),
              ),
              TitledWidget(
                title: 'Amount',
                widget: AppTextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  leadingIcon: '\$',
                  hintText: 'e.g -567',
                ),
              ),
            ],
          ),
          //*
          AppButton(
            title: transaction == null ? 'Add Transaction' : 'Save Changes',
            color: appColors.black,
            onTap: () {
              if (titleController.text.trim().isEmpty ||
                  amountController.text.trim().isEmpty ||
                  transactionCategory.value.isEmpty) {
                return;
              }
              AppNavigator(context).popDialog();
              if (transaction == null) {
                addTransaction();
              } else {
                editTransaction();
              }
            },
            height: 53,
            expanded: true,
          ),
        ],
      ),
    );
  }
}
