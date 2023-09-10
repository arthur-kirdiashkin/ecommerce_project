import 'package:ecommerce_project/application/ui/home/domain/entities/phone_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'phone_store_model.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PhoneModel extends PhoneEntity {
  PhoneModel(
      {required super.id,
      required super.title,
      required super.subTitle,
      required super.picture,
      required super.isBuy,
      required super.isNew});


  factory PhoneModel.fromJson(Map<String, dynamic> json) => _$PhoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneModelToJson(this);

  // Map<String, dynamic> toJson() => _$PhoneModelToJson(this);
  // factory PhoneModel.fromJson(Map<String, dynamic> json) {
  //   return PhoneModel(
  //     id: json['id'] as int,
  //     isNew: json['is_new'] ?? false,
  //     title: json['title'] as String,
  //     subTitle: json['subtitle'] as String,
  //     picture: json['picture'] as String,
  //     isBuy: json['is_buy'] as bool,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'is_new': isNew,
  //     'title': title,
  //     'subtitle': subTitle,
  //     'picture': picture,
  //     'is_buy': isBuy,

  //   };
  // }
}
