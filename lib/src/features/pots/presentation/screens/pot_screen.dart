import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class PotScreen extends StatelessWidget {
  const PotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceType(context).isMobile;

    void addPot() {}

    return Scaffold(
      body: AppColumn(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AutoSizeText(
                  'Pots',
                  style: textPreset1,
                  maxLines: 1,
                ),
              ),
              if (isMobile)
                AddButton(
                  onTap: addPot,
                )
              else
                AppButton(
                  title: '+ Add New Pot',
                  color: appColors.grey900,
                  onTap: addPot,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
