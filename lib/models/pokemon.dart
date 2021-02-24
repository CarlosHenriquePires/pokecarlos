class ItemsPokemon {
  List<Pokemon> listPokemons;

  ItemsPokemon.fromJson(Map<String, dynamic> json) {
    List<Pokemon> listTemp = [];
    for (int i = 0; i < json.length; i++) {
      Pokemon pokemon = new Pokemon(
        json[i]['name'],
        json[i]['url'],
        json['count']
      );
      listTemp.add(pokemon);
    }
    listPokemons = listTemp;
  }
}

class Pokemon {
  String name;
  String url;
  int count;

  Pokemon(this.name, this.url, this.count);
}
