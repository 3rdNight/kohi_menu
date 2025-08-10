class MenuItem {
  final String id;
  final String labelKey;
  final String imagePath;
  final double price;

  MenuItem({
    required this.id,
    required this.labelKey,
    required this.imagePath,
    required this.price,
  });
}

final coffeesMenu = [
  MenuItem(
      id: 'drip',
      labelKey: 'drip',
      imagePath: 'assets/images/drip.png',
      price: 350),
  MenuItem(
      id: 'ice',
      labelKey: 'ice',
      imagePath: 'assets/images/ice.png',
      price: 300),
  MenuItem(
      id: 'cafe_au_lait',
      labelKey: 'cafe_au_lait',
      imagePath: 'assets/images/cafe_au_lait.png',
      price: 400),
];

final foodsMenu = [
  MenuItem(
      id: 'egg_sandwich',
      labelKey: 'egg_sandwich',
      imagePath: 'assets/images/egg_sandwich.png',
      price: 500),
  MenuItem(
      id: 'ham_cheese_croissant',
      labelKey: 'ham_cheese_croissant',
      imagePath: 'assets/images/ham_cheese_croissant.png',
      price: 600),
];
