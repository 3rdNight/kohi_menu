import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/app_drawer.dart';
import 'sub_options_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(currentRoute: '/'),
      appBar: AppBar(
        centerTitle: true,
        title: Text(tr('app_title')),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _OptionButton(
              label: tr('coffees'),
              imagePath:
                  'assets/images/coffees.png', // substitua pela sua imagem
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const SubOptionsScreen(optionType: OptionType.coffees),
                  ),
                );
              },
            ),
            const SizedBox(width: 20),
            _OptionButton(
              label: tr('foods'),
              imagePath: 'assets/images/foods.png', // substitua pela sua imagem
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const SubOptionsScreen(optionType: OptionType.foods),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback onTap;

  const _OptionButton({
    required this.label,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [Shadow(blurRadius: 3, color: Colors.black)],
          ),
        ),
      ),
    );
  }
}
