import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_finance_app/src/features/home/logic/cubits/bottom_nav_bar_cubit.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class AppBottomTabBar extends HookWidget {
  const AppBottomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceType(context).isMobile;

    final labelIconMap = {
      'Overview': iconNavOverview,
      'Transactions': iconNavTransactions,
      'Budgets': iconNavBudgets,
      'Pots': iconNavPots,
    };

    final tabController = useTabController(initialLength: labelIconMap.length);
    final selectedIndex =
        context.select((BottomNavBarCubit cubit) => cubit.state);

    useEffect(() {
      tabController.index = selectedIndex;
      return null;
    }, [selectedIndex]);

    void setIndex(int index) {
      context.read<BottomNavBarCubit>().setIndex(index);
    }

    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          hoverColor: Colors.transparent,
        ),
        child: Container(
          color: appColors.grey900,
          child: TabBar(
            controller: tabController,
            onTap: setIndex,
            indicatorPadding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 10
                  : switch (selectedIndex) {
                      0 => -12,
                      1 => -10,
                      2 => -20,
                      3 => -25,
                      _ => -10,
                    },
            ).copyWith(top: isMobile ? 5 : 10),
            indicatorSize:
                isMobile ? TabBarIndicatorSize.tab : TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              color: appColors.beige100,
              border: Border(
                bottom: BorderSide(
                  width: 4,
                  color: appColors.green,
                ),
              ),
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(spacing100)),
            ),
            labelColor: appColors.grey900,
            labelPadding: EdgeInsets.symmetric(horizontal: 10),
            unselectedLabelColor: appColors.grey300,
            labelStyle: textPreset5Bold.copyWith(color: appColors.grey900),
            unselectedLabelStyle: textPreset5Bold,
            tabs: List.generate(
              labelIconMap.length,
              (index) {
                final item = labelIconMap.entries.toList()[index];
                return Tab(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: SvgAsset(
                      item.value,
                      color: selectedIndex == index
                          ? appColors.green
                          : appColors.grey300,
                    ),
                  ),
                  text: !isMobile ? item.key : null,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
