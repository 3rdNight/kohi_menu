import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../data/menu_data.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'product_detail_screen.dart';

enum OptionType { drinks, meals }

class SubOptionsScreen extends StatefulWidget {
  final OptionType optionType;

  const SubOptionsScreen({super.key, required this.optionType});

  @override
  State<SubOptionsScreen> createState() => _SubOptionsScreenState();
}

class _SubOptionsScreenState extends State<SubOptionsScreen> {
  late String selectedSubcategory;

  @override
  void initState() {
    super.initState();
    selectedSubcategory =
        widget.optionType == OptionType.meals ? 'pasta' : 'juice';
  }

  @override
  Widget build(BuildContext context) {
    final isMeals = widget.optionType == OptionType.meals;

    final subcategories = isMeals
        ? [
            'pasta',
            'homemade_curry',
            'warm_rice_flour_noodles',
            'salad',
            'tempura',
            'drinks',
          ]
        : [
            'juice',
            'coffee',
            'tea',
            'alcohol',
            'meals',
          ];

    /// Aqui cada chave corresponde ao JSON de tradução
    final subcategoryLabels = {
      'pasta': tr('subcategory_pasta'),
      'homemade_curry': tr('subcategory_homemade_curry'),
      'warm_rice_flour_noodles': tr('subcategory_warm_rice_flour_noodles'),
      'salad': tr('subcategory_salad'),
      'tempura': tr('subcategory_tempura'),
      'drinks': tr('drinks'),
      'juice': tr('subcategory_juice'),
      'coffee': tr('subcategory_coffee'),
      'tea': tr('subcategory_tea'),
      'alcohol': tr('subcategory_alcohol'),
      'meals': tr('meals'),
    };

    List<MenuItem> filteredItems() {
      final allItems = isMeals ? foodsMenu : coffeesMenu;
      return allItems
          .where((item) => item.subcategory == selectedSubcategory)
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(isMeals ? tr('meals') : tr('drinks')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subcategories horizontal list
          SizedBox(
            height: 60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: subcategories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final key = subcategories[index];
                return GestureDetector(
                  onTap: () {
                    if (key == 'drinks') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SubOptionsScreen(
                            optionType: OptionType.drinks,
                          ),
                        ),
                      );
                    } else if (key == 'meals') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SubOptionsScreen(
                            optionType: OptionType.meals,
                          ),
                        ),
                      );
                    } else {
                      setState(() {
                        selectedSubcategory = key;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: selectedSubcategory == key
                          ? Colors.deepPurple
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        subcategoryLabels[key]!,
                        style: TextStyle(
                          color: selectedSubcategory == key
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          // Horizontal product list
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredItems().length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final item = filteredItems()[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(item: item),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item.imagePath,
                            height: 120,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          tr(item.labelKey),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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
