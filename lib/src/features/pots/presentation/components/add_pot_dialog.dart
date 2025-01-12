import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/features/pots/data/models/pot.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class AddPotDialog extends StatelessWidget {
  final Pot? pot;
  const AddPotDialog({
    super.key,
    this.pot,
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
                '${pot == null ? 'Add' : 'Edit'} Pot',
                style: textPreset1,
              ),
              GestureDetector(
                onTap: closeModal,
                child: SvgAsset(iconCloseModal),
              ),
            ],
          ),
          Text(
            pot == null
                ? 'Create a pot to set savings targets. These can help keep you on track as you save for special purchases.'
                : 'If your saving targets change, feel free to update your pots.',
            style: textPreset4.copyWith(color: appColors.grey500),
          ),
          //*

          //*
          AppButton(
            title: pot == null ? 'Add Pot' : 'Save Changes',
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
