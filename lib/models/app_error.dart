import 'dart:convert';

class AppError implements Exception {
  final String _errorMessage;

  AppError(this._errorMessage);

  String get message {
    return jsonEncode({'Error': _errorMessage});
  }
}
