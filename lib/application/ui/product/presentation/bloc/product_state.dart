import 'package:ecommerce_project/application/ui/product/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';



abstract class ProductState extends Equatable{
  ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitialState extends ProductState{}

class ProductLoadingState extends ProductState{
  
}

class ProductLoadedState extends ProductState {
  final List<ProductEntity> product;

  ProductLoadedState({required this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class ProductFailureState extends ProductState {
  final String message;

  ProductFailureState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}