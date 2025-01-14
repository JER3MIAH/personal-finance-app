import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_finance_app/src/features/transactions/logic/blocs/blocs.dart';
import 'package:personal_finance_app/src/features/transactions/presentation/components/components.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class TransactionScreen extends HookWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceType(context).isMobile;
    final searchController = useTextEditingController();
    final selectedFilter = useState<String>(FILTER_OPTIONS_ALL[0]);
    final selectedSort = useState<String>(SORT_OPTIONS[0]);

    void addTransaction() {
      AppDialog.dialog(context, AddTransactionDialog());
    }

    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (_, state) {
        final transactions = state.transactions;

        return AppColumn(
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
                              items: FILTER_OPTIONS_ALL,
                              icon: iconFilterMobile,
                            )
                          else
                            AppDropdown(
                              dropdownValue: selectedFilter,
                              items: FILTER_OPTIONS_ALL,
                            ),
                        ],
                      ),
                    ],
                  ),
                  YBox(20),
                  if (isMobile)
                    ...List.generate(
                      transactions.length,
                      (index) => TransactionTile(
                        transaction: transactions[index],
                      ),
                    )
                  else
                    Table(
                      children: [
                        transactionHeader(),
                        ...List.generate(
                          transactions.length,
                          (index) => transactionRow(
                            transaction: transactions[index],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            YBox(20),
          ],
        );
      },
    );
  }
}
