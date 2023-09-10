// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneModel _$PhoneModelFromJson(Map<String, dynamic> json) => PhoneModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      subTitle: json['sub_title'] as String?,
      picture: json['picture'] as String?,
      isBuy: json['is_buy'] as bool?,
      isNew: json['is_new'] as bool?,
    );

Map<String, dynamic> _$PhoneModelToJson(PhoneModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sub_title': instance.subTitle,
      'picture': instance.picture,
      'is_buy': instance.isBuy,
      'is_new': instance.isNew,
    };
