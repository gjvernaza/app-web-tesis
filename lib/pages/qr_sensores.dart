import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:app_web_tesis/pages/pdf_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../services/pdf_api.dart';

class QrSensores extends StatefulWidget {
  const QrSensores({super.key});

  @override
  State<QrSensores> createState() => _QrSensoresState();
}

class _QrSensoresState extends State<QrSensores> {
  void openPDF(File file) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PDFViewerPage(file: file),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Información de sensores"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElasticIn(
                child: AlertDialog(
                  title: const Text('Código Qr'),
                  content: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset("lib/assets/images/qr_fondo.gif"),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                          'Escanee un Qr para ver la \ninformación de los sensores'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.qr_code_scanner_outlined),
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            "#3D8BEF",
            "Cancelar",
            false,
            ScanMode.QR,
          );
          switch (barcodeScanRes) {
            case "sensor_color":
              const path = 'lib/assets/manuales/MÓDULO SENSOR DE COLORES.pdf';
              final file = await PDFApi.loadAssets(path);
              openPDF(file);
              break;
            case "sensor_materiales":
              const path = 'lib/assets/manuales/MÓDULO SENSOR DE material.pdf';
              final file = await PDFApi.loadAssets(path);
              openPDF(file);
              break;
            case "sensor_tamanio":
              const path = 'lib/assets/manuales/MÓDULO SENSOR DE TAMAÑO.pdf';
              final file = await PDFApi.loadAssets(path);
              openPDF(file);
              break;
            case "sensor_temp_hum":
              const path =
                  'lib/assets/manuales/MÓDULO SENSOR DE TEMPERATURA Y HUMEDAD.pdf';
              final file = await PDFApi.loadAssets(path);
              openPDF(file);
              break;
          }
        },
      ),
    );
  }
}
