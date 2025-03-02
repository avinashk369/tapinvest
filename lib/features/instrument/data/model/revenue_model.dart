import 'package:freezed_annotation/freezed_annotation.dart';
part 'revenue_model.freezed.dart';
part 'revenue_model.g.dart';

@freezed
class RevenueModel with _$RevenueModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RevenueModel({String? month, int? value}) = _RevenueModel;
  factory RevenueModel.fromJson(Map<String, dynamic> json) =>
      _$RevenueModelFromJson(json);
}
