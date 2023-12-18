import 'package:flutter/material.dart';

class DetailsAlllist extends StatelessWidget {
  final String title;
  final String summary;
  final String instructions;

  // Constructor que recibe el título y la descripción al inicializar la pantalla de detalles
  DetailsAlllist(
      {Key? key,
      required this.title,
      required this.summary,
      required this.instructions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Limpia las etiquetas HTML de la descripción
    String cleanedSummary = _stripHtmlTags(summary);
    String cleanedInstructions = _stripHtmlTags(instructions);

    // Divide la descripción en oraciones
    List<String> sentences = cleanedSummary.split('.');

    List<String> sentences2 = cleanedInstructions.split('.');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 235, 183, 43),
        centerTitle: true,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Muestra el título con estilo
              Text(
                'Título: $title',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              // Muestra el encabezado de la descripción
              Text(
                'Descripción:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
              Text(
                'Intrucciones: ',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
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
