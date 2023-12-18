// Importaciones necesarias
import 'package:flutter/material.dart';
import 'package:app_menurecetas/Res/Components/Routs/app_route_name.dart';
import 'package:app_menurecetas/View/Pages/get_started_screen.dart';

// Clase que gestiona la generación de rutas para la aplicación.
class Routes {
  // Función estática que genera y devuelve la ruta correspondiente según la configuración proporcionada.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Argumentos de la ruta (no utilizados en este ejemplo).
    // ignore: unused_local_variable
    final argume = settings.arguments;

    // Switch para determinar la ruta actual y devolver la pantalla correspondiente.
    switch (settings.name) {
      case AppRouteName.getStarted:
        // Retorna una ruta que muestra la pantalla GetStartedScreen.
        return MaterialPageRoute(builder: (BuildContext) => GetStartedScreen());
      default:
        // Si la ruta no coincide con ninguna de las anteriores, por defecto muestra la pantalla GetStartedScreen.
        return MaterialPageRoute(builder: (_) {
          return GetStartedScreen();
        });
    }
  }
}
