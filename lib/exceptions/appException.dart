class AppException implements Exception{
  final message;
  final prefix;

  AppException([this.message,this.prefix]);

  String toString() {
    return "$prefix$message";
  }
}


class FetchDataException extends AppException{
  FetchDataException([message]) : super(message, 'Falha ao comunicar com o Servidor: ');
}

class UnauthorizedException extends AppException{
  UnauthorizedException([message]) : super(message, 'Sem Autorização: ');
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, 'Requisição Inválida: ');
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Dados Inválidos: ");
}