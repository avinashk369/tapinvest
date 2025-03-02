import 'package:freezed_annotation/freezed_annotation.dart';
part 'ebitda_model.freezed.dart';
part 'ebitda_model.g.dart';

@freezed
class EbitdaModel with _$EbitdaModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory EbitdaModel({String? month, int? value}) = _EbitdaModel;
  factory EbitdaModel.fromJson(Map<String, dynamic> json) =>
      _$EbitdaModelFromJson(json);
}
