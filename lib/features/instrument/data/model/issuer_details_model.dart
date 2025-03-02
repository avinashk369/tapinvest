import 'package:freezed_annotation/freezed_annotation.dart';
part 'issuer_details_model.freezed.dart';
part 'issuer_details_model.g.dart';

@freezed
class IssuerDetailsModel with _$IssuerDetailsModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory IssuerDetailsModel({
    String? issuerName,
    String? typeOfIssuer,
    String? sector,
    String? industry,
    String? issuerNature,
    String? cin,
    String? leadManager,
    String? registrar,
    String? debentureTrustee,
  }) = _IssuerDetailsModel;
  factory IssuerDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$IssuerDetailsModelFromJson(json);
}
