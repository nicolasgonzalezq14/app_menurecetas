// Importaciones necesarias para el archivo
import 'package:flutter/material.dart';

// Clase que representa la página del cajón de navegación
class DrawerPage extends StatefulWidget { 
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    // Crear y retornar un Drawer con una ListView que contiene elementos del cajón de navegación
    return Drawer(
      backgroundColor: Color.fromARGB(255, 180, 193, 196), // Color de fondo del cajón de navegación
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Encabezado del cajón de navegación
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff264a52), // Color de fondo del encabezado
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          // Elemento de configuración en el cajón de navegación
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Lógica para manejar la configuración
              Navigator.pop(context); // Cerrar el cajón de navegación
            },
          ),
          // Elemento de cierre de sesión en el cajón de navegación
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              // Lógica para manejar el cierre de sesión
              Navigator.pop(context); // Cerrar el cajón de navegación
            },
          ),
        ],
      ),
    );
  }
}
