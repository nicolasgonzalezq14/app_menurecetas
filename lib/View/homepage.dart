// Importaciones necesarias para el archivo
import 'package:flutter/material.dart';
import 'package:app_menurecetas/View/drawer.dart';
import 'package:app_menurecetas/View/ui.dart';

// Clase que representa la página del panel de administración
class AddminPage extends StatefulWidget {
  const AddminPage({super.key});

  @override
  State<AddminPage> createState() => _AddminPageState();
}

class _AddminPageState extends State<AddminPage> {
  // Estado interno para controlar el índice actual (puedes descomentar si lo necesitas)
  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Estructura básica de la página
    return Scaffold(
      backgroundColor: Color(0xff264a52), // Color de fondo de la página
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Color de fondo de la barra de aplicaciones
        centerTitle: true,
        title: Text(
          'Admin Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildGridView(context), // Método para construir el contenido principal
      ),
      drawer: DrawerPage(), // Cajón de navegación lateral
    );
  }
}
