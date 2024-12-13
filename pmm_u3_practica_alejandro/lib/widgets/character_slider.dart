import 'package:flutter/material.dart';
import '../classes/starwars_provider.dart';
import 'package:provider/provider.dart';

/* 
  Classe CharacterSlider que mostra una galeria de personatges en un slider horitzontal interactiu.
  A l'emulador Android, aquest slider pot sortir de la pantalla, permetent navegar a través de tots els personatges lliscant horitzontalment.
  Cada element del slider mostra el nom del personatge, i quan es fa clic sobre un personatge, l'aplicació redirigeix a la seva pàgina de detalls,
  on es poden veure les seves dades específiques (nom, alçada, pes, etc.).
*/
class CharacterSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtenemos los personajes desde el Provider
    final characters = Provider.of<StarWarsProvider>(context).characters;

    return Container(
      height: 250, // Altura del slider
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return GestureDetector(
            onTap: () {
              // Navegar a la página de detalles
              Navigator.pushNamed(
                context,
                '/characterDetail',
                arguments: index, // Pasamos el índice del personaje
              );
            },
            child: Container(
              width: 150, // Ancho de cada tarjeta
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Imagen del personaje
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 190,
                      width: double
                          .infinity, // Asegura que se use todo el ancho disponible
                      color: Colors.grey[850],
                      child: Image.network(
                        character.imageUrl,
                        fit: BoxFit
                            .cover, // Asegura que la imagen llene el contenedor
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child; // Retorna la imagen cuando está completamente cargada
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey
                                .shade300, // Fondo claro para el placeholder de error
                            child: Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // Nombre del personaje
                  Text(
                    character.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
