import 'package:ecommerce_project/application/ui/product/domain/repositories/one_phone_repository.dart';
import 'package:ecommerce_project/application/ui/product/presentation/bloc/product_event.dart';
import 'package:ecommerce_project/application/ui/product/presentation/bloc/product_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product_entity.dart';



class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final OnePhoneRepository _onePhoneRepository;
  ProductBloc(this._onePhoneRepository) : super(ProductInitialState()) {
    on<ProductEvent>((event, emit) async{
      emit(ProductLoadingState());
      try {
        final productPhone = await _onePhoneRepository.getPhone();
      emit(ProductLoadedState(product: productPhone));
      } catch (e) {
        emit(ProductFailureState(message: 'Product Erroe'));
      }
      
      
    });
  }
}