import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'box_color.dart';

class Colores extends StatelessWidget {
  final String counterR;
  final String counterG;
  final String counterB;
  const Colores({
    super.key,
    required this.counterR,
    required this.counterG,
    required this.counterB,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Piezas por color',
        ),
        const SizedBox(height: 20),
        //fila de colores
        FadeInUp(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BoxColor(color: Colors.red),
              const SizedBox(width: 25),
              Text(
                counterR,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        FadeInLeft(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BoxColor(color: Colors.green),
              const SizedBox(width: 25),
              Text(
                counterG,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        FadeInDown(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BoxColor(color: Colors.blue),
              const SizedBox(width: 25),
              Text(
                counterB,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
