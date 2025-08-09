import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/app_drawer.dart';
import '../main.dart';

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
      drawer: const AppDrawer(currentRoute: '/settings'),
      appBar: AppBar(
        centerTitle: true,
        title: Text(tr('app_title')),
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
                    setState(() {}); // Atualiza a UI
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
                      if (val != null) {
                        MyApp.of(context)?.toggleTheme(false);
                        setState(() {}); // Atualiza a UI
                      }
                    },
                  ),
                  Text(tr('dark')),
                  Radio<bool>(
                    value: true,
                    groupValue: isDarkMode,
                    onChanged: (val) {
                      if (val != null) {
                        MyApp.of(context)?.toggleTheme(true);
                        setState(() {}); // Atualiza a UI
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
