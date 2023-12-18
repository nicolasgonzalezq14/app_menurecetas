import 'package:flutter/material.dart';
import 'package:food_recipe/Modle/recipe_model.dart';

class DetailScreen extends StatelessWidget {
  final RecipeModel recipe;

  // Constructor que recibe un objeto RecipeModel al inicializar la pantalla de detalles
  const DetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Devuelve un Scaffold que contiene una AppBar y un cuerpo con secciones de detalles del plato de comida
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Construye una sección para los ingredientes
              _buildSection('Ingredientes', recipe.ingredients),
              
              // Construye una sección para las instrucciones
              _buildSection('Instrucciones', recipe.instructions),
              
              // Construye una sección para las opciones adicionales
              _buildSection('Opciones Adicionales', recipe.optionalAdditions),
              
              // Construye una sección para el tiempo estimado de cocción
              _buildSection("Tiempo estimado", recipe.cook),
              
              // Construye una sección para el número de porciones
              _buildSection("Porciones", recipe.serve),
            ],
          ),
        ),
      ),
    );
  }

  // Función para construir una sección con un título y detalles
  Widget _buildSection(String title, List<String> details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Título de la sección
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        
        // Lista de detalles en la sección
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: details.map((detail) => _buildDetail(detail)).toList(),
        ),
        
        SizedBox(height: 16),
      ],
    );
  }

  // Función para construir un detalle en la sección
  Widget _buildDetail(String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text('• $detail'),
    );
  }
}
