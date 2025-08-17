import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../main.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;
    final isDarkMode = MyApp.of(context)?.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('settings')), // agora o título mostra "Settings"
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(tr('language')),
              trailing: DropdownButton<Locale>(
                value: currentLocale,
                items: const [
                  DropdownMenuItem(value: Locale('en'), child: Text('English')),
                  DropdownMenuItem(value: Locale('ja'), child: Text('日本語')),
                ],
                onChanged: (Locale? newLocale) {
                  if (newLocale != null) {
                    context.setLocale(newLocale);
                    setState(() {});
                  }
                },
              ),
            ),
            ListTile(
              title: Text(tr('theme')),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(tr('light')),
                  Radio<bool>(
                    value: false,
                    groupValue: isDarkMode,
                    onChanged: (val) {
                      if (val != null) MyApp.of(context)?.toggleTheme(false);
                      setState(() {});
                    },
                  ),
                  Text(tr('dark')),
                  Radio<bool>(
                    value: true,
                    groupValue: isDarkMode,
                    onChanged: (val) {
                      if (val != null) MyApp.of(context)?.toggleTheme(true);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
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
              Navigator.pushReplacementNamed(context, '/settings');
              break;
          }
        },
      ),
    );
  }
}
