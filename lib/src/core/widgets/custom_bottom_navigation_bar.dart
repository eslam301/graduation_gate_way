import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../route/routes_name.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  final int currentIndex = 0;

  void _onTap(int index) {
    // Execute the respective onTab callback
    _myItemsPath[index].onTab?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        iconSize: 24,
        onTap: _onTap,
        items: List.generate(
          _myItemsPath.length,
          (index) {
            return BottomNavigationBarItem(
              icon: Icon(
                _myItemsPath[index].iconData,
              ),
              label: _myItemsPath[index].label,
            );
          },
        ),
      ),
    );
  }
}

class MyBottomNavigationBarItem {
  final IconData iconData;
  final String label;
  final void Function()? onTab;

  const MyBottomNavigationBarItem({
    required this.iconData,
    required this.label,
    this.onTab,
  });
}

List<MyBottomNavigationBarItem> _myItemsPath = [
  const MyBottomNavigationBarItem(
      iconData: Icons.home, label: 'Home', onTab: null),
  MyBottomNavigationBarItem(
    iconData: Icons.chat,
    label: 'Chat',
    onTab: () {
      Routes.chat.toPage();
    },
  ),
  // MyBottomNavigationBarItem(
  //   iconData: Icons.notifications,
  //   label: 'Notifications',
  //   onTab: () {
  //     // Example functionality
  //   },
  // ),
  // const MyBottomNavigationBarItem(
  //     iconData: Icons.report, label: 'Report', onTab: null),
  MyBottomNavigationBarItem(
      iconData: Icons.person,
      label: 'Profile',
      onTab: () {
        Routes.profile.toPage();
      }),
];
