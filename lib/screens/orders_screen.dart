import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/app_drawer.dart';
import '../data/cart.dart';
import '../data/menu_data.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  void _removeItem(MenuItem item) {
    removeFromCart(item);
    setState(() {});
  }

  String formatPrice(double price) {
    // Sempre em iene com símbolo ¥ e sem casas decimais
    return '¥${price.toStringAsFixed(0)}';
  }

  Future<void> _confirmOrder() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(tr('confirm_order')),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(tr('no')),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(tr('yes')),
          ),
        ],
      ),
    );

    if (result == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(tr('thank_you_order')),
          duration: const Duration(seconds: 3),
        ),
      );
      cart.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(currentRoute: '/orders'),
      appBar: AppBar(
        centerTitle: true,
        title: Text(tr('orders')),
      ),
      body: cart.isEmpty
          ? Center(child: Text(tr('cart_empty')))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final c = cart[index];
                final priceText =
                    '${c.quantity} x ${formatPrice(c.item.price)}';
                return ListTile(
                  leading: Image.asset(c.item.imagePath, width: 50),
                  title: Text(tr(c.item.labelKey)),
                  subtitle: Text(priceText),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeItem(c.item),
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${tr('total')}: ${formatPrice(getCartTotal())}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: cart.isEmpty ? null : _confirmOrder,
              child: Text(tr('confirm_order')),
            ),
          ],
        ),
      ),
    );
  }
}
