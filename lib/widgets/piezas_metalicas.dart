import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class PiezasMetalicas extends StatelessWidget {
  final String counterMetalicas;
  final String counterNoMetalicas;
  const PiezasMetalicas({
    super.key,
    required this.counterMetalicas,
    required this.counterNoMetalicas,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //const SizedBox(height: 20),
        const Text("Piezas Metálicas"),
        const SizedBox(height: 30),
        ElasticIn(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Image.asset("lib/assets/images/inductivo.png"),
              ),
              const SizedBox(width: 30),
              Text(
                counterMetalicas,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        const Text("Piezas No Metálicas"),
        const SizedBox(height: 30),
        ElasticIn(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Image.asset("lib/assets/images/capacitivo.png",
                    fit: BoxFit.contain),
              ),
              const SizedBox(width: 30),
              Text(
                counterNoMetalicas,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
