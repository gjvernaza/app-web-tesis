import 'package:flutter/material.dart';

import 'home_page.dart';

class Caratula extends StatelessWidget {
  const Caratula({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final windowsWidth = size.width;
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              SizedBox(
                //height: windowsWidth<500? 250: 600,
                width: 200,
                child: Image.asset("lib/assets/images/logo_espe.png"),
              ),

              SizedBox(
                //height: windowsWidth < 500 ? 300 : 600,
                width: 250,
                child: Image.asset("lib/assets/images/logo_mecatronica.png"),
              ),
              //const SizedBox(height: 20),
              Padding(
                padding: windowsWidth < 700
                    ? const EdgeInsets.only(left: 50, right: 50)
                    : const EdgeInsets.only(left: 150, right: 150),
                child: const Column(
                  children: [
                    Text(
                      "CONSTRUCCIÓN DE MÓDULOS DIDÁCTICOS CON REDES DE SENSORES INALÁMBRICOS UTILIZANDO SISTEMAS CIBERFÍSICOS DENTRO DE UN PROCESO SECUENCIAL, PARA EL DESARROLLO DE PRÁCTICAS EN EL LABORATORIO DE MECATRÓNICA DE LA UNIVERSIDAD DE LAS FUERZAS ARMADAS ESPE.",
                      textAlign: TextAlign.justify,
                      style: style,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Trabajo de titulación, previo a la obtención del título de \nIngenieros en Mecatrónica",
                      textAlign: TextAlign.center,
                      style: style,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 150, right: 150),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Autores: ",
                            style: style, textAlign: TextAlign.start),
                        SizedBox(height: 20),
                        Text(
                          "- Oso Homosexual        ",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "- Chino kwai            ",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(
                          title: 'Clasificadora del Oso homosexual'),
                    ),
                  );
                },
                child: const Text('Iniciar'),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
