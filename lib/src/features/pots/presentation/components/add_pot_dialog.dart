import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_finance_app/src/features/pots/data/models/pot.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_bloc.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_event.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class AddPotDialog extends HookWidget {
  final Pot? pot;
  const AddPotDialog({
    super.key,
    this.pot,
  });

  @override
  Widget build(BuildContext context) {
    final potBloc = context.read<PotsBloc>();
    final potNameController = useTextEditingController(text: pot?.name);
    final targetController =
        useTextEditingController(text: pot?.target.toString());
    final potTheme =
        useState<String>(pot?.theme ?? THEME_OPTIONS.keys.toList()[0]);

    void addPot() {
      potBloc.add(
        AddNewPot(
          pot: Pot(
            name: potNameController.text.trim(),
            theme: potTheme.value,
            total: 0,
            target: double.tryParse(targetController.text.trim()) ?? 0,
          ),
        ),
      );
    }

    void editPot() {
      potBloc.add(
        EditPot(
          potName: pot!.name,
          editedPot: Pot(
            name: potNameController.text.trim(),
            theme: potTheme.value,
            total: 0,
            target: double.tryParse(targetController.text.trim()) ?? 0,
          ),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              TitledWidget(
                title: 'Pot Name',
                widget: AppTextField(
                  controller: potNameController,
                  hintText: 'e.g. Rainy Days',
                ),
              ),
              TitledWidget(
                title: 'Target',
                widget: AppTextField(
                  controller: targetController,
                  keyboardType: TextInputType.number,
                  leadingIcon: '\$',
                  hintText: 'e.g. 2000',
                ),
              ),
              TitledWidget(
                title: 'Theme',
                widget: ThemeDropdown(
                  dropdownValue: potTheme,
                  items: THEME_OPTIONS.keys.toList(),
                  disbledItems: potBloc.state.pots.map((b) => b.theme).toList(),
                ),
              ),
            ],
          ),
          //*
          AppButton(
            title: pot == null ? 'Add Pot' : 'Save Changes',
            color: appColors.black,
            onTap: () {
              AppNavigator(context).popDialog();
              if (pot == null) {
                addPot();
              } else {
                editPot();
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
