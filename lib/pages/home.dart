import 'package:flutter/material.dart';
import 'package:pokecarlos/api/apiResponse.dart';
import 'package:pokecarlos/models/pokemon.dart';
import 'package:pokecarlos/bloc/blocPokemon.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Widget buildListPokemon(ItemsPokemon items) {
  return Container(
    height: 400,
    child: ListView.builder(
      itemCount: items.listPokemons.length,
      itemBuilder: (BuildContext context, int i) {
        return Card(
          child: Container(
            child: Column(
              children: [
                Text(items.listPokemons[i].name),
                Text(items.listPokemons[i].url),
              ],
            ),
          ),
        );
      },
    ),
  );
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    bloc.fetchAllPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder<ApiResponse<ItemsPokemon>>(
              stream: bloc.listPokemonStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case Status.LOADING:
                      return Center(child: CircularProgressIndicator());
                      break;
                    case Status.COMPLETED:
                      return buildListPokemon(snapshot.data.data);
                      break;
                    case Status.ERROR:
                      return Container(
                        child: Column(
                          children: [
                            Text(snapshot.data.message),
                            RaisedButton(
                                child: Text('Vai!'),
                                onPressed: () {
                                  setState(() {
                                    bloc.fetchAllPokemon();
                                  });
                                })
                          ],
                        ),
                      );
                      break;
                  }
                }
                return Container();
              })
        ],
      ),
    );
  }
}
