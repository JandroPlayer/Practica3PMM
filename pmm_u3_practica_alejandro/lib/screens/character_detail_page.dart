import 'package:flutter/material.dart';
import '../classes/starwars_provider.dart';
import 'package:provider/provider.dart';

/* 
  Classe CharacterDetailPage que mostra els detalls d'un personatge de Star Wars.
  Aquesta pàgina presenta informació detallada com el nom, any de naixement, color dels ulls, alçada, pes, entre altres dades.
  També inclou una imatge del personatge.
  Quan un usuari fa clic en un personatge des del `CharacterSwiper` o `CharacterSlider`,
  l'aplicació el redirigeix a aquesta pàgina per veure més informació sobre el personatge seleccionat.
*/
class CharacterDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el índice del personaje seleccionado desde los argumentos de la ruta
    final int characterIndex = ModalRoute.of(context)?.settings.arguments as int;

    // Usamos el provider para obtener los personajes
    final character = Provider.of<StarWarsProvider>(context).characters[characterIndex];

    // Detalles del personaje en una lista
    final details = [
      'Birth Year: ${character.birthYear}',
      'Gender: ${character.gender}',
      'Eye Color: ${character.eyeColor}',
      'Height: ${character.height} cm',
      'Mass: ${character.mass} kg',
      'Skin Color: ${character.skinColor}',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name), // Título dinámico basado en el nombre
        foregroundColor: Colors.amber,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del personaje
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  character.imageUrl,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset('images/no-image.jpg', height: 300, fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Título de los detalles del personaje
            Text(
              'Character Details for ${character.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.grey),
            SizedBox(height: 10),

            // Detalles del personaje en un bucle
            ...details.map((detail) => Text(detail, style: TextStyle(fontSize: 18))).toList(),
          ],
        ),
      ),
    );
  }
}
