import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../data/cart.dart';
import '../data/menu_data.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  final MenuItem item;

  const ProductDetailScreen({super.key, required this.item});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;

  void increment() => setState(() => quantity++);
  void decrement() =>
      setState(() => quantity = quantity > 1 ? quantity - 1 : 1);

  String formatPrice(double price) => '¥${price.toStringAsFixed(0)}';

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Scaffold(
      appBar: AppBar(title: Text(tr(item.labelKey)), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(item.imagePath, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),
            Text(tr(item.labelKey),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(formatPrice(item.price),
                style: const TextStyle(fontSize: 18, color: Colors.grey)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: decrement,
                    icon: const Icon(Icons.remove_circle_outline)),
                Text(quantity.toString(), style: const TextStyle(fontSize: 20)),
                IconButton(
                    onPressed: increment,
                    icon: const Icon(Icons.add_circle_outline)),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.add_shopping_cart),
              label: Text(tr('add_to_cart')),
              onPressed: () {
                for (int i = 0; i < quantity; i++) addToCart(item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(tr('added_to_cart'))),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0, // Mantemos Home como referência
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/orders');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/settings');
              break;
          }
        },
      ),
    );
  }
}
