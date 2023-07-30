import 'dart:io';

import 'package:app_web_tesis/pages/qr_sensores.dart';
import 'package:flutter/material.dart';

import '../pages/pdf_page.dart';
import '../services/pdf_api.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  void openPDF(File file) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PDFViewerPage(file: file),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        children: [
          ListTile(
            title: const Text("Qr Sensores"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const QrSensores(),
                ),
              );
            },
          ),
          const Divider(),
          if (Platform.isAndroid)
            ListTile(
              title: const Text("Manuales"),
              onTap: () async {
                if (Platform.isAndroid) {
                  const path = 'lib/assets/manuales/manual1.pdf';
                  final file = await PDFApi.loadAssets(path);
                  openPDF(file);
                }
              },
            )
        ],
      ),
    );
  }
}
