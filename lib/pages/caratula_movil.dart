import 'package:app_web_tesis/pages/home_page.dart';
import 'package:flutter/material.dart';

class CaratulaMovil extends StatelessWidget {
  const CaratulaMovil({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 12);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                //height: windowsWidth<500? 250: 600,
                width: 200,
                child: Image.asset("lib/assets/images/logo_espe.png"),
              ),
              SizedBox(
                width: 150,
                child: Image.asset("lib/assets/images/logo_mecatronica.png"),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Text(
                      "CONSTRUCCIÓN DE MÓDULOS DIDÁCTICOS CON REDES DE SENSORES INALÁMBRICOS UTILIZANDO SISTEMAS CIBERFÍSICOS DENTRO DE UN PROCESO SECUENCIAL, PARA EL DESARROLLO DE PRÁCTICAS EN EL LABORATORIO DE MECATRÓNICA DE LA UNIVERSIDAD DE LAS FUERZAS ARMADAS ESPE.",
                      textAlign: TextAlign.justify,
                      style: style,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Trabajo de titulación, previo a la obtención del título de \nIngenieros en Mecatrónica",
                      textAlign: TextAlign.center,
                      style: style,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Autores: ",
                            style: style, textAlign: TextAlign.start),
                        SizedBox(height: 20),
                        Text(
                          "- Bryan Ruiz        ",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "- Darwin Carrillo            ",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(
                          title: 'LoRa Sensors'),
                    ),
                  );
                },
                child: const Text('Iniciar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
