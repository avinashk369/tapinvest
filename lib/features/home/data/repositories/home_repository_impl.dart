import 'package:injectable/injectable.dart';
import 'package:tapinvest/core/errors/server_error.dart';
import 'package:tapinvest/features/home/data/model/bonds_model.dart';
import 'package:tapinvest/features/home/domain/repositories/home_repository.dart';
import 'package:tapinvest/services/api_client.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final ApiClient apiClient;

  HomeRepositoryImpl({required this.apiClient});

  /// apip client would require here
  @override
  Future<List<BondsModel>> loadBonds() async {
    try {
      /// call load bonds api
      return (await apiClient.loadBonds()).data ?? [];
    } catch (error) {
      /// throw exception if any
      throw ServerError.withError(error: error);
    }
  }
}
