import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_finance_app/src/features/home/logic/cubits/bottom_nav_bar_cubit.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class AppBottomNavBar extends HookWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceType(context).isMobile;

    final labelIconMap = {
      'Overview': iconNavOverview,
      'Transactions': iconNavTransactions,
      'Budgets': iconNavBudgets,
      'Pots': iconNavPots,
    };

    void setIndex(int index) {
      context.read<BottomNavBarCubit>().setIndex(index);
    }

    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (_, selectedIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
              hoverColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: setIndex,
              enableFeedback: false,
              backgroundColor: appColors.grey900,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: appColors.green,
              unselectedItemColor: appColors.grey300,
              showSelectedLabels: !isMobile,
              showUnselectedLabels: !isMobile,
              unselectedLabelStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: appColors.beige100,
              ),
              selectedLabelStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: appColors.grey900,
              ),
              items: List.generate(
                labelIconMap.length,
                (index) {
                  final item = labelIconMap.entries.toList()[index];
                  return BottomNavigationBarItem(
                    icon: SvgAsset(
                      item.value,
                      color: appColors.grey300,
                    ),
                    label: item.key,
                    activeIcon: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      decoration: BoxDecoration(
                        color: isMobile && (selectedIndex == index)
                            ? appColors.beige100
                            : null,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: SvgAsset(
                        item.value,
                        color: appColors.green,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
