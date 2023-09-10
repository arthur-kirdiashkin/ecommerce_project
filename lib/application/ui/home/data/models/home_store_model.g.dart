// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeStoreModel _$HomeStoreModelFromJson(Map<String, dynamic> json) =>
    HomeStoreModel(
      bestSellers: (json['best_sellers'] as List<dynamic>?)
          ?.map((e) => BestSellerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      phones: (json['phones'] as List<dynamic>?)
          ?.map((e) => PhoneModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeStoreModelToJson(HomeStoreModel instance) =>
    <String, dynamic>{
      'best_sellers': instance.bestSellers?.map((e) => e.toJson()).toList(),
      'phones': instance.phones?.map((e) => e.toJson()).toList(),
    };
