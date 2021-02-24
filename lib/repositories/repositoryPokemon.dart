import 'package:pokecarlos/api/apiPokemon.dart';
import 'package:pokecarlos/models/pokemon.dart';

class RepositoryPokemon {
  final apiPokemon = ApiPokemon();

  Future<ItemsPokemon> fetchAllPokemonData() async {
    // final responsePokemon = await ApiPokemon().getAllPokemon();
    final responsePokemon = await apiPokemon.getAllPokemon();
    return ItemsPokemon.fromJson(responsePokemon);
  }

}