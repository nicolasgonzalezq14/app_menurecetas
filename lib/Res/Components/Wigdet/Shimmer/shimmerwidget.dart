// Importaciones necesarias
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// Widget reutilizable para mostrar un efecto Shimmer
class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;

  // Constructor para un efecto Shimmer rectangular
  const ShimmerWidget.rectangular({
    this.width = double.infinity,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    // Devuelve un widget Shimmer.fromColors que envuelve un contenedor
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[700]!,       // Color base del efecto Shimmer
        highlightColor: Colors.grey[300]!,  // Color destacado del efecto Shimmer
        child: Container(
          width: width,                      // Ancho del contenedor
          height: height,                    // Altura del contenedor
          decoration: BoxDecoration(
            color: Colors.grey,               // Color del contenedor en caso de que el Shimmer no esté activo
            borderRadius: BorderRadius.circular(20),  // Borde redondeado del contenedor
          ),
        ),
      ),
    );
  }
}
