import 'package:animate_do/animate_do.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ButtonReset extends StatefulWidget {
  const ButtonReset({super.key});

  @override
  State<ButtonReset> createState() => _ButtonResetState();
}

class _ButtonResetState extends State<ButtonReset> {
  final _ref = FirebaseDatabase.instance.ref('user1');

  _resetContadores() async {
    await _ref.update({
      "contadorR": 0,
      "contadorG": 0,
      "contadorB": 0,
      "counterMetalicas": 0,
      "counterNoMetalicas": 0,
      "piezas_p": 0,
      "piezas_m": 0,
      "piezas_g": 0,
      "statusReset": true,
    });
  }

  _activarBanda(int value) async {
    await _ref.update({
      "banda": value,
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color color = Color.fromARGB(255, 172, 153, 224);
    return BounceInDown(
      duration: const Duration(milliseconds: 1600),
      from: 200,
      child: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: const Color.fromARGB(255, 147, 120, 223),
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.restore),
            backgroundColor: color,
            label: "Reset",
            onTap: () => _resetContadores(),
          ),
          SpeedDialChild(
            child: const Icon(Icons.play_arrow_outlined),
            backgroundColor: color,
            label: "Encender",
            onTap: () => _activarBanda(1),
          ),
          SpeedDialChild(
            child: const Icon(Icons.stop_outlined),
            backgroundColor: color,
            label: "Apagar",
            onTap: () => _activarBanda(0),
          ),
        ],
      ),
    );
  }
}
