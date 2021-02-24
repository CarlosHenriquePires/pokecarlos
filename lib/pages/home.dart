import 'package:flutter/material.dart';
import 'package:pokecarlos/api/apiPokemon.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Bem vindo!'),
            RaisedButton(child: Text('Vai!'), onPressed: (){
              ApiPokemon().getAllPokemon();
            })
          ],
        ),
      ),
    );
  }
}
