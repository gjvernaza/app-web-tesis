import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class PiezasTamanio extends StatelessWidget {
  final String piezasP;
  final String piezasM;
  final String piezasG;
  const PiezasTamanio({
    super.key,
    required this.piezasP,
    required this.piezasM,
    required this.piezasG,
  });

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 400);
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Piezas por Tamaño"),
        const SizedBox(height: 10),
        FadeInUp(
          duration: duration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                width: 40,
                child: Image.asset(
                  "lib/assets/images/pieza_p.png",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 30),
              Text(
                piezasP,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        FadeInLeft(
          duration: duration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                width: 40,
                child: Image.asset(
                  "lib/assets/images/pieza_m.png",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 30),
              Text(
                piezasM,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        FadeInDown(
          duration: duration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 40,
                child: Image.asset(
                  "lib/assets/images/pieza_g.png",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 30),
              Text(
                piezasG,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
