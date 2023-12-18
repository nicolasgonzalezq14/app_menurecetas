// Importaciones necesarias
import 'package:flutter/material.dart';
import 'package:app_menurecetas/View/Pages/Details0fallrecipes.dart';

// Widget que representa una tarjeta de receta
class RecipeCard extends StatelessWidget {
  final String title;
  final String thumbnailUrl;

  // Constructor que recibe el título y la URL de la imagen en miniatura
  RecipeCard({
    required this.title,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Devuelve un contenedor que muestra la tarjeta de receta con una imagen de fondo y detalles
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Posicionamiento del título en el centro de la tarjeta con un efecto de vidrio borroso
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          // Posicionamiento de los detalles en la esquina inferior izquierda con un efecto de vidrio borroso
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Opciones para mostrar estrellas y tiempo de cocción (actualmente desactivadas)
                // Container(
                //   padding: EdgeInsets.all(5),
                //   margin: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //     color: Colors.black.withOpacity(0.4),
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.star,
                //         color: Colors.yellow,
                //         size: 18,
                //       ),
                //       SizedBox(width: 7),
                //       Text(rating),
                //     ],
                //   ),
                // ),
                // Container(
                //   padding: EdgeInsets.all(5),
                //   margin: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //     color: Colors.black.withOpacity(0.4),
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.schedule,
                //         color: Colors.yellow,
                //         size: 18,
                //       ),
                //       SizedBox(width: 7),
                //       Text(cookTime),
                //     ],
                //   ),
                // )
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}

// Clase que implementa una barra de búsqueda para recetas
class RecipeSearchDelegate extends SearchDelegate<String> {
  final List<Map<String, dynamic>> recipes;

  RecipeSearchDelegate(this.recipes);

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones de la barra de búsqueda (limpiar el campo de búsqueda)
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Botón de retorno atrás en la barra de búsqueda
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implementación de cómo mostrar los resultados de la búsqueda
    return Container(); // Marcador de posición, reemplazar con un widget de resultado real
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Lista de sugerencias basada en la consulta de búsqueda
    final suggestionList = query.isEmpty
        ? []
        : recipes
            .where((recipe) =>
                recipe['title']!.toLowerCase().contains(query.toLowerCase()))
            .toList();

    // Devuelve una lista de resultados sugeridos con función de navegación al seleccionar un elemento
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final recipe = suggestionList[index];
        final title = recipe['title'] as String?;

        return ListTile(
          title: Text(title ?? 'No Title'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailsAlllist(
                  title: title ?? 'No Title',
                  summary: recipe['summary'] as String? ?? 'No Summary',
                  instructions:
                      recipe['instructions'] as String? ?? 'No Instructions',
                  extendedIngredients:
                      recipe['extendedIngredients'] as List<String>,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
