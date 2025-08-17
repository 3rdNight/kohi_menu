class MenuItem {
  final String id;
  final String labelKey;
  final String imagePath;
  final double price;
  final String descriptionKey; // chave de tradução para a descrição

  MenuItem({
    required this.id,
    required this.labelKey,
    required this.imagePath,
    required this.price,
    required this.descriptionKey,
  });
}

final coffeesMenu = [
  MenuItem(
    id: 'drip',
    labelKey: 'drip',
    imagePath: 'assets/images/drip.png',
    price: 350,
    descriptionKey: 'drip_description',
  ),
  MenuItem(
    id: 'ice',
    labelKey: 'ice',
    imagePath: 'assets/images/ice.png',
    price: 300,
    descriptionKey: 'ice_description',
  ),
  MenuItem(
    id: 'cafe_au_lait',
    labelKey: 'cafe_au_lait',
    imagePath: 'assets/images/cafe_au_lait.png',
    price: 400,
    descriptionKey: 'cafe_au_lait_description',
  ),
];

final foodsMenu = [
  MenuItem(
    id: 'egg_sandwich',
    labelKey: 'egg_sandwich',
    imagePath: 'assets/images/egg_sandwich.png',
    price: 500,
    descriptionKey: 'egg_sandwich_description',
  ),
  MenuItem(
    id: 'ham_cheese_croissant',
    labelKey: 'ham_cheese_croissant',
    imagePath: 'assets/images/ham_cheese_croissant.png',
    price: 600,
    descriptionKey: 'ham_cheese_croissant_description',
  ),
];
