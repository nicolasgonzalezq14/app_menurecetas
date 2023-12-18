// Importaciones necesarias
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_recipe/Modle/recipe_model.dart';
import 'package:food_recipe/Res/Components/app_color.dart';

// Widget que representa un elemento de la lista de recetas
class RecipeItem extends StatelessWidget {
  final RecipeModel recipe;
  final VoidCallback onTap;

  // Constructor que recibe una receta y una función de retorno al ser presionado
  RecipeItem({required this.recipe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Devuelve un contenedor con una altura y ancho específicos, apilando varios widgets
    return SizedBox(
      height: 280,
      width: 220,
      child: Stack(
        children: [
          // Contenedor que muestra la imagen de la receta con bordes redondeados
          Container(
            height: 280,
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(recipe.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Posicionamiento de la categoría de la receta en la esquina superior izquierda con un efecto de vidrio
          Positioned(
            top: 8,
            left: 8,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    recipe.category,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          // Posicionamiento del nombre y detalles de la receta en la parte inferior izquierda con un efecto de vidrio
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nombre de la receta con un icono de marcador
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              recipe.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.white),
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Icon(
                            Icons.bookmark_outline,
                            size: 20,
                            color: Colors.white,
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Duración y porciones de la receta
                      Text(
                        "${recipe.duration} | ${recipe.serving}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
