import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AppDrawer extends StatelessWidget {
  final String currentRoute;
  const AppDrawer({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    Widget buildTile(String route, String label) {
      return ListTile(
        title: Text(label),
        selected: currentRoute == route,
        onTap: () {
          if (currentRoute != route) {
            Navigator.pushReplacementNamed(context, route);
          } else {
            Navigator.pop(context);
          }
        },
      );
    }

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              child: Text(
                tr('menu'),
                style: const TextStyle(fontSize: 24),
              ),
            ),
            buildTile('/', tr('home')),
            buildTile('/orders', tr('orders')),
            buildTile('/settings', tr('settings')),
          ],
        ),
      ),
    );
  }
}
