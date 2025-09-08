class MenuItem {
  final String id;
  final String labelKey;
  final String imagePath;
  final double price;
  final String descriptionKey;
  final String subcategory;

  MenuItem({
    required this.id,
    required this.labelKey,
    required this.imagePath,
    required this.price,
    required this.descriptionKey,
    required this.subcategory,
  });
}

final List<MenuItem> foodsMenu = [
  // 🍝 Pasta
  MenuItem(
    id: 'pasta_1',
    labelKey: 'pasta_seasonal_veggie_seafood_tomato',
    imagePath: 'assets/images/pasta1.jpg',
    price: 1375,
    descriptionKey: 'pasta_seasonal_veggie_seafood_tomato_desc',
    subcategory: 'pasta',
  ),
  MenuItem(
    id: 'pasta_2',
    labelKey: 'pasta_seasonal_veggie_dashi',
    imagePath: 'assets/images/pasta2.jpg',
    price: 1100,
    descriptionKey: 'pasta_seasonal_veggie_dashi_desc',
    subcategory: 'pasta',
  ),
  MenuItem(
    id: 'pasta_3',
    labelKey: 'pasta_pork_anchovy',
    imagePath: 'assets/images/pasta3.jpg',
    price: 1430,
    descriptionKey: 'pasta_pork_anchovy_desc',
    subcategory: 'pasta',
  ),
  MenuItem(
    id: 'pasta_4',
    labelKey: 'pasta_bolognese_cream',
    imagePath: 'assets/images/pasta4.jpg',
    price: 1375,
    descriptionKey: 'pasta_bolognese_cream_desc',
    subcategory: 'pasta',
  ),

  // 🍛 Curry
  MenuItem(
    id: 'curry_1',
    labelKey: 'curry_chicken_veggie',
    imagePath: 'assets/images/curry1.jpg',
    price: 1430,
    descriptionKey: 'curry_chicken_veggie_desc',
    subcategory: 'homemade_curry',
  ),
  MenuItem(
    id: 'curry_2',
    labelKey: 'curry_katsu',
    imagePath: 'assets/images/curry2.jpg',
    price: 1650,
    descriptionKey: 'curry_katsu_desc',
    subcategory: 'homemade_curry',
  ),
  MenuItem(
    id: 'curry_3',
    labelKey: 'curry_healthy',
    imagePath: 'assets/images/curry3.jpg',
    price: 1100,
    descriptionKey: 'curry_healthy_desc',
    subcategory: 'homemade_curry',
  ),

  // 🍜 Warm rice noodles
  MenuItem(
    id: 'warm_rice_1',
    labelKey: 'warm_rice_plain',
    imagePath: 'assets/images/warmrice1.jpg',
    price: 990,
    descriptionKey: 'warm_rice_plain_desc',
    subcategory: 'warm_rice_flour_noodles',
  ),
  MenuItem(
    id: 'warm_rice_2',
    labelKey: 'warm_rice_veggie',
    imagePath: 'assets/images/warmrice2.jpg',
    price: 1210,
    descriptionKey: 'warm_rice_veggie_desc',
    subcategory: 'warm_rice_flour_noodles',
  ),
  MenuItem(
    id: 'warm_rice_3',
    labelKey: 'warm_rice_tempura',
    imagePath: 'assets/images/warmrice3.jpg',
    price: 1430,
    descriptionKey: 'warm_rice_tempura_desc',
    subcategory: 'warm_rice_flour_noodles',
  ),

  // 🥗 Salad
  MenuItem(
    id: 'salad_1',
    labelKey: 'salad_farm_local',
    imagePath: 'assets/images/salad1.jpg',
    price: 770,
    descriptionKey: 'salad_farm_local_desc',
    subcategory: 'salad',
  ),
  MenuItem(
    id: 'salad_2',
    labelKey: 'salad_chicken',
    imagePath: 'assets/images/salad2.jpg',
    price: 1100,
    descriptionKey: 'salad_chicken_desc',
    subcategory: 'salad',
  ),

  // 🍟 Tempura / Deep-fry
  MenuItem(
    id: 'tempura_1',
    labelKey: 'tempura_seasonal',
    imagePath: 'assets/images/tempura1.jpg',
    price: 1210,
    descriptionKey: 'tempura_seasonal_desc',
    subcategory: 'tempura',
  ),
  MenuItem(
    id: 'tempura_2',
    labelKey: 'tempura_fries',
    imagePath: 'assets/images/fries.jpg',
    price: 330,
    descriptionKey: 'tempura_fries_desc',
    subcategory: 'tempura',
  ),
];

