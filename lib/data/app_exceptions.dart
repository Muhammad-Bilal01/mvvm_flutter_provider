// AppException is a custom exception class that extends the built-in Exception class in Dart.
class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException(this._message, this._prefix);

// overridig the to String method
  @override
  String toString() {
    return "$_prefix $_message";
  }
}

// FetchDataException is a subclass of AppException.
// It's specifically designed to handle exceptions related to data fetching or communication errors.
class FetchDataException extends AppException {
  // The super keyword is used to call the constructor of the superclass (AppException)
  // and pass the error message and a fixed prefix, "Error During Communication."
  FetchDataException([String? message])
      : super(message, "Error During Communication");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid request");
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message])
      : super(message, "unauthorized request");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message, "Invalid input request");
}
