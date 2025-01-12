import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/features/pots/data/models/pot.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_bloc.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_event.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class PotContainer extends StatelessWidget {
  final Pot pot;
  const PotContainer({
    super.key,
    required this.pot,
  });

  @override
  Widget build(BuildContext context) {
    final potBloc = context.read<PotsBloc>();
    final potTheme = getColorFromTheme(pot.theme);

    double percentage = (pot.total / pot.target) * 100;

    void onTapEdit() {}
    void onTapDelete() {
      AppDialog.dialog(
        context,
        DeleteDialog(
          title: pot.name,
          description:
              'Are you sure you want to delete this pot? This action cannot be reversed, and all the data inside it will be removed forever.',
          onDelete: () {
            potBloc.add(DeletePot(potName: pot.name));
          },
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(spacing300),
      decoration: BoxDecoration(
        color: appColors.white,
        borderRadius: BorderRadius.circular(spacing150),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: spacing300,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPotTitle(
                title: 'Savings',
                color: potTheme,
              ),
              EditAndDeletePopUpButton(
                title: 'Pot',
                onEdit: onTapEdit,
                onDelete: onTapDelete,
              ),
            ],
          ),
          //*-----
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing100,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Saved',
                    style: textPreset4.copyWith(
                      color: appColors.grey500,
                    ),
                  ),
                  Text(
                    '\$${pot.total}',
                    style: textPreset1,
                  ),
                ],
              ),
              LinearProgressIndicator(
                backgroundColor: appColors.beige100,
                color: potTheme,
                value: (percentage / 100).isNaN ? 0 : (percentage / 100),
                minHeight: 8,
                borderRadius: BorderRadius.circular(spacing50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$percentage%',
                    style: textPreset5Bold.copyWith(
                      color: appColors.grey500,
                    ),
                  ),
                  Text(
                    'Target of ${formatNumber(pot.target)}',
                    style: textPreset5.copyWith(
                      color: appColors.grey500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          //*-----
          Row(
            spacing: spacing200,
            children: [
              _buildButton(
                title: '+ Add Money',
                onTap: () {},
              ),
              _buildButton(
                title: 'Withdraw',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPotTitle({
    required String title,
    required Color color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: spacing100,
      children: [
        Container(
          width: spacing200,
          height: spacing200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        Text(
          title,
          style: textPreset2.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildButton({
    required String title,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: AppButton(
        title: title,
        onTap: onTap,
        color: appColors.beige100,
        textColor: appColors.grey900,
      ),
    );
  }
}
