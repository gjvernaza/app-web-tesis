import 'package:app_web_tesis/pages/home_page_movil.dart';
import 'package:app_web_tesis/pages/responsive.dart';
import 'package:app_web_tesis/widgets/colores.dart';
import 'package:app_web_tesis/widgets/custom_drawer.dart';
import 'package:app_web_tesis/widgets/mostrar_alerta.dart';
import 'package:app_web_tesis/widgets/piezas_metalicas.dart';
import 'package:app_web_tesis/widgets/pizas_tamanio.dart';
import 'package:app_web_tesis/widgets/temp_humedad.dart';
import 'package:app_web_tesis/widgets/button_reset.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

//import '../services/read_data_firebase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _counterR = '';
  String _counterG = '';
  String _counterB = '';
  double _temperatura = 0;
  double _humedad = 0;
  String _counterMetalicas = '';
  String _counterNoMetalicas = '';
  String _alerta = '0';
  String _piezasP = '';
  String _piezasM = '';
  String _piezasG = '';

  final _database = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readData();
    //_resetContadores();
  }

  _readData() {
    _database.child('user1/contadorR').onValue.listen((event) {
      final dataR = event.snapshot.value.toString();
      setState(() {
        _counterR = dataR;
      });
    });
    _database.child('user1/contadorG').onValue.listen((event) {
      final dataG = event.snapshot.value.toString();
      setState(() {
        _counterG = dataG;
      });
    });
    _database.child('user1/contadorB').onValue.listen((event) {
      final dataB = event.snapshot.value.toString();
      setState(() {
        _counterB = dataB;
      });
    });
    _database.child('user1/temperatura').onValue.listen((event) {
      final dataTemp = event.snapshot.value.toString();
      setState(() {
        _temperatura = double.parse(dataTemp);
      });
    });
    _database.child('user1/humedad').onValue.listen((event) {
      final dataHume = event.snapshot.value.toString();
      setState(() {
        _humedad = double.parse(dataHume);
      });
    });
    _database.child('user1/counterMetalicas').onValue.listen((event) {
      final metalicas = event.snapshot.value.toString();
      setState(() {
        _counterMetalicas = metalicas;
      });
    });
    _database.child('user1/counterNoMetalicas').onValue.listen((event) {
      final noMetalicas = event.snapshot.value.toString();
      setState(() {
        _counterNoMetalicas = noMetalicas;
      });
    });
    _database.child('user1/alerta').onValue.listen((event) {
      final alerta = event.snapshot.value.toString();
      setState(() {
        _alerta = alerta;
      });
    });
    _database.child('user1/piezas_p').onValue.listen((event) {
      final piezasP = event.snapshot.value.toString();
      setState(() {
        _piezasP = piezasP;
      });
    });
    _database.child('user1/piezas_m').onValue.listen((event) {
      final piezasM = event.snapshot.value.toString();
      setState(() {
        _piezasM = piezasM;
      });
    });
    _database.child('user1/piezas_g').onValue.listen((event) {
      final piezasG = event.snapshot.value.toString();
      setState(() {
        _piezasG = piezasG;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final windowsWidth = size.width;
    return Scaffold(
      endDrawer: const CustomDrawer(),      
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        //actions: const [],
      ),
      body: windowsWidth < 400
          ? HomePageMovil(
              counterR: _counterR,
              counterG: _counterG,
              counterB: _counterB,
              counterMetalicas: _counterMetalicas,
              counterNoMetalicas: _counterNoMetalicas,
              alerta: _alerta,
              humedad: _humedad,
              temperatura: _temperatura,
              piezaP: _piezasP,
              piezaM: _piezasM,
              piezaG: _piezasG,
            )
          : SingleChildScrollView(
              padding: windowsWidth < 700
                  ? const EdgeInsets.only(left: 50)
                  : const EdgeInsets.only(right: 100),
              child: _alerta == '1'
                  ? const MostrarAlerta()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        windowsWidth > 700
                            ? const SizedBox(height: 80)
                            : const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            windowsWidth > 700
                                ? const Expanded(child: SizedBox())
                                : const Expanded(flex: 2, child: SizedBox()),

                            //  Colukna izquirda de colores
                            Colores(
                                counterR: _counterR,
                                counterG: _counterG,
                                counterB: _counterB),
                            const Expanded(child: SizedBox()),

                            // Columna piezas por tamaño
                            PiezasTamanio(
                              piezasP: _piezasP,
                              piezasM: _piezasM,
                              piezasG: _piezasG,
                            ),

                            const Expanded(child: SizedBox()),
                            //Columna central de piezas metálicas
                            if (windowsWidth > 700.0)
                              PiezasMetalicas(
                                  counterMetalicas: _counterMetalicas,
                                  counterNoMetalicas: _counterNoMetalicas),
                            const SizedBox(width: 10),

                            const Expanded(child: SizedBox()),
                            //Columna derecha de temperatura y humerdad
                            if (Responsive.isTablet(context) ||
                                Responsive.isDesktop(context))
                              TempHumedad(
                                  temperatura: _temperatura, humedad: _humedad),
                          ],
                        ),
                        const SizedBox(height: 30),
                        if (Responsive.isMobile(context) &&
                            windowsWidth < 500.0)
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: 100, left: 50, right: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PiezasMetalicas(
                                    counterMetalicas: _counterMetalicas,
                                    counterNoMetalicas: _counterNoMetalicas),
                                const SizedBox(height: 30),
                                TempHumedad(
                                    temperatura: _temperatura,
                                    humedad: _humedad),
                              ],
                            ),
                          ),
                        const SizedBox(height: 10),
                        if (Responsive.isMobile(context) && windowsWidth > 500)
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: 100, left: 50, right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PiezasMetalicas(
                                    counterMetalicas: _counterMetalicas,
                                    counterNoMetalicas: _counterNoMetalicas),
                                const Expanded(child: SizedBox()),
                                TempHumedad(
                                    temperatura: _temperatura,
                                    humedad: _humedad),
                              ],
                            ),
                          ),
                      ],
                    ),
            ),
      floatingActionButton: _alerta == '0'? 
                            windowsWidth > 400 ? 
                              const ButtonReset() : 
                              null:
                            null,
    );
  }
}
