import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/screens.dart';
import '../classes/starwars_provider.dart';

/* 
  Classe principal de l'aplicació.
  El mètode `main` és el punt d'entrada de l'aplicació Flutter.
  Aquí s'inicia l'aplicació i es configura el provider per a la gestió dels personatges de Star Wars.
  També s'especifica la configuració bàsica de l'aplicació com l'estructura de la UI i la connexió amb els dades del provider.
*/
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StarWarsProvider()..fetchCharacters(),  // Llama a fetchCharacters al iniciar
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Star Wars Universe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
          accentColor: Colors.amber,
          backgroundColor: Colors.grey[850],
        ).copyWith(
          secondary: Colors.amber,
          onPrimary: Colors.grey[900],
          onSecondary: Colors.grey[850],
        ),
        fontFamily: 'Starjedi',
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.grey[300]),
          bodyMedium: TextStyle(color: Colors.grey[300]),
          titleLarge: TextStyle(color: Colors.amber, fontFamily: 'Starjedi'),
        ),
        scaffoldBackgroundColor: Colors.grey[850],
      ),
      home: StarWarsCharacterScreen(),
      routes: {
        '/characterDetail': (context) => CharacterDetailPage(),
      },
    );
  }
}
