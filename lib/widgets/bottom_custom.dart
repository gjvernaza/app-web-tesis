import 'package:app_web_tesis/services/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottonNavigatorBar extends StatelessWidget {
  const CustomBottonNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectMenuOpt;
    return BottomNavigationBar(
        onTap: (int index) => uiProvider.selectMenuOpt = index,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.color_lens_outlined), label: 'Colores'),
          BottomNavigationBarItem(
              icon: Icon(Icons.donut_small_outlined), label: 'P-M-G'),
          BottomNavigationBarItem(
              icon: Icon(Icons.carpenter_outlined), label: 'Metálicas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dew_point), label: 'Temperatura'),
        ]);
  }
}
