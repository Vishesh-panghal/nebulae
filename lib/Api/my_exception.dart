class MyException implements Exception {
  String title;
  String body;

  MyException({
    required this.title,
    required this.body,
  });

  @override
  String ToString() {
    return "$title:$body";
  }
}

class FetchDataException extends MyException {
  FetchDataException({required String body})
      : super(title: "Data Communication Error", body: body);
}

class BadRequestException extends MyException {
  BadRequestException({required String body})
      : super(title: "Invalid Request Error", body: body);
}

class UnAuthrisedException extends MyException {
  UnAuthrisedException({required String body})
      : super(title: "UnAuthorised Error", body: body);
}

class InvalidInputException extends MyException {
  InvalidInputException({required String body})
      : super(title: "Invalid Input", body: body);
}
