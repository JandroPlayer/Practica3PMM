import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'character.dart';

/* 
  Aquesta és la meva classe Provider que gestiona la càrrega de dades dels personatges de Star Wars des de l'API SWAPI.
  Aquesta classe utilitza el patró ChangeNotifier per notificar els canvis en l'estat de les dades als widgets que la utilitzen.
  Inclou un mètode `fetchCharacters` que fa una petició HTTP a l'API de SWAPI per obtenir la llista de personatges.
  Un cop obtinguda la resposta, els personatges es mapegen a una llista d'objectes `Character` que es poden utilitzar en la UI.
*/
class StarWarsProvider with ChangeNotifier {
  bool _isLoading = false;
  List<Character> _characters = [];

  bool get isLoading => _isLoading;
  List<Character> get characters => _characters;

  // Método para cargar los personajes
  Future<void> fetchCharacters() async {
    _isLoading = true;
    notifyListeners();

    // Aquí haces la solicitud HTTP para obtener los personajes
    final response = await http.get(Uri.parse('https://swapi.dev/api/people/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> results = data['results'];

      _characters = results.map((character) => Character.fromJson(character)).toList();
    } else {
      throw Exception('Failed to load characters');
    }

    _isLoading = false;
    notifyListeners();
  }
}