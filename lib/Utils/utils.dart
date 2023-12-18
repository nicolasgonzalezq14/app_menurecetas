// Importaciones necesarias
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

// Widget principal que muestra una animación de temblor en un cuadro con un mensaje de bienvenida
class Shake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Devuelve una aplicación con una barra de aplicaciones, fondo negro y un cuerpo central que contiene la animación de temblor
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Center(
          child: ShakeY(
            from: 100,
            duration: const Duration(seconds: 5),
            infinite: true,
            child: Square(),
          ),
        ),
      ),
    );
  }
}

// Widget que representa un cuadro con un mensaje de bienvenida
class Square extends StatelessWidget {
  const Square({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // Devuelve un contenedor con un margen, relleno, tamaño, decoración de gradiente y un texto centrado
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      width: 320,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment(0, -1),
          end: Alignment(0, 1),
          colors: <Color>[Color(0xffffffff), Color(0x00f0d9d9)],
          stops: <double>[0, 1],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Bienvenido a la APP de recetas de comida",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
