// Importación necesaria para el archivo
import 'package:flutter/material.dart';

// Clase que define colores utilizados en la aplicación
class AppColor {
  // Colores principales utilizados en la aplicación
  static Color primaryColor = const Color(0xFF45897A);
  static Color secondaryColor = const Color.fromARGB(255, 215, 170, 34);
  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF000000);
  static Color blackGrey = const Color.fromARGB(255, 39, 39, 39);
  static Color backgroundBlack = const Color.fromARGB(255, 37, 37, 37);
  static Color backgroundWhite = const Color.fromARGB(255, 255, 255, 255);
  static Color backgroundGray = const Color.fromARGB(255, 240, 240, 240);

  // MaterialColor para el color principal (utilizado para tonos de un solo color)
  static MaterialColor primarySwatch = const MaterialColor(
    0xFF45897A,
    {
      50: Color(0xFFa2c4bd),
      100: Color(0xFF8fb8af),
      200: Color(0xFF7daca2),
      300: Color(0xFF6aa195),
      400: Color(0xFF589587),
      500: Color(0xFF45897A),
      600: Color(0xFF3e7b6e),
      700: Color(0xFF376e62),
      800: Color(0xFF306055),
      900: Color(0xFF295249),
    },
  );
}
