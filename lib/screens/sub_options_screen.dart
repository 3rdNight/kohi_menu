import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../data/menu_data.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'product_detail_screen.dart';

enum OptionType { coffees, foods }

class SubOptionsScreen extends StatelessWidget {
  final OptionType optionType;
  final String searchQuery;

  const SubOptionsScreen({
    super.key,
    required this.optionType,
    this.searchQuery = '',
  });

  @override
  Widget build(BuildContext context) {
    final options = optionType == OptionType.coffees ? coffeesMenu : foodsMenu;
    final title =
        optionType == OptionType.coffees ? tr('coffees') : tr('foods');

    // Filtrar conforme searchQuery
    final filteredOptions = searchQuery.isEmpty
        ? options
        : options
            .where((opt) => tr(opt.labelKey)
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
            .toList();

    // Separar por categoria
    Map<String, List<MenuItem>> categorized = {};
    if (optionType == OptionType.coffees) {
      categorized = {
        'quentes': filteredOptions
            .where((o) => o.id == 'drip' || o.id == 'cafe_au_lait')
            .toList(),
        'gelados': filteredOptions.where((o) => o.id == 'ice').toList(),
      };
    } else {
      categorized = {
        'paes': filteredOptions.where((o) => o.id == 'egg_sandwich').toList(),
        'salgados': filteredOptions
            .where((o) => o.id == 'ham_cheese_croissant')
            .toList(),
      };
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: categorized.entries.map((entry) {
            final category = entry.key;
            final items = entry.value;

            if (items.isEmpty) return const SizedBox.shrink();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr(category),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: items.map((opt) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(item: opt),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 120, // 🔥 altura fixa para padronizar
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                opt.imagePath,
                                fit: BoxFit.cover, // corta e preenche
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            tr(opt.labelKey),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
              ],
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
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
