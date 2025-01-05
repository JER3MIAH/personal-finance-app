import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/features/home/logic/cubits/bottom_nav_bar_cubit.dart';
import 'package:personal_finance_app/src/features/home/presentation/components/bottom_nav_bar/bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    List<Widget> pages = const [
      Placeholder(),
      Placeholder(),
      Placeholder(),
      Placeholder(),
    ];

    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (_, selectedIndex) {
        return Scaffold(
          backgroundColor: theme.inversePrimary,
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: theme.surface,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: IndexedStack(
              index: selectedIndex,
              children: pages,
            ),
          ),
          bottomNavigationBar: AppBottomNavBar(),
        );
      },
    );
  }
}
