import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/app_drawer.dart';
import '../data/menu_data.dart';
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
      drawer: const AppDrawer(currentRoute: ''),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
