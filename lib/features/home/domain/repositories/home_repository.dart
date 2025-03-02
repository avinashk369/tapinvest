import 'package:tapinvest/features/home/data/model/bonds_model.dart';

abstract class HomeRepository {
  Future<List<BondsModel>> loadBonds();
}
