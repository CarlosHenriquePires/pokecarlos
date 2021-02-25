class DetailPokemon {
  int id;
  int height;
  int weight;
  String species;
  String sprites;
  // String type;
  // String ability;
  // String descAbility;
  // String link;

  DetailPokemon(this.id, this.height, this.weight, this.species,
      this.sprites);

  DetailPokemon.fromJson(Map<String, dynamic> json):
          id = json['id'],
          height = json['height'],
          weight = json['weight'],
          species = json['species']['name'],
          sprites = json['sprites']['front_default'];


}