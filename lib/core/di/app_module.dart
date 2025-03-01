import 'package:injectable/injectable.dart';
import 'package:tapinvest/core/utils/api_const.dart';

@module
abstract class AppModule {
  @Named('baseUrl')
  String get baseUrl => ApiConst.baseUrl;
}
