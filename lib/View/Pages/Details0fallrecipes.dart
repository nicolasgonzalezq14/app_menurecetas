import 'package:flutter/material.dart';

class DetailsAlllist extends StatelessWidget {
  final String title;
  final String summary;
  final String instructions;
  final List<String> extendedIngredients;

  // Constructor que recibe el título, la descripción y las instrucciones al inicializar la pantalla de detalles
  DetailsAlllist(
      {Key? key,
      required this.title,
      required this.summary,
      required this.instructions,
      required this.extendedIngredients})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Limpia las etiquetas HTML de la descripción e instrucciones
    String cleanedSummary = _stripHtmlTags(summary);
    String cleanedInstructions = _stripHtmlTags(instructions);

    // Divide la descripción en oraciones
    List<String> sentences = cleanedSummary.split('.');
    List<String> sentences2 = cleanedInstructions.split('.');

    // Extraer los nombres de los ingredientes de las instrucciones

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 55, 68),
        centerTitle: true,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ingredientes:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              for (var i = 0; i < extendedIngredients.length; i++)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('• ${extendedIngredients[i]}',
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ),

              Text(
                'Descripción:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              // Muestra cada oración de la descripción con viñetas y estilo
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sentences.asMap().entries.map((entry) {
                  final index = entry.key;
                  final sentence = entry.value;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        if (index <
                            sentences.length -
                                1) // Comprueba si no es la última oración
                          Text(
                            '• ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            sentence.isNotEmpty ? sentence.trim() + '.' : '',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              // Muestra los nombres de los ingredientes

              // Muestra el encabezado de las instrucciones
              Text(
                'Instrucciones:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              // Muestra cada oración de las instrucciones con viñetas y estilo
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sentences2.asMap().entries.map((entry) {
                  final index = entry.key;
                  final sentence = entry.value;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        if (index <
                            sentences2.length -
                                1) // Comprueba si no es la última oración
                          Text(
                            '• ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            sentence.isNotEmpty ? sentence.trim() + '.' : '',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              // Agrega más detalles o widgets según sea necesario
            ],
          ),
        ),
      ),
    );
  }

  // Función para eliminar las etiquetas HTML del texto
  String _stripHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }
}
