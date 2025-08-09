import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(currentRoute: '/orders'),
      appBar: AppBar(
        centerTitle: true,
        title: Text(tr('app_title')),
      ),
      body: Center(child: Text(tr('orders'))),
    );
  }
}
