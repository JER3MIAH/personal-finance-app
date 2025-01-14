import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_finance_app/src/features/pots/data/models/pot.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_bloc.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_event.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class WithdrawFromPotDialog extends HookWidget {
  final Pot pot;
  const WithdrawFromPotDialog({
    super.key,
    required this.pot,
  });

  @override
  Widget build(BuildContext context) {
    final potBloc = context.read<PotsBloc>();

    final amountController = useTextEditingController();

    void withDrawFromPot() {
      potBloc.add(
        WithdrawFromPot(
          amount: double.tryParse(amountController.text.trim()) ?? 0,
          potName: pot.name,
        ),
      );
    }

    void closeModal() {
      AppNavigator(context).popDialog();
    }

    return Padding(
      padding: EdgeInsets.all(spacing300),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Withdraw from ${pot.name}',
                style: textPreset1,
              ),
              GestureDetector(
                onTap: closeModal,
                child: SvgAsset(iconCloseModal),
              ),
            ],
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus  hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet.',
            style: textPreset4.copyWith(color: appColors.grey500),
          ),
          //*
          TitledWidget(
            title: 'Amount to Withdraw',
            widget: AppTextField(
              controller: amountController,
              hintText: 'e.g. 50',
              keyboardType: TextInputType.number,
              leadingIcon: '\$',
            ),
          ),
          //*
          AppButton(
            title: 'Confirm Withdrawal',
            color: appColors.black,
            onTap: () {
              if (amountController.text.trim().isEmpty) {
                return;
              }
              AppNavigator(context).popDialog();
              withDrawFromPot();
            },
            height: 53,
            expanded: true,
          ),
        ],
      ),
    );
  }
}
