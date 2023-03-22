
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todox/src/core/config/app_router.dart';
import 'package:todox/src/core/mob_x/bottom_nav_bar_store.dart';
import 'package:todox/src/core/store/color_palette.dart';

import '../../../../main.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void onTab(int value) {
    switch (value) {
      case 0:
        router.pushAndPopUntil(HomeRoute(), predicate: (_) => false);
        break;
      case 1:
        router.pushAndPopUntil(DetailsRoute(), predicate: (_) => false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom_nav_bar_store = Provider.of<BottomNavBarStore>(context);
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      onTap: (value) => onTab(value),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 38,
            color: ColorPalette.WidgetBG,
          ),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.read_more,
            size: 40,
            color: ColorPalette.WidgetBG,
          ),
          label: 'details',
          backgroundColor: Colors.amber,
        ),
      ],
      currentIndex: bottom_nav_bar_store.currentIndex,
      unselectedItemColor: Colors.white,
    );
  }
}
