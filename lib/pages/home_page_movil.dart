import 'package:app_web_tesis/services/ui_provider.dart';
import 'package:app_web_tesis/widgets/bottom_custom.dart';
import 'package:app_web_tesis/widgets/button_reset.dart';
import 'package:app_web_tesis/widgets/colores.dart';
import 'package:app_web_tesis/widgets/mostrar_alerta.dart';
import 'package:app_web_tesis/widgets/piezas_metalicas.dart';
import 'package:app_web_tesis/widgets/pizas_tamanio.dart';
import 'package:app_web_tesis/widgets/temp_humedad.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageMovil extends StatelessWidget {
  final String counterR;
  final String counterG;
  final String counterB;
  final String counterMetalicas;
  final String counterNoMetalicas;
  final double temperatura;
  final double humedad;
  final String piezaP;
  final String piezaM;
  final String piezaG;

  final String alerta;

  const HomePageMovil({
    super.key,
    required this.counterR,
    required this.counterG,
    required this.counterB,
    required this.counterMetalicas,
    required this.counterNoMetalicas,
    required this.alerta,
    required this.temperatura,
    required this.humedad,
    required this.piezaP,
    required this.piezaM,
    required this.piezaG,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              alerta == '1'
                  ? const MostrarAlerta()
                  : _HomeBody(
                      counterR: counterR,
                      counterG: counterG,
                      counterB: counterB,
                      counterMetalicas: counterMetalicas,
                      counterNoMetalicas: counterNoMetalicas,
                      temperatura: temperatura,
                      humedad: humedad,
                      piezaP: piezaP,
                      piezaM: piezaM,
                      piezaG: piezaG,
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottonNavigatorBar(),
      floatingActionButton: alerta == '0' ? const ButtonReset() : null,
    );
  }
}

class _HomeBody extends StatelessWidget {
  final String counterR;
  final String counterG;
  final String counterB;
  final String counterMetalicas;
  final String counterNoMetalicas;
  final double temperatura;
  final double humedad;
  final String piezaP;
  final String piezaM;
  final String piezaG;

  const _HomeBody({
    required this.counterR,
    required this.counterG,
    required this.counterB,
    required this.counterMetalicas,
    required this.counterNoMetalicas,
    required this.temperatura,
    required this.humedad,
    required this.piezaP,
    required this.piezaM,
    required this.piezaG,
  });

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectMenuOpt;

    return SingleChildScrollView(
    padding: const EdgeInsets.only(top: 130),
      child: switch (currentIndex) {
        0 => Colores(
            counterR: counterR,
            counterG: counterG,
            counterB: counterB,
          ),
        1 => PiezasTamanio(
            piezasP: piezaP,
            piezasM: piezaM,
            piezasG: piezaG,
          ),
        2 => PiezasMetalicas(
            counterMetalicas: counterMetalicas,
            counterNoMetalicas: counterNoMetalicas,
          ),
        3 => TempHumedad(
            temperatura: temperatura,
            humedad: humedad,
          ),
        _ => Colores(
            counterR: counterR,
            counterG: counterG,
            counterB: counterB,
          )
      },
    );
  }
}
