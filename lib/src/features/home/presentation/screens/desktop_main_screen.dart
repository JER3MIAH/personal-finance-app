import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_finance_app/src/features/home/logic/cubits/bottom_nav_bar_cubit.dart';
import 'package:personal_finance_app/src/features/home/presentation/components/components.dart';
import 'pages.dart';

class DesktopMainScreen extends HookWidget {
  const DesktopMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavBarCubit, int>(
        builder: (_, selectedIndex) {
          return Row(
            children: [
              SideBar(),
              Expanded(
                child: IndexedStack(
                  index: selectedIndex,
                  children: PAGES,
                ),
              ),
            ],
          );
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      // floatingActionButton: HideSidebarContainer(),
    );
  }
}
