// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeStoreModel _$HomeStoreModelFromJson(Map<String, dynamic> json) =>
    HomeStoreModel(
      bestSeller: (json['best_seller'] as List<dynamic>?)
          ?.map((e) => BestSellerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      homeStore: (json['home_store'] as List<dynamic>?)
          ?.map((e) => PhoneModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeStoreModelToJson(HomeStoreModel instance) =>
    <String, dynamic>{
      'best_seller': instance.bestSeller?.map((e) => e.toJson()).toList(),
      'home_store': instance.homeStore?.map((e) => e.toJson()).toList(),
    };