final List<MenuItem> coffeesMenu = [
  // 🥤 Juice
  MenuItem(
    id: 'juice_1',
    labelKey: 'juice_farm_veggie_latte',
    imagePath: 'assets/images/juice1.jpg',
    price: 600,
    descriptionKey: 'juice_farm_veggie_latte_desc',
    subcategory: 'juice',
  ),

  // ☕ Coffee
  MenuItem(
    id: 'coffee_1',
    labelKey: 'coffee_organic',
    imagePath: 'assets/images/coffee1.jpg',
    price: 380,
    descriptionKey: 'coffee_organic_desc',
    subcategory: 'coffee',
  ),
  MenuItem(
    id: 'coffee_2',
    labelKey: 'coffee_matcha_steamed_latte',
    imagePath: 'assets/images/coffee2.jpg',
    price: 480,
    descriptionKey: 'coffee_matcha_steamed_latte_desc',
    subcategory: 'coffee',
  ),
  MenuItem(
    id: 'coffee_3',
    labelKey: 'coffee_hojicha_steamed_latte',
    imagePath: 'assets/images/coffee3.jpg',
    price: 480,
    descriptionKey: 'coffee_hojicha_steamed_latte_desc',
    subcategory: 'coffee',
  ),
  MenuItem(
    id: 'coffee_4',
    labelKey: 'coffee_espresso_steamed_latte',
    imagePath: 'assets/images/coffee4.jpg',
    price: 510,
    descriptionKey: 'coffee_espresso_steamed_latte_desc',
    subcategory: 'coffee',
  ),
  MenuItem(
    id: 'coffee_5',
    labelKey: 'coffee_royal_tea_steamed_latte',
    imagePath: 'assets/images/coffee5.jpg',
    price: 510,
    descriptionKey: 'coffee_royal_tea_steamed_latte_desc',
    subcategory: 'coffee',
  ),
  MenuItem(
    id: 'coffee_6',
    labelKey: 'coffee_cocoa_steamed_latte',
    imagePath: 'assets/images/coffee6.jpg',
    price: 649,
    descriptionKey: 'coffee_cocoa_steamed_latte_desc',
    subcategory: 'coffee',
  ),

  // 🍵 Tea
  MenuItem(
    id: 'tea_1',
    labelKey: 'tea_strong_matcha_straight',
    imagePath: 'assets/images/tea1.jpg',
    price: 440,
    descriptionKey: 'tea_strong_matcha_straight_desc',
    subcategory: 'tea',
  ),
  MenuItem(
    id: 'tea_2',
    labelKey: 'tea_farm_yogurt_drink',
    imagePath: 'assets/images/tea2.jpg',
    price: 440,
    descriptionKey: 'tea_farm_yogurt_drink_desc',
    subcategory: 'tea',
  ),
  MenuItem(
    id: 'tea_3',
    labelKey: 'tea_white_tree_medical_herb',
    imagePath: 'assets/images/tea3.jpg',
    price: 480,
    descriptionKey: 'tea_white_tree_medical_herb_desc',
    subcategory: 'tea',
  ),
  MenuItem(
    id: 'tea_4',
    labelKey: 'tea_beauty_blend',
    imagePath: 'assets/images/tea4.jpg',
    price: 880,
    descriptionKey: 'tea_beauty_blend_desc',
    subcategory: 'tea',
  ),

  // 🍶 Alcohol
  MenuItem(
    id: 'alcohol_1',
    labelKey: 'alcohol_sapporo_small',
    imagePath: 'assets/images/alcohol1.jpg',
    price: 550,
    descriptionKey: 'alcohol_sapporo_small_desc',
    subcategory: 'alcohol',
  ),
  MenuItem(
    id: 'alcohol_2',
    labelKey: 'alcohol_sparkling_wine',
    imagePath: 'assets/images/alcohol2.jpg',
    price: 660,
    descriptionKey: 'alcohol_sparkling_wine_desc',
    subcategory: 'alcohol',
  ),
  MenuItem(
    id: 'alcohol_3',
    labelKey: 'alcohol_white_wine',
    imagePath: 'assets/images/alcohol3.jpg',
    price: 605,
    descriptionKey: 'alcohol_white_wine_desc',
    subcategory: 'alcohol',
  ),
  MenuItem(
    id: 'alcohol_4',
    labelKey: 'alcohol_red_wine',
    imagePath: 'assets/images/alcohol4.jpg',
    price: 605,
    descriptionKey: 'alcohol_red_wine_desc',
    subcategory: 'alcohol',
  ),
  MenuItem(
    id: 'alcohol_5',
    labelKey: 'alcohol_local_sake',
    imagePath: 'assets/images/alcohol5.jpg',
    price: 770,
    descriptionKey: 'alcohol_local_sake_desc',
    subcategory: 'alcohol',
  ),
];
