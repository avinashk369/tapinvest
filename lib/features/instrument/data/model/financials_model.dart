import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tapinvest/features/instrument/data/model/ebitda_model.dart';
import 'package:tapinvest/features/instrument/data/model/revenue_model.dart';
part 'financials_model.freezed.dart';
part 'financials_model.g.dart';

@freezed
class FinancialsModel with _$FinancialsModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FinancialsModel({
    List<EbitdaModel>? ebitda,
    List<RevenueModel>? revenue,
  }) = _FinancialsModel;
  factory FinancialsModel.fromJson(Map<String, dynamic> json) =>
      _$FinancialsModelFromJson(json);
}
