// Importaciones necesarias para el archivo
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_recipe/Modle/recipe_model.dart';
import 'package:food_recipe/Res/Components/Wigdet/recipe_item.dart';
import 'package:food_recipe/Res/Components/app_color.dart';
import 'package:food_recipe/View/Pages/Details_Screen.dart';
import 'package:food_recipe/View/Pages/Recipelist.dart';

// Clase que representa la pantalla principal (Home)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 0, 0), // Fondo rojo
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 24,
          bottom: MediaQuery.of(context).padding.bottom + 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Amantes de la comida", // Título principal
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppColor.primaryColor),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text("¿Qué vas a cocinar hoy?",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ),
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () {
                  // Navega a la lista de recetas cuando se toca el botón
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RecipesListHome()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.food_bank_rounded,
                      size: 50,
                      color: Colors.amber,
                    ),
                    Text(
                      "Ver todas las recetas",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColor.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("5 nuevas recetas aparecen en tus categorías.",
                            style:
                                TextStyle(color: Colors.white, fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mejor puntuadas",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 280,
              child: ListView.separated(
                itemCount: trandingRecipes.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                separatorBuilder: (_, __) {
                  return const SizedBox(width: 16);
                },
                itemBuilder: (context, index) {
                  final recipe = trandingRecipes[index];
                  return InkWell(
                      onTap: () {
                        // Navega a la pantalla de detalles cuando se toca una receta
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(recipe: recipe)));
                      },
                      child: RecipeItem(recipe: recipe, onTap: () {}));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Últimas recetas agregadas",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 280,
              child: ListView.separated(
                itemCount: latestRecipes.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                separatorBuilder: (_, __) {
                  return const SizedBox(width: 16);
                },
                itemBuilder: (context, index) {
                  final recipe = latestRecipes[index];
                  return InkWell(
                    onTap: () {
                      // Navega a la pantalla de detalles cuando se toca una receta
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(recipe: recipe)));
                    },
                    child: RecipeItem(
                      recipe: recipe,
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
