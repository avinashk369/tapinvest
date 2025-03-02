import 'package:tapinvest/features/instrument/data/model/bond_detail.dart';

abstract class InstrumentRepository {
  Future<BondDetail> getBondDetail();
}
