import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/features/pots/data/models/pot.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_bloc.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_state.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

import 'see_details.dart';

class PotsOverviewContainer extends StatelessWidget {
  final VoidCallback onSeeDetails;
  const PotsOverviewContainer({
    super.key,
    required this.onSeeDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PotsBloc, PotsState>(
      builder: (context, state) {
        final pots = state.pots;

        return Container(
          padding: EdgeInsets.all(spacing300),
          decoration: BoxDecoration(
            color: appColors.white,
            borderRadius: BorderRadius.circular(spacing150),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pots',
                    style: textPreset2,
                  ),
                  buildSeeDetails(
                    onTap: onSeeDetails,
                  ),
                ],
              ),
              YBox(spacing300),
              Row(
                spacing: spacing200,
                children: [
                  Container(
                    width: 274,
                    height: 117,
                    padding: EdgeInsets.all(spacing300),
                    decoration: BoxDecoration(
                      color: appColors.beige100,
                      borderRadius: BorderRadius.circular(spacing150),
                    ),
                    child: Row(
                      spacing: spacing150,
                      children: [
                        SvgAsset(iconPot),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Saved',
                              style: textPreset4.copyWith(
                                  color: appColors.grey500),
                            ),
                            Text(
                              '\$${pots.fold(
                                0.0,
                                (prev, pot) => prev + pot.total,
                              )}',
                              style: textPreset1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    spacing: spacing150,
                    children: List.generate(
                      pots.length > 4 ? 4 : pots.length,
                      (index) => _buildPotItem(
                        pot: pots[index],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPotItem({
    required Pot pot,
  }) {
    return Row(
      spacing: spacing200,
      children: [
        Container(
          width: 4,
          height: 43,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: getColorFromTheme(pot.theme),
            borderRadius: BorderRadius.circular(spacing100),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pot.name,
              style: textPreset5.copyWith(color: appColors.grey500),
            ),
            Text(
              pot.total.toString(),
              style: textPreset4Bold,
            ),
          ],
        ),
      ],
    );
  }
}
