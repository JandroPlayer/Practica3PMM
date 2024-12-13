/* 
  Classe Character que representa un personatge de Star Wars, mapant les dades de la resposta JSON obtinguda 
  des de l'API de Star Wars mitjançant un procés similar a un "quicktype".
  Aquesta classe conté atributs específics del personatge com el nom, la imatge, l'any de naixement, el gènere, 
  el color dels ulls, l'alçada, el pes i el color de la pell. També inclou un constructor per inicialitzar aquests valors 
  i un mètode factory per crear instàncies de la classe a partir de dades JSON.
*/
class Character {
  String name;
  String imageUrl;
  String birthYear;
  String gender;
  String eyeColor;
  String height;
  String mass;
  String skinColor;

  Character({
    required this.name,
    required this.imageUrl,
    required this.birthYear,
    required this.gender,
    required this.eyeColor,
    required this.height,
    required this.mass,
    required this.skinColor,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json["name"],
        imageUrl: 'https://starwars-visualguide.com/assets/img/characters/${json['url'].split('/')[5]}.jpg',
        birthYear: json["birth_year"],
        gender: json["gender"],
        eyeColor: json["eye_color"],
        height: json["height"],
        mass: json["mass"],
        skinColor: json["skin_color"],
      );
}