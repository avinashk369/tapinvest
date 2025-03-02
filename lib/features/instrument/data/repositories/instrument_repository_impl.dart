import 'package:injectable/injectable.dart';
import 'package:tapinvest/core/errors/server_error.dart';
import 'package:tapinvest/features/instrument/data/model/bond_detail.dart';
import 'package:tapinvest/features/instrument/domain/repository/instrument_repository.dart';
import 'package:tapinvest/services/api_client.dart';

@Injectable(as: InstrumentRepository)
class InstrumentRepositoryImpl implements InstrumentRepository {
  final ApiClient apiClient;

  InstrumentRepositoryImpl({required this.apiClient});

  @override
  Future<BondDetail> getBondDetail() async {
    try {
      return await apiClient.getBondDetail();
    } catch (error) {
      throw ServerError.withError(error: error);
    }
  }
}
