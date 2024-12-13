import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';
import '../classes/starwars_provider.dart';

/* 
  Aquesta és la meva pàgina principal (HomePage) que mostrarà els personatges de Star Wars en dues seccions interactives:
  un swiper i un slider. 
  El swiper permet veure els personatges com si fossin targetes apilades, i es pot navegar entre elles fent un swipe. 
  El slider mostra una galeria horitzontal de personatges amb el seu nom.
  Quan es fa clic sobre qualsevol personatge, l'aplicació redirigeix a una nova pàgina on es mostren les seves dades detallades.
*/
class StarWarsCharacterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accede al estado de StarWarsProvider
    final starWarsProvider = Provider.of<StarWarsProvider>(context);

    // Verifica si los datos están siendo cargados
    if (starWarsProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Star Wars Characters'),
          foregroundColor: Colors.amber,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Center(child: CircularProgressIndicator()), // Muestra el indicador de carga
      );
    }

    // Si los datos están disponibles, mostramos el contenido
    return Scaffold(
      appBar: AppBar(
        title: Text('Star Wars Characters'),
        foregroundColor: Colors.amber,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CharacterSwiper con los personajes cargados desde el proveedor
            CharacterSwiper(),
            SizedBox(height: 20),
            // CharacterSlider con los personajes cargados desde el proveedor
            CharacterSlider(),
          ],
        ),
      ),
    );
  }
}

