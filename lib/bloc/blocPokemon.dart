import 'dart:async';
import 'package:pokecarlos/api/apiResponse.dart';
import 'package:pokecarlos/models/pokemon.dart';
import 'package:pokecarlos/repositories/repositoryPokemon.dart';

class BlocPokemon{
  RepositoryPokemon repo;
  StreamController controller;

  // Entrada dos dados / Coletor de dados (stream)
  StreamSink<ApiResponse<ItemsPokemon>> get listPokemonSink => controller.sink;
  // Consumo/Saída dos dados
  Stream<ApiResponse<ItemsPokemon>> get listPokemonStream => controller.stream;

  Future<ApiResponse<ItemsPokemon>>fetchAllPokemon() async{
    controller = StreamController<ApiResponse<ItemsPokemon>>();
    repo = RepositoryPokemon();

    ApiResponse<ItemsPokemon> apiResp = new ApiResponse();
    apiResp.loading('Aguarde ...');
    controller.sink.add(apiResp);
    try{
      ItemsPokemon vehicles = await repo.fetchAllPokemonData();
      apiResp.completed(vehicles);
      controller.sink.add(apiResp);
    } catch(e){
      apiResp.error(e.toString());
      controller.sink.add(apiResp);
    }
  }

  dispose(){
    controller?.close();
  }

}

final bloc = BlocPokemon();


