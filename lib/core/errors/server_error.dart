import 'dart:convert';
import 'package:dio/dio.dart' hide Headers;
import 'package:tapinvest/core/utils/error_const.dart';

class ServerError implements Exception {
  late int _errorCode;
  String _errorMessage = '';

  ServerError.withError({required Object error}) {
    _handleError(error);
  }

  String get errorMessage => _errorMessage;
  int get errorCode => _errorCode;

  _handleError(Object error) {
    if (error is DioException) {
      _errorCode = error.response!.statusCode!;

      switch (error.type) {
        case DioExceptionType.cancel:
          _errorMessage = ErrorConst.requestCancelled;

        case DioExceptionType.connectionTimeout:
          _errorMessage = ErrorConst.connectionTimeout;

        case DioExceptionType.unknown:
          _errorMessage = ErrorConst.unexpectedValue;

        case DioExceptionType.receiveTimeout:
          _errorMessage = ErrorConst.receiveTimeout;

        case DioExceptionType.badResponse:
          final body = json.decode(error.response.toString());

          _errorMessage = body['message'] ?? ErrorConst.somethingWentWrong;

        case DioExceptionType.sendTimeout:
          _errorMessage = ErrorConst.timoutInSendRequest;

        case DioExceptionType.connectionError:
          _errorMessage = ErrorConst.connectionError;

        case DioExceptionType.badCertificate:
          _errorMessage = ErrorConst.badCertificate;
      }
      return _errorMessage;
    }
  }
}
