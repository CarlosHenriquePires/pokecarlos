// class ItemsPokemon{
//   List<DetailPokemon> listPokemons;
//
//   ItemsPokemon.fromJson(Map<String, dynamic> json){
//     List<DetailPokemon> listTemp = [];
//     for(int i =0; i<json.length; i++){
//       Pokemon pokemon = new Pokemon(
//           json[i]['id'],
//           json[i]['name'],
//           json[i]['height'],
//           json[i]['weight'],
//           json[i]['species'],
//           json[i]['sprites'],
//           json[i]['type']
//       );
//       listTemp.add(pokemon);
//     }
//     listPokemons = listTemp;
//   }
// }



class DetailPokemon {
  int id;
  String name;
  int height;
  int weight;
  String species;
  String sprites;
  String type;
  String ability;
  String descAbility;
  String link;

  DetailPokemon(this.id, this.name, this.height, this.weight, this.species,
      this.sprites, this.type, this.ability, this.descAbility, this.link);
}