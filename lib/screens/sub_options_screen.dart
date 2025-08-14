import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../data/menu_data.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'product_detail_screen.dart';

enum OptionType { coffees, foods }

class SubOptionsScreen extends StatelessWidget {
  final OptionType optionType;

  const SubOptionsScreen({super.key, required this.optionType});

  @override
  Widget build(BuildContext context) {
    final options = optionType == OptionType.coffees ? coffeesMenu : foodsMenu;
    final title =
        optionType == OptionType.coffees ? tr('coffees') : tr('foods');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: options.map((opt) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailScreen(item: opt),
                  ),
                );
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(opt.imagePath, fit: BoxFit.cover),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tr(opt.labelKey),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 2, color: Colors.black)],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
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
