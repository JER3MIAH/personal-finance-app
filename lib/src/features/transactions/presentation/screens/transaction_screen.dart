import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_finance_app/src/features/transactions/data/models/models.dart';
import 'package:personal_finance_app/src/features/transactions/presentation/components/components.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class TransactionScreen extends HookWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceType(context).isMobile;
    final searchController = useTextEditingController();
    final selectedFilter = useState<String>(FILTER_OPTIONS[0]);
    final selectedSort = useState<String>(SORT_OPTIONS[0]);

    void addTransaction() {
      AppDialog.dialog(context, AddTransactionDialog());
    }

    return Scaffold(
      body: AppColumn(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AutoSizeText(
                  'Transactions',
                  style: textPreset1,
                  maxLines: 1,
                ),
              ),
              if (isMobile)
                AddButton(
                  onTap: addTransaction,
                )
              else
                AppButton(
                  title: '+ Add New Transaction',
                  color: appColors.grey900,
                  onTap: addTransaction,
                ),
            ],
          ),
          YBox(20),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(spacing100),
              color: appColors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextField(
                      leadingIcon: iconSearch,
                      controller: searchController,
                      hintText: 'Search Transaction',
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isMobile)
                          AppPopUpButton(
                            selectedItem: selectedSort,
                            items: SORT_OPTIONS,
                            icon: iconSortMobile,
                          )
                        else
                          AppDropdown(
                            dropdownValue: selectedSort,
                            items: SORT_OPTIONS,
                          ),
                        XBox(30),
                        if (isMobile)
                          AppPopUpButton(
                            selectedItem: selectedFilter,
                            items: FILTER_OPTIONS,
                            icon: iconFilterMobile,
                          )
                        else
                          AppDropdown(
                            dropdownValue: selectedFilter,
                            items: FILTER_OPTIONS,
                          ),
                      ],
                    ),
                    //* Add filter
                  ],
                ),
                YBox(20),
                if (isMobile)
                  ...List.generate(
                    5,
                    (index) => TransactionTile(
                      transaction: Transaction(
                        id: 'id',
                        title: 'Bravo Zen Spa',
                        category: 'General',
                        date: DateTime.now(),
                        amount: 240,
                        debit: false,
                      ),
                    ),
                  )
                else
                  Table(
                    children: [
                      transactionHeader(),
                      ...List.generate(
                        5,
                        (index) => transactionRow(
                          transaction: Transaction(
                            id: 'id',
                            title: 'Bravo Zen Spa',
                            category: 'General',
                            date: DateTime.now(),
                            amount: 240,
                            debit: false,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          YBox(20),
        ],
      ),
    );
  }
}
