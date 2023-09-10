import 'package:ecommerce_project/application/ui/home/data/models/best_seller_store_model.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/phone_store_model.dart';

class HomeEntity extends Equatable {
  final BestSellerModel? bestSellers;
  final PhoneModel? phones;

  HomeEntity({
    required this.bestSellers,
    required this.phones,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [bestSellers, phones];
}
