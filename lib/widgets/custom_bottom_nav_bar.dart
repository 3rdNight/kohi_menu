import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      backgroundColor: const Color(0xFF0AA545), // verde escuro
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedItemColor: Colors.yellow[600], // destaque do item selecionado
      unselectedItemColor: Colors.white, // itens não selecionados
      selectedLabelStyle: const TextStyle(color: Colors.yellow),
      unselectedLabelStyle: const TextStyle(color: Colors.white),
      items: [
        _buildNavItem(index: 0, icon: Icons.home, label: tr('home')),
        _buildNavItem(index: 1, icon: Icons.shopping_cart, label: tr('cart')),
        _buildNavItem(
            index: 2, icon: Icons.history, label: tr('order_history')),
        _buildNavItem(index: 3, icon: Icons.settings, label: tr('settings')),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final isSelected = index == widget.currentIndex;

    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.yellow[600] : Colors.green[700],
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
      label: label,
    );
  }
}
