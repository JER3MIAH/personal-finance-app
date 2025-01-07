import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_finance_app/src/features/home/logic/cubits/bottom_nav_bar_cubit.dart';
import 'package:personal_finance_app/src/features/home/presentation/components/side_bar/minimize_tile.dart';
import 'package:personal_finance_app/src/features/home/presentation/components/side_bar/side_bar_tile.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class SideBar extends HookWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final labelIconMap = {
      'Overview': iconNavOverview,
      'Transactions': iconNavTransactions,
      'Budgets': iconNavBudgets,
      'Pots': iconNavPots,
    };

    final expand = useState<bool>(false);
    final isMinimized = useState<bool>(false);

    void toggleMinimized() async {
      expand.value = !expand.value;
      if (!expand.value) {
        await Future.delayed(Duration(milliseconds: 500));
      }
      isMinimized.value = !isMinimized.value;
    }

    void setIndex(int index) {
      context.read<BottomNavBarCubit>().setIndex(index);
    }

    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (_, selectedIndex) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: expand.value ? 88 : 300,
          padding: const EdgeInsets.only(top: spacing300, bottom: spacing200),
          decoration: BoxDecoration(
            color: appColors.grey900,
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(spacing200),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: spacing400),
                child: SvgAsset(
                  expand.value ? iconSmallLogo : iconLargeLogo,
                ),
              ),
              YBox(30),
              ...List.generate(
                labelIconMap.length,
                (index) {
                  final item = labelIconMap.entries.toList()[index];
                  return SideBarTile(
                    title: item.key,
                    icon: item.value,
                    isSelected: selectedIndex == index,
                    isMinimized: isMinimized.value,
                    onTap: () => setIndex(index),
                  );
                },
              ),
              YBox(50),
              MinimizeTile(
                isMinimized: isMinimized.value,
                onTap: toggleMinimized,
              ),
            ],
          ),
        );
      },
    );
  }
}
