import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pokecarlos/exceptions/appException.dart';

class ApiPokemon {

  Future<dynamic> getAllPokemon() async {
    var responseJson;
    try {
      http.Response response = await http
          .get('https://pokeapi.co/api/v2/pokemon', headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      });
      print(response.body);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('Sem conexão com a internet');
    }
    return responseJson;
  }

  Future<dynamic> getAllDetailPokemon(String url) async {
    var responseJson;
    try {
      http.Response response = await http
          .get(url, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      });
      // print(response.body);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('Sem conexão com a internet');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error na comunicação com o servidor, código do error:${response.statusCode}');
    }
  }
}
