import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tapinvest/core/utils/api_const.dart';

@module
abstract class DioClient {
  @lazySingleton
  Dio get dio => _createDio();
}

Dio _createDio() {
  final dio = Dio();

  dio.options.baseUrl = ApiConst.baseUrl;
  dio.options.connectTimeout = const Duration(seconds: 15);
  dio.options.receiveTimeout = const Duration(seconds: 15);
  dio.options.headers = {'Content-Type': 'application/json'};

  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  return dio;
}
