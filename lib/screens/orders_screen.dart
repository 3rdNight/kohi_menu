import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../data/cart.dart';
import '../data/menu_data.dart';
import '../data/order_history.dart';
import '../widgets/custom_bottom_nav_bar.dart';

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

  String formatPrice(double price) => '¥${price.toStringAsFixed(0)}';

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
      // Adiciona itens ao histórico acumulando quantidade
      for (var c in cart) {
        try {
          final existing =
              orderHistory.firstWhere((o) => o.item.id == c.item.id);
          existing.quantity += c.quantity;
        } catch (e) {
          orderHistory.add(OrderItem(item: c.item, quantity: c.quantity));
        }
      }

      // Limpa o carrinho
      cart.clear();
      setState(() {});

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(tr('thank_you_order')),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('cart')), centerTitle: true),
      body: cart.isEmpty
          ? Center(child: Text(tr('cart_empty')))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final c = cart[index];
                final priceText =
                    '${c.quantity} x ${formatPrice(c.item.price)}';
                return ListTile(
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(c.item.imagePath, fit: BoxFit.cover),
                    ),
                  ),
                  title: Text(tr(c.item.labelKey)),
                  subtitle: Text(priceText),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeItem(c.item),
                  ),
                );
              },
            ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${tr('total')}: ${formatPrice(getCartTotal())}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: cart.isEmpty ? null : _confirmOrder,
                  child: Text(tr('confirm_order')),
                ),
              ],
            ),
          ),
          CustomBottomNavBar(
            currentIndex: 1, // Cart
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.pushReplacementNamed(context, '/');
                  break;
                case 1:
                  Navigator.pushReplacementNamed(context, '/orders');
                  break;
                case 2:
                  Navigator.pushReplacementNamed(context, '/order_history');
                  break;
                case 3:
                  Navigator.pushReplacementNamed(context, '/settings');
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}
