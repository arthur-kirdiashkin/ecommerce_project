import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

}

class ProductLoadEvent extends ProductEvent {
  const ProductLoadEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
