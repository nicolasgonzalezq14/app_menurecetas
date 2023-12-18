// Importa el paquete 'dart:convert' para trabajar con la codificación y decodificación JSON.
import 'dart:convert';

// Importa el paquete 'http' para realizar solicitudes HTTP.
import 'package:http/http.dart' as http;

// Clase que define una API para obtener recetas.
class RecipeApi {
  // Método estático que devuelve una lista de recetas como mapas.
  static Future<List<Map<String, dynamic>>> getRecipes() async {
    // Clave de la API de Spoonacular. Reemplaza con tu propia clave.
    final apiKey = '020d52a176f940ccaea2fe4998cb4eff';

    // Realiza una solicitud GET a la API de Spoonacular para obtener recetas aleatorias.
    final response = await http.get(
      Uri.parse('https://api.spoonacular.com/recipes/random?apiKey=$apiKey&number=100'),
    );

    // Verifica si la solicitud fue exitosa (código de estado 200).
    if (response.statusCode == 200) {
      // Decodifica la respuesta JSON.
      Map<String, dynamic> data = jsonDecode(response.body);

      // Extrae la lista de recetas del mapa decodificado.
      List<dynamic> recipes = data['recipes'];

      // Convierte la lista de recetas en una lista de mapas y devuelve.
      return List<Map<String, dynamic>>.from(recipes);
    } else {
      // Si la solicitud falla, imprime un mensaje de error en la consola.
      print('Failed to load recipes. Status code: ${response.statusCode}');

      // Devuelve una lista vacía.
      return [];
    }
  }
}
