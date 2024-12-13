import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../classes/starwars_provider.dart';
import 'package:provider/provider.dart';

/* 
  Classe CharacterSwiper que mostra una galeria de personatges en un swiper interactiu.
  Els personatges es poden seleccionar lliscant (arrastrant) a través de les imatges.
  Els personatges no seleccionats tenen un efecte de desvaniment (fade-in).
  Quan es fa clic sobre un personatge, l'aplicació ens redirigeix a la seva pàgina de detalls,
  on es poden veure les seves dades específiques (nom, alçada, pes, etc.).
*/
class CharacterSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtenemos los personajes desde el Provider
    final characters = Provider.of<StarWarsProvider>(context).characters;

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4, // Ajusta el alto
      child: Swiper(
        itemCount: characters.length,
        layout: SwiperLayout.STACK,
        itemWidth: MediaQuery.of(context).size.width * 0.6, // Ajusta el ancho
        itemHeight: MediaQuery.of(context).size.height * 0.35, // Ajusta el alto
        itemBuilder: (BuildContext context, int index) {
          final character = characters[index];
          return GestureDetector(
            onTap: () {
              // Navegar a la página de detalles
              Navigator.pushNamed(
                context,
                '/characterDetail', // Ruta para detalles del personaje
                arguments: index, // Pasamos el índice del personaje
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Espaciado
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: NetworkImage('https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png'), // Usar una URL para la imagen de carga
                  image: NetworkImage(character.imageUrl), // Usar NetworkImage para la imagen principal
                  fit: BoxFit.contain, // Ajuste para que la imagen se adapte al contenedor
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.network('https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png'), // Imagen fallback si hay error
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
