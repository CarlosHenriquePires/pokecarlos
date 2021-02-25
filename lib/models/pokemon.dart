import 'package:pokecarlos/models/detailPokemon.dart';

class ItemsPokemon {
  List<Pokemon> listPokemons;

  ItemsPokemon.fromJson(Map<String, dynamic> json) {
    List<Pokemon> listTemp = [];
    for (int i = 0; i < json['results'].length; i++) {
      Pokemon pokemon = new Pokemon(
        json['results'][i]['name'],
        json['results'][i]['url'],
      );
      listTemp.add(pokemon);
    }
    listPokemons = listTemp;
  }
}

class Pokemon {
  String name;
  String url;
  DetailPokemon details;

  Pokemon(this.name, this.url);
}
