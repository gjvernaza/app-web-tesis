import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDark = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cargarPreferencias();
  }

  _cargarPreferencias() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDark = prefs.getBool("isDark")?? false ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajustes"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwitchListTile(
              title: const Text("Modo oscuro"),
              activeColor: Colors.deepPurple.shade400,
              secondary: const Icon(Icons.settings),
              value: isDark,
              onChanged: (bool value) async {
              
                final prefs = await SharedPreferences.getInstance();

                setState(() {
                  isDark = value;
                  prefs.setBool("isDark", isDark);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
