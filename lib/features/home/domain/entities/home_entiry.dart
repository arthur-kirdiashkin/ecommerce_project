import 'package:equatable/equatable.dart';
import '../../data/models/best_seller_store_model.dart';
import '../../data/models/phone_store_model.dart';

class HomeEntity extends Equatable {
  final List<BestSellerModel>? bestSeller;
  final List<PhoneModel>? homeStore;

  HomeEntity({
    required this.bestSeller,
    required this.homeStore,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [bestSeller, homeStore];
}
