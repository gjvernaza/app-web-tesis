import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class MostrarAlerta extends StatelessWidget {
  const MostrarAlerta({super.key});

  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      child: AlertDialog(
        actions: [
          TextButton.icon(
              onPressed: () {
                //Navigator.of(context).pop();
              },
              icon: const Icon(Icons.fire_truck_outlined),
              label: const Text('Cancelar')),
        ],
        title: const Text('Banda Detenida'),
        content: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset("lib/assets/images/advertencia.png"),
            ),
            const Text('Observe que la banda esté en buen estado'),
          ],
        ),
      ),
    );
  }
}
