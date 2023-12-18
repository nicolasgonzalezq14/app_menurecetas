// Importaciones necesarias
import 'package:flutter/material.dart';
import 'package:app_menurecetas/Res/Components/Wigdet/Shimmer/shimmerwidget.dart';

// Página que muestra un ListView con elementos de Shimmer
class ShimmerPage extends StatefulWidget {
  const ShimmerPage({super.key});

  @override
  State<ShimmerPage> createState() => _ShimmerPageState();
}

class _ShimmerPageState extends State<ShimmerPage> {
  @override
  Widget build(BuildContext context) {
    // Devuelve un ListView.builder con 5 elementos Shimmer
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index){
        return buildFoodShimmer(); // Construye y devuelve un elemento Shimmer
      });
  }

  // Función que construye y devuelve un elemento Shimmer dentro de un ListTile
  Widget buildFoodShimmer()=> ListTile(
    title: ShimmerWidget.rectangular(height: 50), // Utiliza el widget ShimmerWidget para crear un efecto Shimmer
  );
}
