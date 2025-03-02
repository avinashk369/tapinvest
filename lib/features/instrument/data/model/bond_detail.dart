import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tapinvest/features/instrument/data/model/financials_model.dart';
import 'package:tapinvest/features/instrument/data/model/issuer_details_model.dart';
import 'package:tapinvest/features/instrument/data/model/pros_and_cons_model.dart';
part 'bond_detail.freezed.dart';
part 'bond_detail.g.dart';

@freezed
class BondDetail with _$BondDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BondDetail({
    String? logo,
    String? companyName,
    String? description,
    String? isin,
    String? status,
    ProsAndConsModel? prosAndCons,
    FinancialsModel? financials,
    IssuerDetailsModel? issuerDetails,
  }) = _BondDetail;

  factory BondDetail.fromJson(Map<String, dynamic> json) =>
      _$BondDetailFromJson(json);
}
