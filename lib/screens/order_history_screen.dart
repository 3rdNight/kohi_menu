import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../data/order_history.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  double getTotal() {
    double total = 0;
    for (var item in orderHistory) {
      total += item.item.price * item.quantity;
    }
    return total;
  }

  Future<void> _checkout() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(tr('checkout')),
        content: Text(tr('confirm_checkout')),
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
      final totalPaid = getTotal(); // pega o total antes de limpar
      setState(() {
        orderHistory.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('${tr('checkout_done')}: ¥${totalPaid.toStringAsFixed(0)}'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('order_history')),
        centerTitle: true,
      ),
      body: orderHistory.isEmpty
          ? Center(child: Text(tr('no_orders_yet')))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: orderHistory.length,
                    itemBuilder: (context, index) {
                      final order =
                          orderHistory[orderHistory.length - 1 - index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: ListTile(
                          leading: SizedBox(
                            width: 50,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(order.item.imagePath,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          title: Text(tr(order.item.labelKey)),
                          subtitle:
                              Text('${tr('quantity')}: ${order.quantity}'),
                          trailing: Text(
                              '¥${(order.item.price * order.quantity).toStringAsFixed(0)}'),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${tr('total')}: ¥${getTotal().toStringAsFixed(0)}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: orderHistory.isEmpty ? null : _checkout,
                        child: Text(tr('checkout')), // お会計
                      ),
                    ],
                  ),
                ),
              ],
            ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2,
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
    );
  }
}
