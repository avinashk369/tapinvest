import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'bonds_model.freezed.dart';
part 'bonds_model.g.dart';

@freezed
class BondsModel with _$BondsModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BondsModel({
    String? logo,
    String? isin,
    String? rating,
    String? companyName,
    List<String>? tags,
    List<BondsModel>? data,
  }) = _BondsModel;
  factory BondsModel.fromJson(Map<String, dynamic> json) =>
      _$BondsModelFromJson(json);
}
