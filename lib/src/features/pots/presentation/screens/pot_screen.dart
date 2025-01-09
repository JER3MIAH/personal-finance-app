import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_bloc.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_state.dart';
import 'package:personal_finance_app/src/features/pots/presentation/components/components.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class PotScreen extends StatelessWidget {
  const PotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceType(context).isMobile;
    final isDesktop = DeviceType(context).isDesktop;
    // final potsBloc = context.read<PotsBloc>();

    void addPot() {
      AppDialog.dialog(context, AddPotDialog());
    }

    return Scaffold(
      body: BlocBuilder<PotsBloc, PotsState>(
        builder: (_, potState) {
          final pots = potState.pots;

          return AppColumn(
            shouldScroll: false,
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
              YBox(20),
              if (pots.isEmpty)
                EmptyStateContainer(title: 'You currently have no pots'),
              Expanded(
                child: ScrollConfiguration(
                  behavior: NoThumbScrollBehavior(),
                  child: isDesktop
                      ? GridView.builder(
                          itemCount: pots.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: spacing200,
                            mainAxisSpacing: spacing200,
                            childAspectRatio: 5.8 / 3,
                          ),
                          itemBuilder: (context, index) {
                            final pot = pots[index];
                            return PotContainer(
                              pot: pot,
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: pots.length,
                          itemBuilder: (context, index) {
                            final pot = pots[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.only(bottom: spacing200),
                              child: PotContainer(
                                pot: pot,
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
