import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tapinvest/core/utils/api_const.dart';
import 'package:tapinvest/features/home/data/model/bonds_model.dart';
import 'package:tapinvest/features/instrument/data/model/bond_detail.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: ApiConst.baseUrl)
@injectable
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio, {@Named('baseUrl') String baseUrl}) = _ApiClient;

  @GET(ApiConst.loadBonds)
  Future<BondsModel> loadBonds();

  @GET(ApiConst.bondDetails)
  Future<BondDetail> getBondDetail();
}
