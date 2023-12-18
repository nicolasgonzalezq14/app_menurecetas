// Clase que representa un modelo de lista de recetas.
class Recipes_List {
  // Propiedades de la receta.
  final String name;
  final String images;
  final String summary;

  // Constructor que inicializa las propiedades requeridas.
  Recipes_List({
    required this.name,
    required this.images,
    required this.summary,
  });

  // Constructor de fábrica que crea una instancia de Recipes_List a partir de un mapa JSON.
  factory Recipes_List.fromJson(dynamic json) {
    return Recipes_List(
      name: json['name'] as String? ?? 'Unknown Name',
      images: (json['images']?[0]?['hostedLargeUrl'] as String?) ??
          'Default Image URL',
      summary: json['summary'] as String? ?? 'Unknown Name',
    );
  }

  // Método estático que convierte una lista de datos (snapshot) en una lista de instancias de Recipes_List.
  static List<Recipes_List> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipes_List.fromJson(data);
    }).toList();
  }

  // Sobrescribe el método toString para proporcionar una representación en cadena de la instancia.
  @override
  String toString() {
    return 'Recipes_List {name: $name, images: $images}';
  }
}
