import 'package:equatable/equatable.dart';

class BasketEntity extends Equatable {
  final int? id;
  final String? images;
  final int? price;
  final String? title;

  BasketEntity({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, images, price, title];
}