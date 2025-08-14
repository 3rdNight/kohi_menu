import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: tr('home'),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.shopping_cart),
          label: tr('orders'),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: tr('settings'),
        ),
      ],
    );
  }
}
