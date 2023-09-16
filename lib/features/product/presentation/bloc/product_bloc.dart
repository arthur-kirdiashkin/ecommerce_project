import 'package:ecommerce_project/application/ui/product/domain/repositories/product_repository.dart';
import 'package:ecommerce_project/application/ui/product/domain/usecases/get_all_products.dart';
import 'package:ecommerce_project/application/ui/product/presentation/bloc/product_event.dart';
import 'package:ecommerce_project/application/ui/product/presentation/bloc/product_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product_entity.dart';

// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   final OnePhoneRepository _onePhoneRepository;
//   ProductBloc(this._onePhoneRepository) : super(ProductInitialState()) {
//     on<ProductEvent>((event, emit) async{
//       emit(ProductLoadingState());
//       try {
//         final productPhone = await _onePhoneRepository.getPhone();
//       emit(ProductLoadedState(product: productPhone));
//       } catch (e) {
//         emit(ProductFailureState(message: 'Product Erroe'));
//       }

//     });
//   }
// }

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProducts getAllProducts;
  ProductBloc({required this.getAllProducts}) : super(ProductInitialState()) {
    on<ProductEvent>(
      (event, emit) async {
        emit(ProductLoadingState());

        List<ProductEntity> _productList = [];

        final _failureOrProductList = await getAllProducts.call();
        _failureOrProductList.fold(
            (failure) => ProductFailureState(message: 'Error'),
            (products) => _productList.addAll(products));
        emit(ProductLoadedState(product: _productList));
      },
    );
  }
}
