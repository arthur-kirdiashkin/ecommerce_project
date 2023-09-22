
import 'package:equatable/equatable.dart';

import '../../domain/entities/product_entity.dart';



abstract class ProductState extends Equatable{
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitialState extends ProductState{}

class ProductLoadingState extends ProductState{
  
}

class ProductLoadedState extends ProductState {
  final List<ProductEntity> product;

  const ProductLoadedState({required this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class ProductFailureState extends ProductState {
  final String message;

  const ProductFailureState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}