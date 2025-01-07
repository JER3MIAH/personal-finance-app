import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/features/home/logic/cubits/bottom_nav_bar_cubit.dart';
import 'package:personal_finance_app/src/features/home/presentation/components/bottom_nav_bar/bottom_nav_bar.dart';
import 'pages.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (_, selectedIndex) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            body: IndexedStack(
              index: selectedIndex,
              children: PAGES,
            ),
            bottomNavigationBar: AppBottomTabBar(),
          ),
        );
      },
    );
  }
}
