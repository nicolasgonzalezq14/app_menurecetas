// Importaciones necesarias para el archivo
import 'package:flutter/material.dart';
import 'package:food_recipe/Modle/recipesApi.dart';
import 'package:food_recipe/Res/Components/Wigdet/Shimmer/shimmerwidget.dart';
import 'package:food_recipe/Res/Components/Wigdet/recipewigdet.dart';
import 'package:food_recipe/View/Pages/Details0fallrecipes.dart';

// Clase que representa la lista de recetas en la pantalla principal
class RecipesListHome extends StatefulWidget {
  const RecipesListHome({Key? key}) : super(key: key);

  @override
  State<RecipesListHome> createState() => _RecipesListHomeState();
}

class _RecipesListHomeState extends State<RecipesListHome> {
  late List<Map<String, dynamic>> _recipes = [];

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  // Método para cargar las recetas desde la API
  Future<void> _loadRecipes() async {
    final recipes = await RecipeApi.getRecipes();
    setState(() {
      _recipes = recipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff264a52), // Color de fondo
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0x00f0d9d9), // Color de fondo de la barra de aplicación
        title: Text('Recetas de comida'), // Título de la barra de aplicación
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final result = await showSearch(
                context: context,
                delegate: RecipeSearchDelegate(_recipes),
              );
              // Manejar el resultado de la búsqueda si es necesario
            },
          ),
        ],
      ),
      body: _recipes.isEmpty
          ? ListView.builder(
              itemCount: 1000,
              itemBuilder: (context, index) {
                return ListTile(
                  title: ShimmerWidget.rectangular(height: 200), // Efecto Shimmer para indicar carga
                );
              },
            )
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                final recipe = _recipes[index];
                final title = recipe['title'] as String?;
                final summary = recipe['summary'] as String?;
                final thumbnailUrl = recipe['image'] as String?;

                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailsAlllist(
                          title: title ?? 'No Title',
                          summary: summary ?? 'No Summary',
                        ),
                      ),
                    );
                  },
                  child: RecipeCard(
                    title: title ?? 'No Title',
                    thumbnailUrl: thumbnailUrl ?? 'No Image',
                  ),
                );
              },
            ),
    );
  }
}
