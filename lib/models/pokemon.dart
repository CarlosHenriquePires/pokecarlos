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

  Pokemon(this.name, this.url);
}
