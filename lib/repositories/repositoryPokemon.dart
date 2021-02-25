import 'package:flutter/material.dart';
import 'package:pokecarlos/api/apiPokemon.dart';
import 'package:pokecarlos/models/detailPokemon.dart';
import 'package:pokecarlos/models/pokemon.dart';

class RepositoryPokemon {
  final apiPokemon = ApiPokemon();
  ItemsPokemon itemsPokemon;

  Future<ItemsPokemon> fetchAllPokemonData() async {
    // final responsePokemon = await ApiPokemon().getAllPokemon();
    final responsePokemon = await apiPokemon.getAllPokemon();
    itemsPokemon = ItemsPokemon.fromJson(responsePokemon);

    for (int i = 0; i < itemsPokemon.listPokemons.length; i++) {
      final responseDetailsPokemon = await apiPokemon
          .getAllDetailPokemon(itemsPokemon.listPokemons[i].url);
      itemsPokemon.listPokemons[i].details = DetailPokemon.fromJson(responseDetailsPokemon);
    }
    return itemsPokemon;
  }
}
