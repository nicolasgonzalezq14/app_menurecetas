// Importaciones necesarias para el archivo
import 'package:flutter/material.dart';

// Método para construir un elemento de cuadrícula en el panel de administración
Widget buildGridItem(BuildContext context, icon, Color color, String label) {
  double baseWidth = 390;
  double fem = MediaQuery.of(context).size.width / baseWidth;

  // Construcción de un elemento de la cuadrícula con un ícono, un color y una etiqueta
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10 * fem),
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[Color(0xffffffff), Color(0x00f0d9d9)],
            stops: <double>[0, 1],
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 47.35 * fem,
            height: 57 * fem,
            child: Icon(icon, color: color, size: 50),
          ),
        ),
      ),

      SizedBox(height: 5),
      Text(label, textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
    ],
  );
}

// Método para construir la cuadrícula principal del panel de administración
Widget buildGridView(BuildContext context) {
  return GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 16.0,
    mainAxisSpacing: 16.0,
    padding: EdgeInsets.all(16.0),
    children: [
      // Elementos de la cuadrícula con distintos íconos, colores y etiquetas
      InkWell(
        onTap: () {
          // Agrega la lógica para navegar a la pantalla correspondiente
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Scene_three()));
        },
        child: buildGridItem(context, Icons.assignment, const Color.fromARGB(255, 3, 78, 5), "View All Records"),
      ),
      InkWell(onTap: () {
        // Agrega la lógica para navegar a la pantalla correspondiente
      },
        child: buildGridItem(context, Icons.edit, Colors.red, "Edit Profile"),
      ),
      InkWell(onTap: () {
        // Agrega la lógica para navegar a la pantalla correspondiente
      },
        child: buildGridItem(context, Icons.receipt, Colors.brown, "User Report"),
      ),
      InkWell(onTap: () {
        // Agrega la lógica para navegar a la pantalla correspondiente
      },
        child: buildGridItem(context, Icons.approval, Colors.red, "Leave Approval"),
      ),
      InkWell(
        onTap: () {
          // Agrega la lógica para navegar a la pantalla correspondiente
        },
        child: buildGridItem(context, Icons.report, Colors.black, "System Report"),
      ),
      InkWell(
        onTap: () {
          // Agrega la lógica para navegar a la pantalla correspondiente
        },
        child: buildGridItem(context, Icons.grade, Color.fromARGB(255, 218, 67, 47), "Grading System"),
      ),
    ],
  );
}
