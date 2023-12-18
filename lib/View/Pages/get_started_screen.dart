// Importaciones necesarias para el archivo
import 'package:app_menurecetas/View/Pages/Recipelist.dart';
import 'package:flutter/material.dart';
import 'package:app_menurecetas/Res/Components/app_color.dart';

// Clase que representa la pantalla de inicio
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro de la pantalla
      body: Stack(
        children: [
          const Image(
            image: AssetImage("assets/fondopantalla.jpg"), // Imagen de fondo
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [
                  0.2,
                  1,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.of(context).padding.top + 16,
              16,
              MediaQuery.of(context).padding.bottom + 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  "Nunca había sido \ntan fácil cocinar!", // Texto de bienvenida
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  "¡Descubre más de 1000 recetas de comida en tus manos y cocínalas fácilmente!", // Descripción
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 32),
                GestureDetector(
                  onTap: () {
                    // Navega a la lista de recetas cuando se toca el botón
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RecipesListHome()));
                  },
                  child: Container(
                    height: 66,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Comencemos", // Texto del botón
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

