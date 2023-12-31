import 'package:animate_do/animate_do.dart';
import 'package:app_web_tesis/pages/chart_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TempHumedad extends StatelessWidget {
  final double temperatura;
  final double humedad;
  const TempHumedad({
    super.key,
    required this.temperatura,
    required this.humedad,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Temperatura"),
        const SizedBox(height: 10),
        SlideInUp(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Image.asset("lib/assets/images/temperatura.png"),
              ),
              const SizedBox(width: 30),
              CircularPercentIndicator(
                startAngle: 270,
                radius: 50.0,
                lineWidth: 10.0,
                percent: temperatura / 100,
                center: Text(
                  '$temperatura °C',
                  style: const TextStyle(fontSize: 16),
                ),
                progressColor: Colors.orange,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        const Text("Humedad"),
        const SizedBox(height: 10),
        SlideInUp(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Image.asset("lib/assets/images/humedad.png",
                    fit: BoxFit.contain),
              ),
              const SizedBox(width: 30),
              CircularPercentIndicator(
                startAngle: 270,
                radius: 50.0,
                lineWidth: 10.0,
                percent: humedad / 100,
                center: Text(
                  '$humedad %',
                  style: const TextStyle(fontSize: 16),
                ),
                progressColor: Colors.blue,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Chart(),
              ),
            );
          },
          child: const Text("Observar Gráficas"),
        )
      ],
    );
  }
}
