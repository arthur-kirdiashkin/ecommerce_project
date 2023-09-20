import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/phone_entity.dart';
part 'phone_store_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PhoneModel extends PhoneEntity {
  const PhoneModel(
      {required super.id,
      required super.title,
      required super.subtitle,
      required super.picture,
      required super.isBuy,
      required super.isNew});

  factory PhoneModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneModelToJson(this);
}
