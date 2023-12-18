// Importa el paquete 'material.dart' que contiene los widgets y herramientas básicas de Flutter.
import 'package:flutter/material.dart';

// Importa los archivos necesarios para las rutas y nombres de ruta de la aplicación.
import 'package:app_menurecetas/Res/Components/Routs/app_route_name.dart';
import 'package:app_menurecetas/Res/Components/Routs/routes.dart';

// Importa el tema de la aplicación.
import 'package:app_menurecetas/Res/Components/app_theme.dart';

// Función principal que se ejecuta al iniciar la aplicación.
void main() {
  // Lanza la aplicación creando y ejecutando una instancia de MyApp.
  runApp(const MyApp());
}

// Clase MyApp, que es un widget de aplicación principal.
class MyApp extends StatelessWidget {
  // Constructor constante de la clase MyApp.
  const MyApp({super.key});

  // Este widget es la raíz de tu aplicación.
  @override
  Widget build(BuildContext context) {
    // Retorna un MaterialApp, que es un contenedor para toda la aplicación Flutter.
    return MaterialApp(
      // Deshabilita el banner de depuración en la esquina superior derecha de la pantalla.
      debugShowCheckedModeBanner: false,
      
      // Define el título de la aplicación.
      title: "CocinaConmigo",

      // Establece el tema claro de la aplicación.
      theme: AppTheme.light,

      // Establece el tema oscuro de la aplicación.
      darkTheme: AppTheme.dark,

      // Establece el modo de tema de la aplicación.
      themeMode: ThemeMode.light,

      // Establece la ruta inicial de la aplicación.
      initialRoute: AppRouteName.getStarted,

      // Utiliza el generador de ruta personalizado para manejar las rutas de la aplicación.
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
